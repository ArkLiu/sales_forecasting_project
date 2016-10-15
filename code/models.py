import numpy as np
import pandas as pd


def transform(a, s):
    """combine two DataFrame from the sql result, and create serveral feature columns based on the previous sales history columns

    INPUT:
        a -- the also_fit DataFrame
        a -- the sales history DataFrame
    OUTPUT:
        X -- the features DataFrame for modelingalso

        y -- the result DataFrame for modeling
        output_df -- the DataFrame contains the product information
    """
    index_list = ['ITEM_NUMBER', 'BR_ID']
    X = pd.merge(a, s, how='inner', on=index_list)
    output_df = X.ix[:, ['PRODUCT_LINE', 'ITEM_NUMBER', 'ITEM_RANK', 'BR_ID'
                         ]]
    X.drop(['ITEM_NUMBER',
            'ITEM_RANK', 'CM'], axis=1, inplace=True)

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

    X['2M_6'] = X.ix[:, 'L12M':'L11M'].mean(axis=1)
    X['2M_5'] = X.ix[:, 'L10M':'L9M'].mean(axis=1)
    X['2M_4'] = X.ix[:, 'L8M':'L7M'].mean(axis=1)
    X['2M_3'] = X.ix[:, 'L6M':'L5M'].mean(axis=1)
    X['2M_2'] = X.ix[:, 'L4M':'L3M'].mean(axis=1)
    X['2M_1'] = X.ix[:, 'L2M':'L1M'].mean(axis=1)

    X['3M_4'] = X.ix[:, 'L12M':'L10M'].mean(axis=1)
    X['3M_3'] = X.ix[:, 'L9M':'L7M'].mean(axis=1)
    X['3M_2'] = X.ix[:, 'L7M':'L4M'].mean(axis=1)
    X['3M_1'] = X.ix[:, 'L3M':'L1M'].mean(axis=1)

    X['6M_2'] = X.ix[:, 'L12M':'L7M'].mean(axis=1)
    X['6M_1'] = X.ix[:, 'L6M':'L1M'].mean(axis=1)

    X['12M_M'] = X.ix[:, 'L12M':'L1M'].mean(axis=1)

    y = X.pop('NM')
    return X, y, output_df


def round_number(series):
    """convert the predicted result from float ro int

    INPUT:
        series -- the predicted series in float type
    OUTPUT:
        series -- the predicted series in int type
    """
    return series.apply(lambda x: int(round(x)))


class MovingAverages(object):
    """the moving-average (MA) model is a common approach for modeling univariate time series. The moving-average model specifies that the output variable depends linearly on the current and various past values of a stochastic (imperfectly predictable) term.
    """

    def __init__(self):
        self.X_test = pd.DataFrame()
        self.y_test = pd.Series()

    def fit(self, df):
        self.X_test = df
        self.y_test = self.X_test.mean(axis=1)

    def predict(self):
        return self.y_test


class Score(object):
    """the class to evaluate the performance between different forecast models
    """

    def __init__(self):
        self.X_test = pd.DataFrame()
        self.y_test = pd.Series()
        self.item_cols = ['RANK_A', 'RANK_B', 'RANK_C', 'RANK_D', 'RANK_N']

    def load_data(self, df, series):
        self.X_test = df
        self.y_test = series

    def rmse_score(self, y_pred):
        """root-mean-square error (RMSE)
        """
        y_pred = y_pred.apply(lambda x: round(x))
        return round(np.sqrt(((self.y_test - y_pred) ** 2).mean()), 3)

    def _rmse_score(self, y_true, y_pred):
        """root-mean-square error (RMSE)
        """
        y_pred = y_pred.apply(lambda x: round(x))
        return round(np.sqrt(((y_true - y_pred) ** 2).mean()), 3)

    def r2_score(self,  y_pred):
        """R-squared = 1 - (Explained variation / Total variation)
        """
        y_pred = y_pred.apply(lambda x: round(x))
        r2 = round(1 - (((self.y_test - y_pred)**2).sum() /
                        ((self.y_test - self.y_test.mean())**2).sum()), 3)
        return r2

    def adj_r2_score(self, y_pred):
        """the adjusted R-squared increases only if the new term improves the model more than would be expected by chance.
        """
        r2 = self.r2_score(y_pred)
        p, N = self.X_test.shape[1], self.X_test.shape[0]
        adj_r2 = round(1 - ((1 - r2) * (N - 1) / (N - p - 1)), 3)
        return adj_r2

    def item_rank_score(self, y_pred_1, y_pred_2):
        """display the rmse score by each item ranking from both model prediction
        """
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

if __name__ == '__main__':
    pass
