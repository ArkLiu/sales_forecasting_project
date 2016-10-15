import os

import numpy as np
import pandas as pd


def run(predict_data_path):
    """Combine the prediction csv files into one dataframe with all historical sales records. Calculate the average(AE) and mean absolute deviation(MAD) for each item.

    AE -- A common measure of forecast bias
    MAD -- A common measure of forecast accuracy

    Formula:
        AE = y_true - y_prediction
        MAD = sum(abs(y_true - y_prediction)) / observed period

    """
    path = predict_data_path

    output_path = "../data_result/"
    os.system("rm {}result.csv".format(output_path))

    index_list = ['PRODUCT_LINE', 'ITEM_NUMBER', 'ITEM_RANK', 'BR_ID']

    dirs = sorted([f for f in os.listdir(path) if not f.startswith('.')])

    result = pd.read_csv('{}{}'.format(path, dirs[0]))
    result.set_index(
        keys=[result.ITEM_NUMBER, result.BR_ID], drop=False, inplace=True)

    # Merge all prediction csv files into one DataFrame
    for f in dirs[1:]:
        df = pd.read_csv('{}{}'.format(path, f))
        result = pd.merge(result, df, how='inner', on=index_list)

    # Calculate the AE and MAD
    actual = [x for x in result.columns if 'ACTUAL' in x]
    MSF = [x for x in result.columns if 'MSF' in x]
    RF = [x for x in result.columns if 'RF' in x]

    result['ACTUAL_SUM'] = result.ix[:, actual].sum(axis=1)
    cal_AE(result, actual, MSF, 'MSF_AE')
    cal_AE(result, actual, RF, 'RF_AE')

    result['MSF_MAD'], result['RF_MAD'] = 0, 0
    cal_MAD(result, actual, MSF, 'MSF_MAD')
    cal_MAD(result, actual, RF, 'RF_MAD')

    # Remove outlier from both prediction result
    mask_outlier = (result.RF_MAD < result.RF_MAD.mean() + result.RF_MAD.std()
                    * 3) & (result.MSF_MAD < result.MSF_MAD.mean() + result.MSF_MAD.std() * 3)

    result_pv = np.round(pd.pivot_table(result[mask_outlier], values=['MSF_AE', 'RF_AE', 'MSF_MAD',  'RF_MAD'], index=[
        'PRODUCT_LINE', 'ITEM_RANK'], aggfunc=(len, np.mean, np.std)), 3)
    result_pv.to_csv(
        '{}result.csv'.format(output_path), mode='w', index=True)


def cal_AE(df, actual_list, predict_list, column_label):
    """
    calculate AE
    INPUT:
        df -- the DataFrame hold all sales history data
        actual_list -- a list contains the column names for actual sales records
        predict_list -- a list contains the column names for predict sales records
        column_label -- the column name indicate where to save the result
    OUTPUT:
        None
    """
    df[column_label] = (df.ix[:, actual_list].sum(
        axis=1) - df.ix[:, predict_list].sum(axis=1)) / len(actual_list)


def cal_MAD(df, actual_list, predict_list, column_label):
    """
    calculate MAD
    INPUT:
        df -- the DataFrame hold all sales history data
        actual_list -- a list contains the column names for actual sales records
        predict_list -- a list contains the column names for predict sales records
        column_label -- the column name indicate where to save the result
    OUTPUT:
        None
    """
    for col in zip(actual_list, predict_list):
        df[column_label] += abs(df[col[0]] - df[col[1]])
    df[column_label] /= len(actual_list)

if __name__ == '__main__':
    pass
