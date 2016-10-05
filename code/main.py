import numpy as np
import pandas as pd

from alsofit import AlsoFit

if __name__ == '__main__':
    df = pd.read_csv('../data/also_fit_raw.csv')
    also_fit = AlsoFit()
    also_fit.load_data(df)
    also_fit.transform()
    also_fit.df.to_csv('../data/also_fit_clean.csv')
