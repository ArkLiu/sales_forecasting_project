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
        return df.mean(axis=1).values


class Score(object):

    def __init__(self):
        pass

    def rmse_score(self, y_true, y_predict):
        return np.sqrt(((y_true - y_predict) ** 2).mean())

    def r2_score(self, y_true, y_predict):
        return 1 - (((y_true - y_predict)**2).sum() /
                    ((y_true - y_true.mean())**2).sum())

if __name__ == '__main__':
    pass
