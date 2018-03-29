#Simple Linear Regresiion

# Importing the dataset
dataset= read.csv('Salary_Data.csv')
# dataset= dataset[, 2:3 ]

#Splitting the dataset into the Training set and the Test Set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature Scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

#Fitting Simple Linear Regression to the training set
regressor = lm(formula = Salary ~ YearsExperience, 
               data = training_set)

#Predicting the test set results
y_pred = predict(regressor, newdata = test_set)

#Visualising the Training set results
install.packages('ggplot2')