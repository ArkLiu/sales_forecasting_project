"""
Assume "Month" to be the unit of time and, Last 12 Months Sales Data area Available and Relative Stable.

Then, Sales Forecast = Monthly Sales Forecast(MSF)
                     = Mean of Last 12 Months Sales

CLASSES:
    MSF --
    Assume "Month" to be the unit of time and, Last 12 Months Sales Data area Available and Relative Stable.
    Then, Sales Forecast = Monthly Sales Forecast(MSF)
                         = Mean of Last 12 Months Sales

FUNCTIONS:
    fit -- the DataFrame with last 12 month sales records
    strptime -- Calculates the time struct represented by the passed-in string

"""
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sb


class MSF(object):

    def __init__(self):
        pass

    def predict(self, df):
        return df.mean(axis=1)


class Score(object):

    def __init__(self):
        self.X_test = pd.DataFrame()
        self.y_test = pd.Series()
        self.item_cols = ['RANK_A', 'RANK_B', 'RANK_C', 'RANK_D', 'RANK_N']

    def load_data(self, df, series):
        self.X_test = df
        self.y_test = series

    def rmse_score(self, y_pred):
        y_pred = y_pred.apply(lambda x: round(x))
        return round(np.sqrt(((self.y_test - y_pred) ** 2).mean()), 3)

    def _rmse_score(self, y_true, y_pred):
        y_pred = y_pred.apply(lambda x: round(x))
        return round(np.sqrt(((y_true - y_pred) ** 2).mean()), 3)

    def r2_score(self,  y_pred):
        y_pred = y_pred.apply(lambda x: round(x))
        r2 = round(1 - (((self.y_test - y_pred)**2).sum() /
                        ((self.y_test - self.y_test.mean())**2).sum()), 3)
        return r2

    def _r2_score(self, y_true, y_pred):
        y_pred = y_pred.apply(lambda x: round(x))
        r2 = round(1 - (((y_true - y_pred)**2).sum() /
                        ((y_true - y_true.mean())**2).sum()), 3)
        return r2

    def adj_r2_score(self, y_pred):
        r2 = self.r2_score(y_pred)
        p, N = self.X_test.shape[1], self.X_test.shape[0]
        adj_r2 = round(1 - ((1 - r2) * (N - 1) / (N - p - 1)), 3)
        return adj_r2

    def item_rank_score(self, y_pred_1, y_pred_2):
        y_pred_1 = y_pred_1.apply(lambda x: round(x))
        y_pred_2 = y_pred_2.apply(lambda x: round(x))
        for col in self.item_cols:
            mask = self.X_test[col] == 1
            # mask 2 = model B is doing better than model A
            mask2 = abs(
                y_pred_1 - self.y_test) > abs(y_pred_2 - self.y_test)
            print col, ' Model A | Model B | TOTAL:{}'.format(mask.sum())
            print 'More Close:', mask.sum() - (mask & mask2).sum(), (mask & mask2).sum()
            print 'RMSE:',  self._rmse_score(self.y_test[mask], y_pred_1[mask]), self._rmse_score(self.y_test[mask], y_pred_2[mask])

    def hist(self, y_pred, label):
        y_pred = y_pred.apply(lambda x: round(x))
        diff = y_pred - self.y_test
        mask = (diff >= 50) | (diff <= -50)
        print "outlier: {}".format(mask.sum())
        # plt.hist(diff, bins=100, range=(-50, 50),
        #          histtype='step', normed=True, label=label)
        plt.hist(diff, bins=100, range=(-50, 50),
                 histtype='bar', stacked=True, label=label)

    def plot_2(self, y_pred_1, y_pred_2):
        y_pred_1 = y_pred_1.apply(lambda x: round(x))
        y_pred_2 = y_pred_2.apply(lambda x: round(x))
        x = range(len(self.y_test))
        plt.plot(x, y_pred_1 - self.y_test, c='r', label='model_1')
        plt.plot(x, y_pred_2 - self.y_test, c='g', label='model_2')
        plt.ylim(-50, 50)

if __name__ == '__main__':
    pass
