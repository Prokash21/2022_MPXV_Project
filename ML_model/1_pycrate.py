# -*- coding: utf-8 -*-
"""Copy of 1_Pycrate.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/19oBBwfqvYSsv7nifXvsRgrWGFwEOPXj7
"""

from google.colab import drive
drive.mount('/content/drive')

# Raw data access

import os
os.chdir('/content/drive/MyDrive/MPXV_pycaret/NEW_ML_MPXV')

"""#### **Importing the modules** ####"""

from glob import glob
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
import seaborn as sns

ls

"""#### **Load Dataset** ####"""

MPXV_df = pd.read_csv("13_K_C_ex_run.csv", index_col=0)

display(MPXV_df.head(24))

"""#### **Data Preprocessing** ####
##### **Checking null entries** #####
"""

MPXV_df.info()

"""#### **Splitting the dataframes into train and test** ####"""

!pip install pycaret

# import pycaret classification and init setup
from pycaret.classification import *
setup(MPXV_df, target = 'condition', train_size = 0.8, session_id = 123)
# setup(X_iq, target = 'total_cases', train_size = 0.8, session_id = 123)

import pycaret
print(pycaret.__version__)

"""## **Compare Models** ##"""

# compare baseline models
best = compare_models()
print(best)

"""## **Create Model**##"""

# create model
rf = create_model('rf')

# print model parameters
print(rf)

"""## **Tune Model** ##"""

# tune hyperparameters of et
tuned_rf = tune_model(rf)

# print tuned model
print(tuned_rf)

tuned_rf

# to access the tuner object you can set return_tuner = True
tuned_rf, tuner = tune_model(rf, return_tuner=True)

tuner

"""## **Analyze Model** ##"""

#plot_model(rf, plot = 'residuals')

# predicting error plot
plot_model(rf, plot = 'error')

# cooks distance plot
#plot_model(rf, plot = 'cooks')

# recursive feature elemination
#plot_model(rf, plot = 'rfe')

# learning curve
plot_model(rf, plot = 'learning')

# validation curve
plot_model(rf, plot = 'vc')

# manifold learning plot
#plot_model(rf, plot = 'manifold')

# plot feature importance
plot_model(rf, plot = 'feature')
# plot feature importance
plot_model(rf, plot = 'feature', save=True)