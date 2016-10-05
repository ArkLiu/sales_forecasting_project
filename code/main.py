import numpy as np
import pandas as pd
from sklearn.cross_validation import train_test_split
from sklearn.ensemble import RandomForestRegressor

from alsofit import AlsoFit

if __name__ == '__main__':
    # Generate also fit feature
    # df = pd.read_csv('../data/also_fit_raw.csv')
    # also_fit = AlsoFit()
    # also_fit.load_data(df)
    # also_fit.transform()
    # also_fit.df.to_csv('../data/also_fit_clean.csv')

    df_a = pd.read_csv('../data/also_fit_clean.csv')
    df_s = pd.read_csv('../data/sales_data_clean_9_train_period.csv')

    df_a.set_index(keys=df_a.ITEM_NUMBER, drop=False, inplace=True)
    df_s.set_index(keys=df_s.ITEM_NUMBER, drop=True, inplace=True)
    X = df_a.join(df_s, how='inner', rsuffix='_x')
    X.reset_index(drop=True, inplace=True)
    X.drop(['ITEM_NUMBER', 'ITEM_NUMBER_x'], axis=1, inplace=True)
    y = X.pop('CM')
    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.1)
    # X_train, X_test, y_train, y_test = train_test_split(
    #     X, y, test_size=0.1, random_state=42)
    rf = RandomForestRegressor(n_estimators=10)
    rf.fit(X_train, y_train)
    print 'RandomForestRegressor R2 Score: ', rf.score(X_test, y_test)
