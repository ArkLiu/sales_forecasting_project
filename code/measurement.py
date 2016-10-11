import os
import sys

import pandas as pd

if __name__ == '__main__':
    path = "../forecast_data/"
    dirs = sorted([f for f in os.listdir(path) if not f.startswith('.')])

    df_list = []
    for f in dirs:
        df_list.append(pd.read_csv('{}/{}'.format(path, f)))

    for df in df_list:
        df.set_index(keys=[df.ITEM_NUMBER, df.BR_ID], drop=False, inplace=True)
    result = df_list[0].join(df_list[1], how='inner', rsuffix='_x')
    for df in df_list[2:]:
        result = result.join(df, how='inner', rsuffix='_x')
    result.reset_index(drop=True, inplace=True)
    result.drop([x for x in result.columns if '_x' in x], axis=1, inplace=1)
    actual = [x for x in result.columns if 'ACTUAL' in x]
    MSF = [x for x in result.columns if 'MSF' in x]
    RF = [x for x in result.columns if 'RF' in x]

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

    result['WEIGHT'] = result.apply(lambda x: 4 if x['RANK_A'] == 1 else 3 if x[
                                    'RANK_B'] == 1 else 2 if x['RANK_C'] == 1 else 1, axis=1)

    result['WEIGHT_MSF_MAD'] = result['WEIGHT'] * result['MSF_MAD']
    result['WEIGHT_RF_MAD'] = result['WEIGHT'] * result['RF_MAD']
