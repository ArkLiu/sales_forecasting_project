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
import numpy as np
import pandas as pd


class MSF(object):

    def __init__(self):
        pass

    def predict(self, df):
        return df.mean(axis=1)


class Score(object):

    def __init__(self):
        self.X_true = pd.DataFrame()
        self.y_true = pd.Series()
        self.item_cols = ['RANK_A', 'RANK_B', 'RANK_C', 'RANK_N']

    def load_data(self, df, series):
        self.X_true = df
        self.y_true = series

    def rmse_score(self, y_true, y_pred):
        return round(np.sqrt(((y_true - y_pred) ** 2).mean()), 3)

    def r2_score(self, y_true, y_pred):
        return round(1 - (((y_true - y_pred)**2).sum() /
                          ((y_true - y_true.mean())**2).sum()), 3)

    def item_rank_score(self, y_pred_1, y_pred_2):
        for col in self.item_cols:
            mask = self.X_true[col] == 1
            # mask 2 = model B is doing better than model A
            mask2 = abs(
                y_pred_1 - self.y_true) > abs(y_pred_2 - self.y_true)
            print col, ' Model A | Model B | TOTAL:{}'.format(mask.sum())
            print 'More Close:', mask.sum() - (mask & mask2).sum(), (mask & mask2).sum()
            print 'RMSE:',  self.rmse_score(self.y_true[mask], y_pred_1[mask]), self.rmse_score(self.y_true[mask], y_pred_2[mask])
if __name__ == '__main__':
    pass
