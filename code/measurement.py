import os
from sys import argv

import numpy as np
import pandas as pd

if __name__ == '__main__':
    path = "../forecast_data/"
    index_list = ['PRODUCT_LINE', 'ITEM_NUMBER', 'ITEM_RANK', 'BR_ID']
    weight_dic = {'A': 3, 'B': 2, 'C': 1, 'D': 1, 'N': 3}
    dirs = sorted([f for f in os.listdir(path) if not f.startswith('.')])

    forecast_amount = int(argv[1]) if len(argv) > 1 else len(dirs)
    dirs = dirs[:forecast_amount]

    result = pd.read_csv('{}{}'.format(path, dirs[0]))
    result.set_index(
        keys=[result.ITEM_NUMBER, result.BR_ID], drop=False, inplace=True)

    for f in dirs[1:]:
        df = pd.read_csv('{}{}'.format(path, f))
        result = pd.merge(result, df, how='inner', on=index_list)

    actual = [x for x in result.columns if 'ACTUAL' in x]
    MSF = [x for x in result.columns if 'MSF' in x]
    RF = [x for x in result.columns if 'RF' in x]
    result['ACTUAL_SUM'] = result.ix[:, actual].sum(
        axis=1)
    pt_50 = np.percentile(result.ACTUAL_SUM, 50)
    pt_75 = np.percentile(result.ACTUAL_SUM, 75)

    result['MSF_AE'] = (result.ix[:, actual].sum(
        axis=1) - result.ix[:, MSF].sum(axis=1)) / len(actual)
    result['RF_AE'] = (result.ix[:, actual].sum(axis=1) -
                       result.ix[:, RF].sum(axis=1)) / len(actual)

    result['MSF_MAD'], result['RF_MAD'] = 0, 0

    for col in zip(actual, MSF):
        result['MSF_MAD'] += abs(result[col[0]] - result[col[1]])
    result['MSF_MAD'] /= len(dirs)

    for col in zip(actual, RF):
        result['RF_MAD'] += abs(result[col[0]] - result[col[1]])
    result['RF_MAD'] /= len(dirs)

    result['WEIGHT'] = 1
    result['WEIGHT'] = result.apply(
        lambda x: weight_dic[x['ITEM_RANK']], axis=1)

    result['WEIGHT_MSF_MAD'] = result['WEIGHT'] * result['MSF_MAD']
    result['WEIGHT_RF_MAD'] = result['WEIGHT'] * result['RF_MAD']

    result_pv = pd.pivot_table(result, values=['MSF_AE', 'RF_AE', 'MSF_MAD',  'RF_MAD'], index=[
        'PRODUCT_LINE', 'ITEM_RANK'], aggfunc=(np.mean, np.std))

    msf_pv = pd.pivot_table(result, values=['MSF_AE', 'MSF_MAD'], index=[
        'PRODUCT_LINE', 'ITEM_RANK'], aggfunc=(np.mean, np.std))

    rf_pv = pd.pivot_table(result, values=['RF_AE', 'RF_MAD'], index=[
        'PRODUCT_LINE', 'ITEM_RANK'], aggfunc=(np.mean, np.std))
