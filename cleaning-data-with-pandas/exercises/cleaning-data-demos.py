import pandas as pd
import numpy as np


print("\n\n")
students = pd.read_csv("data-analysis-projects/cleaning-data-with-pandas/exercises/student_records_dirty.csv")
# print(students.head())
# print("\n")
# print(students.sample(5))

# print(students[["major", "course_grade"]].value_counts())
print(students["major"].value_counts(dropna=False))
students["course_grade"] = students ["course_grade"].replace("N/A", np.nan)