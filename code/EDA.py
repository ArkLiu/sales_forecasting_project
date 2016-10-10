import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sb
from sklearn.ensemble import RandomForestRegressor

if __name__ == '__main__':

    sales_data_list = ['~/Dropbox/sales_data/201601.csv', '~/Dropbox/sales_data/201602.csv',
                       '~/Dropbox/sales_data/201603.csv', '~/Dropbox/sales_data/201604.csv', '~/Dropbox/sales_data/201605.csv', '~/Dropbox/sales_data/201606.csv']
    for s in sales_data_list:
        df_a = pd.read_csv('../data/also_fit_clean.csv')
        df_s = pd.read_csv(s)

        df_a.set_index(keys=df_a.ITEM_NUMBER, drop=False, inplace=True)
        df_s.set_index(keys=df_s.ITEM_NUMBER, drop=True, inplace=True)
        X = df_a.join(df_s, how='inner', rsuffix='_x')
        X.reset_index(drop=True, inplace=True)
        X.drop(['ITEM_NUMBER', 'ITEM_NUMBER_x', 'CM'], axis=1, inplace=True)
        X['L12-11_S'] = X.ix[:, 'L12M':'L11M'].sum(axis=1)
        X['L10-9_S'] = X.ix[:, 'L10M':'L9M'].sum(axis=1)
        X['L8-7M_S'] = X.ix[:, 'L9M':'L7M'].sum(axis=1)
        X['L6-5M_S'] = X.ix[:, 'L6M':'L5M'].sum(axis=1)
        X['L4-3_S'] = X.ix[:, 'L4M':'L3M'].sum(axis=1)
        X['L2-1_S'] = X.ix[:, 'L2M':'L1M'].sum(axis=1)

        X['Q4_S'] = X.ix[:, 'L12M':'L10M'].sum(axis=1)
        X['Q3_S'] = X.ix[:, 'L9M':'L7M'].sum(axis=1)
        X['Q2_S'] = X.ix[:, 'L7M':'L4M'].sum(axis=1)
        X['Q1_S'] = X.ix[:, 'L3M':'L1M'].sum(axis=1)

        X['L12-10_M'] = X.ix[:, 'L12M':'L11M'].mean(axis=1)
        X['L10-9_M'] = X.ix[:, 'L10M':'L9M'].mean(axis=1)
        X['L8-7_M'] = X.ix[:, 'L8M':'L7M'].mean(axis=1)
        X['L6-5_M'] = X.ix[:, 'L6M':'L5M'].mean(axis=1)
        X['L4-3_M'] = X.ix[:, 'L4M':'L3M'].mean(axis=1)
        X['L2-1_M'] = X.ix[:, 'L2M':'L1M'].mean(axis=1)

        X['Q4_M'] = X.ix[:, 'L12M':'L10M'].mean(axis=1)
        X['Q3_M'] = X.ix[:, 'L9M':'L7M'].mean(axis=1)
        X['Q2_M'] = X.ix[:, 'L7M':'L4M'].mean(axis=1)
        X['Q1_M'] = X.ix[:, 'L3M':'L1M'].mean(axis=1)
        X['12M_M'] = X.ix[:, 'L12M':'L1M'].mean(axis=1)
        y = X.pop('NM')

        model = RandomForestRegressor(n_jobs=-1)

        model.fit(X, y)

        for x in zip(model.feature_importances_, X.columns):
            print round(x[0], 3), x[1]
        print
        # remove last 6 Months
        x = xrange(len(X.columns))
        y = model.feature_importances_
        x_ticks = X.columns
        plt.xticks(x, x_ticks, rotation='vertical')
        plt.plot(x, y, label=s[-10:-4])
plt.legend()
plt.show()
