import numpy as np
import pandas as pd


class AlsoFit(object):

    def __init__(self):
        self.df = pd.DataFrame()
        self.make_list = []
        self.year_list = []

    def load_data(self, input_df):
        self.df = input_df

    def _create_features(self, column_name):
        self.make_list = [str(x) for x in sorted(
            list(set(self.df[column_name].tolist())))]
        for col_name in self.make_list:
            self.df[col_name] = 0

    def _create_year_features(self, year):
        min_year = min(self.df[year].tolist())
        max_year = max(self.df[year].tolist())
        self.year_list = [str(x) for x in range(min_year, max_year + 1)]
        for year in self.year_list:
            self.df[year] = 0

    def transform(self):
        self._create_features('ALSO_FIT_MAKE')
        self._create_year_features('ALSO_FIT_YEAR')
        for make in self.make_list:
            print 'update {}'.format(make)
            self.df[make] = self.df.apply(
                lambda x: 1 if x['ALSO_FIT_MAKE'] == make else x[make], axis=1)
        for year in self.year_list:
            print 'update {}'.format(year)
            self.df[year] = self.df.apply(
                lambda x: 1 if str(x['ALSO_FIT_YEAR']) == year else
                x[year], axis=1)
        self.df.drop(
            labels=['ALSO_FIT_MAKE', 'ALSO_FIT_YEAR'], axis=1, inplace=True)
        self.df = self.df.groupby(by=['ITEM_NUMBER', 'ITEM_ADDED_YEAR']).sum()
        for index in self.df.index:
            self.df.ix[index, :] = self.df.ix[
                index, :].apply(lambda x: 1 if x != 0 else 0)
if __name__ == '__main__':
    pass
