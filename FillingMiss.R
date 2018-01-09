
mydata <- read.csv("/Users/eavy/Downloads/7390/train.csv")

#Getting list of columns having missing values
mylist <- c(unlist(lapply(mydata, function(x) any(is.na(x)))))
#View(mylist)


## tenure
boxplot(mydata$Medical_History_1)
mydata$Employment_Info_4[is.na(mydata$Employment_Info_4)] = mean(mydata$Employment_Info_4, na.rm=TRUE)
## claim.ind
table(mydata$Employment_Info_4)
mydata$Employment_Info_4[is.na(mydata$Employment_Info_4)]=0
boxplot(mydata$Medical_History_32)


boxplot(mydata$Employment_Info_4,mydata$Employment_Info_6,mydata$Insurance_History_5,
        mydata$Family_Hist_2,mydata$Family_Hist_3,mydata$Family_Hist_4,mydata$Family_Hist_5)
boxplot (mydata$Medical_History_1,mydata$Medical_History_10,mydata$Medical_History_15,
        mydata$Medical_History_24,mydata$Medical_History_32)

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}## mode function
mydata$Employment_Info_4[is.na(mydata$Employment_Info_4)]=getmode(mydata$Employment_Info_4)





#Filling missing values with 0 for Employment_Info_4
mydata$Employment_Info_4[is.na(mydata$Employment_Info_4)] <- 0

#Filling missing values with mean value for Employment_Info_6
mydata$Employment_Info_6[is.na(mydata$Employment_Info_6)] <- mean(mydata$Employment_Info_6, na.rm = TRUE)

#Filling missing values with max value for Insurance_History_5
mydata$Insurance_History_5[is.na(mydata$Insurance_History_5)] <- max(mydata$Insurance_History_5, na.rm = TRUE)

#Filling missing values with min value for Family_Hist_2
mydata$Family_Hist_2[is.na(mydata$Family_Hist_2)] <- min(mydata$Family_Hist_2, na.rm = TRUE)

#Filling missing values with mean value for Family_Hist_3
mydata$Family_Hist_3[is.na(mydata$Family_Hist_3)] <- mean(mydata$Family_Hist_3, na.rm = TRUE)

#Filling missing values with mean value for Family_Hist_4
mydata$Family_Hist_4[is.na(mydata$Family_Hist_4)] <- mean(mydata$Family_Hist_4, na.rm = TRUE)

#Filling missing values with min value for Family_Hist_5
mydata$Family_Hist_5[is.na(mydata$Family_Hist_5)] <- min(mydata$Family_Hist_5, na.rm = TRUE)

#Filling missing values with mean value for Medical_History_1
mydata$Medical_History_1[is.na(mydata$Medical_History_1)] <- mean(mydata$Medical_History_1, na.rm = TRUE)

#Filling missing values with median value for Medical_History_10
mydata$Medical_History_10[is.na(mydata$Medical_History_10)] <- median(mydata$Medical_History_10, na.rm = TRUE)

#Filling missing values with median value for Medical_History_15
mydata$Medical_History_15[is.na(mydata$Medical_History_15)] <- median(mydata$Medical_History_15, na.rm = TRUE)

#Filling missing values with mean value for Medical_History_24
mydata$Medical_History_24[is.na(mydata$Medical_History_24)] <- mean(mydata$Medical_History_24, na.rm = TRUE)

#Filling missing values with mean value for Medical_History_32
mydata$Medical_History_32[is.na(mydata$Medical_History_32)] <- median(mydata$Medical_History_32, na.rm = TRUE)

write.csv(mydata, "FillingMiss.csv") 































