import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sb
from sklearn.ensemble import RandomForestRegressor

if __name__ == '__main__':

    sales_data_list = ['~/Dropbox/sales_data/201601.txt', '~/Dropbox/sales_data/201602.txt',
                       '~/Dropbox/sales_data/201603.txt', '~/Dropbox/sales_data/201604.txt', '~/Dropbox/sales_data/201605.txt', '~/Dropbox/sales_data/201606.txt', '~/Dropbox/sales_data/201607.txt', '~/Dropbox/sales_data/201608.txt', '~/Dropbox/sales_data/201609.txt']
    for s in sales_data_list:
        df_a = pd.read_csv('../data/also_fit_clean.csv')
        df_s = pd.read_csv(s)

        df_a.set_index(keys=df_a.ITEM_NUMBER, drop=False, inplace=True)
        df_s.set_index(keys=df_s.ITEM_NUMBER, drop=True, inplace=True)
        X = df_a.join(df_s, how='inner', rsuffix='_x')
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

        model = RandomForestRegressor(n_jobs=-1)

        model.fit(X, y)
        # remove last 6 Months
        x = xrange(len(X.columns[-20:]))
        y = model.feature_importances_[-20:]
        x_ticks = X.columns[-20:]
        plt.xticks(x, x_ticks, rotation='vertical')
        plt.plot(x, y, label=s[-10:-4])
plt.legend()
plt.show()
