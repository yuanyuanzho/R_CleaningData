library(XLConnect)
library(matrixStats)
train <- read.csv("G:\\INFO7390 Advances Data Science & Architecture\\Midterm Project\\train.csv")
na <- colSums(is.na(train))

# Calculte the portion of NA in each column and delete which portion is greater than 60%
nafreq <- na/nrow(train)
colnames(train[, which(nafreq > 0.6)])
colToDel <- which(nafreq > 0.6)
new_train <- train[-colToDel]


# find the outlier in each column
n <- ncol(new_train)
colmean <- colMeans(new_train[, 4:ncol(new_train)], na.rm = T)
colsd <- apply(new_train[, 4:ncol(new_train)], 2, function(x) sd(x, na.rm = T))



