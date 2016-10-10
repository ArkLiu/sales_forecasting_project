import numpy as np
import pandas as pd


class AlsoFit(object):

    def __init__(self):
        self.df = pd.DataFrame()
        self.make_list = []

    def load_data(self, input_df):
        self.df = input_df

    def _create_features(self, column_name):
        self.make_list = [str(x) for x in sorted(
            list(set(self.df[column_name].tolist())))]
        for col_name in self.make_list:
            self.df[col_name] = 0

    def transform(self):
        self._create_features('ALSO_FIT_MAKE')

        for make in self.make_list:
            self.df[make] = self.df.apply(
                lambda x: 1 if x['ALSO_FIT_MAKE'] == make else x[make], axis=1)

        self.df.drop(
            labels=['ALSO_FIT_MAKE'], axis=1, inplace=True)

        self.df = self.df.groupby(
            by=['PRODUCT_LINE', 'ITEM_NUMBER', 'ITEM_ADDED_MONTH', 'RANK_A', 'RANK_B', 'RANK_C', 'RANK_D', 'RANK_N', 'ALSO_FIT_YEAR_FROM', 'ALSO_FIT_YEAR_TO']).max()
if __name__ == '__main__':
    df = pd.read_csv('../data/also_fit_raw.csv')
    af = AlsoFit()
    af.load_data(df)
    af.transform()
    af.df.to_csv('../data/also_fit_clean.csv')
