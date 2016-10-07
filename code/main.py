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
    y = X.pop('NM')
    return X, y

if __name__ == '__main__':
    also_fit_path = '../data/also_fit_clean.csv'
    # train_file_path = '../data/train_data_predict_2016_06_3m.csv'
    # test_file_path = '../data/test_data_predict_2016_07_1m.csv'
    train_file_path = '../data/predict_2016_02_1m.csv'
    test_file_path = '../data/predict_2016_04_1m.csv'

    # print "fitting train data"
    df_a = pd.read_csv(also_fit_path, low_memory=False)
    df_s = pd.read_csv(train_file_path, low_memory=False)
    X_train, y_train = transform(df_a, df_s)

    # print "fitting test data"
    df_a = pd.read_csv(also_fit_path, low_memory=False)
    df_s = pd.read_csv(test_file_path, low_memory=False)
    X_test, y_test = transform(df_a, df_s)

    model = RandomForestRegressor(n_estimators=10, n_jobs=-1)
    # model = GradientBoostingRegressor(n_estimators=100)

    model.fit(X_train, y_train)
    model_pred = model.predict(X_test)
    model_pred = pd.Series(model_pred)

    msf_X = X_test.ix[:, -12:]
    msf = MSF()
    msf_pred = msf.predict(msf_X)

    s = Score()
    s.load_data(X_test, y_test)
    print "MSF rmse_score: {}".format(s.rmse_score(y_test, msf_pred))
    print "model rmse_score: {}".format(s.rmse_score(y_test, model_pred))
    print "MSF r2_score: {}".format(s.r2_score(y_test, msf_pred))
    print "model r2_score: {}".format(s.r2_score(y_test, model_pred))
    print

    s.item_rank_score(msf_pred, model_pred)
    for x in sorted(zip(model.feature_importances_, X_train.columns), reverse=True)[:30]:
        print x[1], x[0]
