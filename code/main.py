import os
from sys import argv

import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestRegressor

import models
import result
from forecast_models import MovingAverages

if __name__ == '__main__':

    # Remove old forecast data
    os.system("rm -r ../data_forecast/*.csv")

    path = "../data_sales/"
    output_path = "../data_forecast/"
    dirs = sorted([f for f in os.listdir(path) if not f.startswith('.')])

    also_fit = '../data_also_fit/also_fit_clean.csv'
    df_a = pd.read_csv(also_fit, low_memory=False)

    forecast_amount = int(argv[1]) if len(argv) > 1 else 0

    for train_file, test_file in zip(dirs[:-2], dirs[2:])[-1 * forecast_amount:]:

        predict_date = '{}_{}'.format(test_file[:4], test_file[4:6])

        df_s = pd.read_csv('{}{}'.format(path, train_file), low_memory=False)
        X_train, y_train, output_df = models.transform(df_a, df_s)

        df_s = pd.read_csv('{}{}'.format(path, test_file), low_memory=False)
        X_test, y_test, output_df = models.transform(df_a, df_s)

        rf = RandomForestRegressor(n_estimators=200, criterion='mae',
                                   min_samples_split=7, min_samples_leaf=7, max_features='log2', n_jobs=-1)

        rf.fit(X_train, y_train)
        rf_pred = pd.Series(rf.predict(X_test))

        msf = models.MovingAverages()
        msf.fit(X_test.ix[:, 'L12M':'L1M'])
        msf_pred = msf.predict()

        output_df['{}_ACTUAL'.format(predict_date)] = y_test
        output_df['{}_MSF_FORECAST'.format(
            predict_date)] = models.round_number(msf_pred)
        output_df['{}_RF_FORECAST'.format(
            predict_date)] = models.round_number(rf_pred)

        output_df.to_csv(
            '{}{}_forecast.csv'.format(output_path, predict_date), mode='w', index=False)
    result.run(output_path)
