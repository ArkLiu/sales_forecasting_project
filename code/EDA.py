import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
# import seaborn as sb
from sklearn.ensemble import RandomForestRegressor

df_a = pd.read_csv('../data/also_fit_clean.csv')
df_s = pd.read_csv('../data/train_data_predict_2016_06_3m.csv')

df_a.set_index(keys=df_a.ITEM_NUMBER, drop=False, inplace=True)
df_s.set_index(keys=df_s.ITEM_NUMBER, drop=True, inplace=True)
X = df_a.join(df_s, how='inner', rsuffix='_x')
X.reset_index(drop=True, inplace=True)
X.drop(['ITEM_NUMBER', 'ITEM_NUMBER_x', 'CM'], axis=1, inplace=True)
y = X.pop('NM')

model = RandomForestRegressor()

model.fit(X, y)

x = xrange(len(X.columns))
y = model.feature_importances_
x_ticks = X.columns
# plt.xticks(x, x_ticks, rotation='vertical')
plt.plot(x, y)
plt.show()
