# Summative Assignment

## Overview

This project involves three main tasks:

1. **Linear Regression Model**
2. **API Creation with FastAPI**
3. **Flutter App Integration**

## Task 1: Linear Regression Model

In this task, a linear regression model was created and optimized using gradient descent. The dataset provided was used to predict TV sales. The notebook includes instructions, and unit tests are included to ensure code correctness. Additionally, decision trees and random forests were compared to the linear regression model based on Root Mean Squared Errors (RMSE).

Also There is another creation of Multivariate Linear Regression which used a dataset [available on Kaggle](https://www.kaggle.com/datasets/nikhil7280/student-performance-multiple-linear-regression). The data includes information about student including the following:

- Hours Studied : The time a student spent studying in hours 
- Previous Scores: The score that a student scored in the previous exam
- Sleep Hours: The time a student slept
- Sample Question Papers Practiced: Amount of question papers a student practiced

In this project we going to predict what scores the student will score in the exam depending on those data. 



## Task 2: API Creation

A FastAPI-based API was created to make predictions using a linear regression model. This task utilized the student score dataset with multiple variables.

**API Endpoint:**
- **URL:** [API_ENDPOINT_URL](https://linear-regression-model-b17p.onrender.com)
- **Path:** `/predict`
- **Method:** `POST`

## Task 3: Flutter App

This flutter app has two page a welcome page and Prediction page which has test field for the user to input and a prediction button to predict the score and a filed which has the predicted value.
