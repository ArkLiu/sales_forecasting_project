import numpy as np
import pandas as pd
from sklearn.ensemble import GradientBoostingRegressor, RandomForestRegressor

from also_fit import AlsoFit
from forecast_models import MSF, Score

if __name__ == '__main__':

    # print "fitting train data"
    df_a = pd.read_csv('../data/also_fit_clean.csv', low_memory=False)
    df_s = pd.read_csv(
        '../data/train_data_predict_5br_2016_06_3m.csv', low_memory=False)
    df_a.set_index(keys=df_a.ITEM_NUMBER, drop=False, inplace=True)
    df_s.set_index(keys=df_s.ITEM_NUMBER, drop=True, inplace=True)
    X_train = df_a.join(df_s, how='inner', rsuffix='_x')
    X_train.reset_index(drop=True, inplace=True)
    X_train.drop(['ITEM_NUMBER', 'ITEM_NUMBER_x', 'CM'], axis=1, inplace=True)
    y_train = X_train.pop('NM')

    # print "fitting test data"
    df_a = pd.read_csv('../data/also_fit_clean.csv', low_memory=False)
    df_s = pd.read_csv(
        '../data/test_data_predict_5br_2016_07_1m.csv', low_memory=False)
    df_a.set_index(keys=df_a.ITEM_NUMBER, drop=False, inplace=True)
    df_s.set_index(keys=df_s.ITEM_NUMBER, drop=True, inplace=True)
    X_test = df_a.join(df_s, how='inner', rsuffix='_x')
    X_test.reset_index(drop=True, inplace=True)
    X_test.drop(['ITEM_NUMBER', 'ITEM_NUMBER_x', 'CM'], axis=1, inplace=True)
    y_test = X_test.pop('NM')

    model = RandomForestRegressor(n_estimators=50, n_jobs=-1)
    # model = GradientBoostingRegressor(n_estimators=100)

    model.fit(X_train, y_train)
    model_pred = model.predict(X_test)

    msf_X = X_test.ix[:, -12:]
    msf = MSF()
    msf_pred = msf.predict(msf_X)

    s = Score()
    print "MSF rmse_score: {}".format(s.rmse_score(y_test, msf_pred))
    print "model rmse_score: {}".format(s.rmse_score(y_test, model_pred))
    print
    print "MSF r2_score: {}".format(s.r2_score(y_test, msf_pred))
    print "model r2_score: {}".format(s.r2_score(y_test, model_pred))
    print
    for x in sorted(zip(X_train.columns, model.feature_importances_), reversed=True)[:10]:
        print x[0], x[1]
