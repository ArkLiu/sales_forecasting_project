import numpy as np
import pandas as pd
from sklearn.cross_validation import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import KFold, cross_val_score

from alsofit import AlsoFit

if __name__ == '__main__':
    # Generate also fit feature
    # df = pd.read_csv('../data/also_fit_raw.csv')
    # also_fit = AlsoFit()
    # also_fit.load_data(df)
    # also_fit.transform()
    # also_fit.df.to_csv('../data/also_fit_clean.csv')

    df_a_1 = pd.read_csv('../data/also_fit_clean_1yr_bin.csv')
    df_a_2 = pd.read_csv('../data/also_fit_clean_5yr_bin.csv')
    df_a_3 = pd.read_csv('../data/also_fit_clean_10yr_bin.csv')
    df_s = pd.read_csv('../data/6m.csv')

    df_a_1.set_index(keys=df_a_1.ITEM_NUMBER, drop=False, inplace=True)
    df_a_2.set_index(keys=df_a_2.ITEM_NUMBER, drop=False, inplace=True)
    df_a_3.set_index(keys=df_a_3.ITEM_NUMBER, drop=False, inplace=True)
    df_s.set_index(keys=df_s.ITEM_NUMBER, drop=True, inplace=True)
    X_1 = df_a_1.join(df_s, how='inner', rsuffix='_x')
    X_2 = df_a_2.join(df_s, how='inner', rsuffix='_x')
    X_3 = df_a_3.join(df_s, how='inner', rsuffix='_x')
    X_1.reset_index(drop=True, inplace=True)
    X_2.reset_index(drop=True, inplace=True)
    X_3.reset_index(drop=True, inplace=True)
    X_1.drop(['ITEM_NUMBER', 'ITEM_NUMBER_x'], axis=1, inplace=True)
    X_2.drop(['ITEM_NUMBER', 'ITEM_NUMBER_x'], axis=1, inplace=True)
    X_3.drop(['ITEM_NUMBER', 'ITEM_NUMBER_x'], axis=1, inplace=True)
    y_1 = X_1.pop('CM')
    y_2 = X_2.pop('CM')
    y_3 = X_3.pop('CM')

    rf = RandomForestRegressor(n_estimators=10)

    k_fold = KFold(n_splits=10, shuffle=True)
    cvs = cross_val_score(rf, X_1, y_1, cv=k_fold, n_jobs=-1)
    # cvs = cross_val_score(rf, X.ix[:,-12:], y, cv=k_fold, n_jobs=-1)
    print cvs
    print cvs.mean()
    print cvs.std()

    cvs = cross_val_score(rf, X_2, y_2, cv=k_fold, n_jobs=-1)
    # cvs = cross_val_score(rf, X.ix[:,-12:], y, cv=k_fold, n_jobs=-1)
    print cvs
    print cvs.mean()
    print cvs.std()

    cvs = cross_val_score(rf, X_3, y_3, cv=k_fold, n_jobs=-1)
    # cvs = cross_val_score(rf, X.ix[:,-12:], y, cv=k_fold, n_jobs=-1)
    print cvs
    print cvs.mean()
    print cvs.std()

    # rfr = RandomForestRegressor()
    # rfr.fit(X, y)
    # print rfr.feature_importances_
