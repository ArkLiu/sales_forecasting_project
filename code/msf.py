import numpy as np
import pandas as pd


class MSF(object):

    def __init__(self):
        self.df = pd.DataFrame()
        self.make_list = []
        self.year_list = []

    def load_data(self, input_df):
        self.df = input_df

    def predict(self,input_df):
        pass
if __name__ == '__main__':
    pass
