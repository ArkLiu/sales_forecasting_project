
import datetime
import os
from sys import argv
from time import time

import numpy as np
import pandas as pd
from scipy.stats import randint as sp_randint
from sklearn.ensemble import GradientBoostingRegressor, RandomForestRegressor

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

if __name__ == '__main__':

    # Remove old forecast data
    os.system("rm -r ../forecast_data/*.csv")

    path = "../sales_data/"
    dirs = sorted([f for f in os.listdir(path) if not f.startswith('.')])

    also_fit = '../data/also_fit_clean.csv'
    df_a = pd.read_csv(also_fit, low_memory=False)

    forecast_amount = int(argv[1]) if len(argv) > 1 else 0

    for train_file, test_file in zip(dirs[:-2], dirs[2:])[-1 * forecast_amount:]:

        predict_date = '{}_{}'.format(test_file[:4], test_file[4:6])

        df_s = pd.read_csv('{}{}'.format(path, train_file), low_memory=False)
        X_train, y_train, output_df = transform(df_a, df_s)

        df_s = pd.read_csv('{}{}'.format(path, test_file), low_memory=False)
        X_test, y_test, output_df = transform(df_a, df_s)

        rf = RandomForestRegressor(n_estimators=100, max_features='log2',
                                   min_samples_split=7, min_samples_leaf=7, n_jobs=-1)

        rf.fit(X_train, y_train)
        rf_pred = pd.Series(rf.predict(X_test))

        msf = MovingAverages()
        msf.fit(X_test.ix[:, 'L12M':'L1M'])
        msf_pred = msf.predict()

        ma_9 = MovingAverages()
        ma_9.fit(X_test.ix[:, 'L9M':'L1M'])
        ma_9_pred = ma_9.predict()

        # sco = Score()
        # sco.load_data(X_test, y_test)
        # print "MSF rmse_score: {}".format(sco.rmse_score(msf_pred))
        # print "model rmse_score: {}".format(sco.rmse_score(rf_pred))
        # print
        # print "MSF r2_score: {}".format(sco.r2_score(msf_pred))
        # print "model r2_score: {}".format(sco.r2_score(model_pred))
        # print "model adj_r2_score: {}".format(sco.adj_r2_score(model_pred))
        # print

        output_df['{}_ACTUAL'.format(predict_date)] = y_test
        output_df['{}_MSF_FORECAST'.format(
            predict_date)] = round_number(msf_pred)
        output_df['{}_MA_9_FORECAST'.format(
            predict_date)] = round_number(ma_9_pred)
        output_df['{}_RF_FORECAST'.format(
            predict_date)] = round_number(rf_pred)

        output_df.to_csv(
            '../forecast_data/{}_forecast.csv'.format(predict_date), mode='w', index=False)

        # s.item_rank_score(msf_pred, model_pred)

        # Display top 30 important features
        # for x in sorted(zip(model.feature_importances_, X_train.columns), reverse=True)[:30]:
        #     print round(x[0], 3), x[1]
        # print

        # Plot feature important
        # x = xrange(len(X_test.columns))
        # y = model.feature_importances_
        # x_ticks = X_test.columns
        # plt.xticks(x, x_ticks, rotation='vertical')
        # plt.plot(x, y)
        # plt.show()
