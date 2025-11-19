import pandas as pd
import numpy as np

# Numpy Arrays have ndarray
array1 = np.array([[1,3,2],[0,5,1],[7,3,9]])
print(array1)
print(array1.ndim) # ndim = Number of dimensions
print(array1.shape) # Rows and columns
print(np.sort(array1))


df[
    (df["wait_time_min"] > 40)
    & (df["visit_type"] == "Acute")
]