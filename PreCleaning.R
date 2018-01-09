########### MIDTERM PROJECT #############

########Importing the dataset ##########
####Using the train datset as the data is already split#######

rawtraindata <-  read.csv(file="Raw_Data/train.csv", header=TRUE, sep= ',')
head(rawtraindata, n=5)

#####################Data Preparation Stage################################

########Analyzing the data############
#Getting list of columns having missing values
mylist <- c(unlist(lapply(rawtraindata, function(x) any(is.na(x)))))
View(mylist)

#########Filling in all the missing values#############

#Filling missing values with 0 for Employment_Info_4
rawtraindata$Employment_Info_4[is.na(rawtraindata$Employment_Info_4)] <- 0

#Filling missing values with mean value for Employment_Info_6
rawtraindata$Employment_Info_6[is.na(rawtraindata$Employment_Info_6)] <- mean(rawtraindata$Employment_Info_6, na.rm = TRUE)

#Filling missing values with max value for Insurance_History_5
rawtraindata$Insurance_History_5[is.na(rawtraindata$Insurance_History_5)] <- max(rawtraindata$Insurance_History_5, na.rm = TRUE)

#Filling missing values with min value for Family_Hist_2
rawtraindata$Family_Hist_2[is.na(rawtraindata$Family_Hist_2)] <- min(rawtraindata$Family_Hist_2, na.rm = TRUE)

#Filling missing values with mean value for Family_Hist_3
rawtraindata$Family_Hist_3[is.na(rawtraindata$Family_Hist_3)] <- mean(rawtraindata$Family_Hist_3, na.rm = TRUE)

#Filling missing values with mean value for Family_Hist_4
rawtraindata$Family_Hist_4[is.na(rawtraindata$Family_Hist_4)] <- mean(rawtraindata$Family_Hist_4, na.rm = TRUE)

#Filling missing values with min value for Family_Hist_5
rawtraindata$Family_Hist_5[is.na(rawtraindata$Family_Hist_5)] <- min(rawtraindata$Family_Hist_5, na.rm = TRUE)

#Filling missing values with mean value for Medical_History_1
rawtraindata$Medical_History_1[is.na(rawtraindata$Medical_History_1)] <- mean(rawtraindata$Medical_History_1, na.rm = TRUE)

#Filling missing values with median value for Medical_History_10
rawtraindata$Medical_History_10[is.na(rawtraindata$Medical_History_10)] <- median(rawtraindata$Medical_History_10, na.rm = TRUE)

#Filling missing values with median value for Medical_History_15
rawtraindata$Medical_History_15[is.na(rawtraindata$Medical_History_15)] <- median(rawtraindata$Medical_History_15, na.rm = TRUE)

#Filling missing values with mean value for Medical_History_24
rawtraindata$Medical_History_24[is.na(rawtraindata$Medical_History_24)] <- mean(rawtraindata$Medical_History_24, na.rm = TRUE)

#Filling missing values with mean value for Medical_History_32
rawtraindata$Medical_History_32[is.na(rawtraindata$Medical_History_32)] <- median(rawtraindata$Medical_History_32, na.rm = TRUE)


########Selecting the categoical columns############
#using c() to return a vector and paste() to print the names again everytime instead of just displaying the number and using
# sep="" without which the column numbers will be displayed with a spcae causing error.

categoricalcolumns <- c(paste("Product_Info_", c(1:3,5:7),sep=""), paste("Employment_Info_", c(2,3,5), sep=""), 
                        paste("InsuredInfo_", 1:7, sep=""), paste("Insurance_History_", c(1:4,7:9), sep=""), paste("Family_Hist_1"),
                        paste("Medical_History_", c(2:9, 11:14, 16:23, 25:31, 33:41),sep=""),"Response")

######Selecting the discrete columns############

discretecolumns <- c("Id","Medical_History_1", "Medical_History_10", "Medical_History_15", "Medical_History_24", "Medical_History_32", 
                paste("Medical_Keyword_", 1:48, sep=""))

#######Selecting the continious columns#########

continiouscolumns <- c("Product_Info_4", "Ins_Age", "Ht", "Wt", "BMI", "Employment_Info_1", "Employment_Info_4", 
                "Employment_Info_6", "Insurance_History_5", "Family_Hist_2", "Family_Hist_3", "Family_Hist_4", 
                "Family_Hist_5")

#Displaying the columns
categoricalcolumns
discretecolumns
continiouscolumns


#Combining the data with the column names
rawdatacategorical <- rawtraindata[, categoricalcolumns]
rawdatadiscrete <- rawtraindata[, discretecolumns]
rawadatacontinious <- rawtraindata[, continiouscolumns]

#newint <- merge(rawdatadiscrete, rawdatacategorical)

str(newrawtraindata)

#Finding the columns with missing values from categorical data
sum(is.na(newrawtraindata))

##########Splitting the categorical data############

#install.packages('ade4')
# installing the ade4 libarary to use acm.disjonctif() because our dataframe only contains factors
library(ade4)
#acm.disjonctif an utility giving the complete disjunctive table of a factor table.
df_categorical <-acm.disjonctif(rawdatacategorical[c(1:60)]) #selecting first 60 columns except the response column
head(df_categorical, n=2)

# selecting the response value seperately so that we don't categorize it
responsevalue <-rawdatacategorical[, c(61)]

#Combining the categorized values with the response value into one dataframe
df_categoricalbinded <- cbind(df_categorical,responsevalue)
head(df_categoricalbinded, n=2)

newrawtraindata <- cbind(rawadatacontinious,rawdatadiscrete,df_categoricalbinded)
str(newrawtraindata)

write.csv(newrawtraindata, file = "newRawData.csv")

