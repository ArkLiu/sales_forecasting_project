import datetime
import os
from sys import argv
from time import time

import numpy as np
import pandas as pd
from scipy.stats import randint as sp_randint
from sklearn.ensemble import GradientBoostingRegressor, RandomForestRegressor
from sklearn.model_selection import GridSearchCV

from also_fit import AlsoFit
from forecast_models import MovingAverages, Score


def transform(a, b):
    index_list = ['ITEM_NUMBER', 'BR_ID']
    X = pd.merge(a, b, how='inner', on=index_list)
    output_df = X.ix[:, ['PRODUCT_LINE', 'ITEM_NUMBER', 'ITEM_RANK', 'BR_ID'
                         ]]
    X.drop(['ITEM_NUMBER',
            'ITEM_RANK', 'CM'], axis=1, inplace=True)

    X['L12-11_S'] = X.ix[:, 'L12M':'L11M'].sum(axis=1)
    X['L10-9_S'] = X.ix[:, 'L10M':'L9M'].sum(axis=1)
    X['L8-7M_S'] = X.ix[:, 'L9M':'L7M'].sum(axis=1)
    X['L6-5M_S'] = X.ix[:, 'L6M':'L5M'].sum(axis=1)
    X['L4-3_S'] = X.ix[:, 'L4M':'L3M'].sum(axis=1)
    X['L2-1_S'] = X.ix[:, 'L2M':'L1M'].sum(axis=1)
    #
    X['Q4_S'] = X.ix[:, 'L12M':'L10M'].sum(axis=1)
    X['Q3_S'] = X.ix[:, 'L9M':'L7M'].sum(axis=1)
    X['Q2_S'] = X.ix[:, 'L7M':'L4M'].sum(axis=1)
    X['Q1_S'] = X.ix[:, 'L3M':'L1M'].sum(axis=1)
    #
    X['2M_6'] = X.ix[:, 'L12M':'L11M'].mean(axis=1)
    X['2M_5'] = X.ix[:, 'L10M':'L9M'].mean(axis=1)
    X['2M_4'] = X.ix[:, 'L8M':'L7M'].mean(axis=1)
    X['2M_3'] = X.ix[:, 'L6M':'L5M'].mean(axis=1)
    X['2M_2'] = X.ix[:, 'L4M':'L3M'].mean(axis=1)
    X['2M_1'] = X.ix[:, 'L2M':'L1M'].mean(axis=1)

    X['3M_4'] = X.ix[:, 'L12M':'L10M'].mean(axis=1)
    X['3M_3'] = X.ix[:, 'L9M':'L7M'].mean(axis=1)
    X['3M_2'] = X.ix[:, 'L7M':'L4M'].mean(axis=1)
    X['3M_1'] = X.ix[:, 'L3M':'L1M'].mean(axis=1)

    X['6M_2'] = X.ix[:, 'L12M':'L7M'].mean(axis=1)
    X['6M_1'] = X.ix[:, 'L6M':'L1M'].mean(axis=1)

    X['12M_M'] = X.ix[:, 'L12M':'L1M'].mean(axis=1)

    y = X.pop('NM')
    return X, y, output_df


def round_number(series):
    return series.apply(lambda x: int(round(x)))


def print_time():
    return str(datetime.datetime.now())[:19]


def report(results, n_top=3):
    for i in range(1, n_top + 1):
        candidates = np.flatnonzero(results['rank_test_score'] == i)
        for candidate in candidates:
            print("Model with rank: {0}".format(i))
            print("Mean validation score: {0:.3f} (std: {1:.3f})".format(
                  results['mean_test_score'][candidate],
                  results['std_test_score'][candidate]))
            print("Parameters: {0}".format(results['params'][candidate]))
            print("")


if __name__ == '__main__':

    path = "../sales_data/"
    dirs = sorted([f for f in os.listdir(path) if not f.startswith('.')])

    also_fit = '../data/also_fit_clean.csv'
    df_a = pd.read_csv(also_fit, low_memory=False)

    forecast_amount = int(argv[1]) if len(argv) > 1 else 0

    for train_file, test_file in zip(dirs[:-2], dirs[2:])[-1 * forecast_amount:]:

        predict_date = '{}_{}'.format(test_file[:4], test_file[4:6])

        print "{} Predict {}".format(print_time(), predict_date)

        df_s = pd.read_csv('{}{}'.format(path, train_file), low_memory=False)
        X_train, y_train, output_df = transform(df_a, df_s)

        df_s = pd.read_csv('{}{}'.format(path, test_file), low_memory=False)
        X_test, y_test, output_df = transform(df_a, df_s)

        print "{} Fitting Start".format(print_time())
        model = RandomForestRegressor(n_jobs=-1)

        print "{} Fitting End".format(print_time())
        param_grid = {"n_estimators": [10, 50, 100, 200],
                      "max_features": ['auto', 'sqrt', 'log2'],
                      "min_samples_split": [1, 2, 3, 4, 5],
                      "min_samples_leaf": [1, 2, 3, 4, 5]
                      "bootstrap": [True, False]}
        # param_grid = {"n_estimators": [10],
        #               "max_features": ['auto', 'sqrt', 'log2', None],
        #               "max_depth": [3, 5, 7, 9, None],
        #               "min_samples_split": [1, 3, 5],
        #               "min_samples_leaf": [1, 3, 5],
        #               "bootstrap": [True, False]}

        # run grid search
        grid_search = GridSearchCV(model, param_grid=param_grid)
        start = time()
        grid_search.fit(X_train, y_train)
        print("GridSearchCV took %.2f seconds for %d candidate parameter settings." % (
            time() - start, len(grid_search.cv_results_['params'])))
        report(grid_search.cv_results_)
