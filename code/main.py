import numpy as np
import pandas as pd
from sklearn.ensemble import GradientBoostingRegressor, RandomForestRegressor

from also_fit import AlsoFit
from forecast_models import MSF, Score


def transform(a, b):
    a.set_index(keys=a.ITEM_NUMBER, drop=False, inplace=True)
    b.set_index(keys=b.ITEM_NUMBER, drop=True, inplace=True)
    X = a.join(b, how='inner', rsuffix='_x')
    X.reset_index(drop=True, inplace=True)
    X.drop(['ITEM_NUMBER', 'ITEM_NUMBER_x', 'CM'], axis=1, inplace=True)
    X['L12-10M'] = X.ix[:, 'L12M':'L11M'].mean(axis=1)
    X['L10-9M'] = X.ix[:, 'L10M':'L9M'].mean(axis=1)
    X['L8-7M'] = X.ix[:, 'L8M':'L7M'].mean(axis=1)
    X['L6-5M'] = X.ix[:, 'L6M':'L5M'].mean(axis=1)
    X['L14-3M'] = X.ix[:, 'L4M':'L3M'].mean(axis=1)
    X['L2-1M'] = X.ix[:, 'L2M':'L1M'].mean(axis=1)
    X['L12-10M'] = X.ix[:, 'L12M':'L10M'].mean(axis=1)
    X['L9-7M'] = X.ix[:, 'L9M':'L7M'].mean(axis=1)
    X['L7-4M'] = X.ix[:, 'L7M':'L4M'].mean(axis=1)
    X['L3-1M'] = X.ix[:, 'L3M':'L1M'].mean(axis=1)
    X['L12M_MEAN'] = X.ix[:, 'L12M':'L1M'].mean(axis=1)
    y = X.pop('NM')
    return X, y

if __name__ == '__main__':
    also_fit_path = '../data/also_fit_clean.csv'
    train_file_path = '~/Dropbox/sales_data/201605.txt'
    test_file_path  = '~/Dropbox/sales_data/201607.txt'

    # print "fitting train data"
    df_a = pd.read_csv(also_fit_path, low_memory=False)
    df_s = pd.read_csv(train_file_path, low_memory=False)
    # df_a = df_a[df_a.PRODUCT_LINE >= 2000]
    # df_s.drop(df_s.ix[:, 'L24M':'L13M'], axis=1, inplace=1)
    X_train, y_train = transform(df_a, df_s)

    # print "fitting test data"
    df_a = pd.read_csv(also_fit_path, low_memory=False)
    df_s = pd.read_csv(test_file_path, low_memory=False)
    # df_s.drop(df_s.ix[:, 'L24M':'L13M'], axis=1, inplace=1)
    X_test, y_test = transform(df_a, df_s)
    # df_a = df_a[df_a.PRODUCT_LINE >= 2000]
    model = RandomForestRegressor(n_estimators=10, n_jobs=-1)
    # model = GradientBoostingRegressor(n_estimators=1000)

    model.fit(X_train, y_train)
    model_pred = model.predict(X_test)
    model_pred = pd.Series(model_pred)

    msf_X = X_test.ix[:, 'L12M':'L1M']
    msf = MSF()
    msf_pred = msf.predict(msf_X)

    s = Score()
    s.load_data(X_test, y_test)
    print "MSF rmse_score: {}".format(s.rmse_score(y_test, msf_pred))
    print "model rmse_score: {}".format(s.rmse_score(y_test, model_pred))
    print "MSF r2_score: {}".format(s.r2_score(y_test, msf_pred))
    print "model r2_score: {}".format(s.r2_score(y_test, model_pred))
    print
    # Display top 30 important features
    s.item_rank_score(msf_pred, model_pred)
    for x in sorted(zip(model.feature_importances_, X_train.columns), reverse=True)[:30]:
        print round(x[0], 3), x[1]
