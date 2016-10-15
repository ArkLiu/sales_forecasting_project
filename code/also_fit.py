import numpy as np
import pandas as pd


class AlsoFit(object):

    def __init__(self):
        self.df = pd.DataFrame()
        self.make_list = []
        self.group_by_list = ['PRODUCT_LINE', 'ITEM_NUMBER', 'ITEM_RANK', 'BR_ID', 'AC_MONTH', 'RANK_A',
                              'RANK_B', 'RANK_C', 'RANK_D', 'RANK_N']

    def load_data(self, input_df):
        """load the DataFrame
        """
        self.df = input_df

    def _create_features(self, column_name):
        """Convert categorical variable into dummy variables

        INPUT:
            column_name -- string
        OUTPUT:
            None
        """

        self.make_list = [str(x) for x in sorted(
            list(set(self.df[column_name].tolist())))]
        for col_name in self.make_list:
            self.df[col_name] = 0

    def transform(self):
        """aggregate the product related information from also_fit_raw.csv into one records per product

        INPUT:
            None
        OUTPUT:
            None
        """

        self._create_features('ALSO_FIT_MAKE')

        for make in self.make_list:
            self.df[make] = self.df.apply(
                lambda x: 1 if x['ALSO_FIT_MAKE'] == make else x[make], axis=1)

        self.df.drop(
            labels=['ALSO_FIT_MAKE'], axis=1, inplace=True)
        year_from = self.df.groupby(self.group_by_list)[
            'ALSO_FIT_YEAR_FROM'].min()
        self.df = self.df.groupby(self.group_by_list).max()
        self.df['ALSO_FIT_YEAR_FROM'] = year_from

if __name__ == '__main__':
    df = pd.read_csv('../data_also_fit/also_fit_raw.csv')
    af = AlsoFit()
    af.load_data(df)
    af.transform()
    af.df.to_csv('../data_also_fit/also_fit_clean.csv', mode='w', index=True)
