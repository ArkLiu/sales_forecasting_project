import os

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sb
from sklearn.ensemble import GradientBoostingRegressor, RandomForestRegressor

from also_fit import AlsoFit
from forecast_models import MSF, Score


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
    X['L12-10_M'] = X.ix[:, 'L12M':'L11M'].mean(axis=1)
    X['L10-9_M'] = X.ix[:, 'L10M':'L9M'].mean(axis=1)
    X['L8-7_M'] = X.ix[:, 'L8M':'L7M'].mean(axis=1)
    X['L6-5_M'] = X.ix[:, 'L6M':'L5M'].mean(axis=1)
    X['L4-3_M'] = X.ix[:, 'L4M':'L3M'].mean(axis=1)
    X['L2-1_M'] = X.ix[:, 'L2M':'L1M'].mean(axis=1)
    #
    X['Q4_M'] = X.ix[:, 'L12M':'L10M'].mean(axis=1)
    X['Q3_M'] = X.ix[:, 'L9M':'L7M'].mean(axis=1)
    X['Q2_M'] = X.ix[:, 'L7M':'L4M'].mean(axis=1)
    X['Q1_M'] = X.ix[:, 'L3M':'L1M'].mean(axis=1)
    X['12M_M'] = X.ix[:, 'L12M':'L1M'].mean(axis=1)

    y = X.pop('NM')
    return X, y, output_df


def round_number(series):
    return series.apply(lambda x: int(round(x)))

if __name__ == '__main__':

    path = "../forecast_data/"
    dirs = sorted([f for f in os.listdir(path) if not f.startswith('.')])

    train_list = ['../sales_data/201511.csv',
                  '../sales_data/201512.csv',
                  '../sales_data/201601.csv',
                  '../sales_data/201602.csv',
                  '../sales_data/201603.csv', '../sales_data/201604.csv', '../sales_data/201605.csv',
                  '../sales_data/201606.csv', '../sales_data/201607.csv']
    test_list = ['../sales_data/201601.csv',
                 '../sales_data/201602.csv',        '../sales_data/201603.csv',        '../sales_data/201604.csv',        '../sales_data/201605.csv', '../sales_data/201606.csv', '../sales_data/201607.csv',
                 '../sales_data/201608.csv', '../sales_data/201609.csv']
    also_fit_path = '../data/also_fit_clean.csv'

    for files in zip(train_list, test_list):
        predict_date = '{}_{}'.format(files[1][-10:-6], files[1][-6:-4])

        df_a = pd.read_csv(also_fit_path, low_memory=False)
        df_s = pd.read_csv(files[0], low_memory=False)
        X_train, y_train, output_df = transform(df_a, df_s)

        df_a = pd.read_csv(also_fit_path, low_memory=False)
        df_s = pd.read_csv(files[1], low_memory=False)
        X_test, y_test, output_df = transform(df_a, df_s)

        model = RandomForestRegressor(n_estimators=500, n_jobs=-1)
        # model = GradientBoostingRegressor(n_estimators=1000)

        model.fit(X_train, y_train)
        model_pred = model.predict(X_test)
        model_pred = pd.Series(model_pred)

        msf_X = X_test.ix[:, 'L12M':'L1M']
        msf = MSF()
        msf_pred = msf.predict(msf_X)

        # s = Score()
        # s.load_data(X_test, y_test)
        # print "MSF rmse_score: {}".format(s.rmse_score(msf_pred))
        # print "model rmse_score: {}".format(s.rmse_score(model_pred))
        # print
        # print "MSF r2_score: {}".format(s.r2_score(msf_pred))
        # print "model r2_score: {}".format(s.r2_score(model_pred))
        # print "model adj_r2_score: {}".format(s.adj_r2_score(model_pred))
        # print
        # s.hist(msf_pred,'MSF')
        # # s.hist(model_pred,'RF')
        # s.plot_3(msf_pred, model_pred)
        # plt.legend()
        # plt.show()

        output_df['{}_ACTUAL'.format(predict_date)] = y_test
        output_df['{}_MSF_FORECAST'.format(
            predict_date)] = round_number(msf_pred)
        output_df['{}_RF_FORECAST'.format(
            predict_date)] = round_number(model_pred)

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
