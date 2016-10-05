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


class Scores(object):

    def __init__(self):
        self.X_test = None
        self.y_test = None
        self.y_pred_1 = None
        self.y_pred_2 = None

        self.r_sqrt_1 = None
        self.r_sqrt_1 = None

    def fit(self, X_test, y_test, y_pred_1, y_pred_2):
        self.X_test, self.y_test, self.y_pred_1, self.y_pred_2 = X_test, y_test, y_pred_1, y_pred_2

    def _calculate(self):
        pass
    def Scores

if __name__ == '__main__':
    pass
