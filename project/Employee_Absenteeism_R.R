#Clean the environment
rm(list = ls())

#Set working directory
setwd("C:/Users/hriti/OneDrive/Documents/Employee-Absenteeism-master")

#Load the librarires
libraries = c("dummies","caret","rpart.plot","plyr","dplyr", "ggplot2","rpart","dplyr","DMwR","randomForest","usdm","corrgram","DataCombine","xlsx")
lapply(X = libraries,require, character.only = TRUE)
rm(libraries)

#Read the csv file
emp_absent = read.csv("sheet.csv",stringsAsFactors = F) 

########################################EXPLORE THE DATA########################################

#Check number of rows and columns
dim(emp_absent)

#Observe top 5 rows
head(emp_absent)

#Structure of variables
str(emp_absent)

########
#emp_absent$Work.load.Average.day =as.numeric(as.character(emp_absent$Work.load.Average.day))
#######
#Transform data types
emp_absent$ID = as.factor(as.character(emp_absent$ID))

emp_absent$Reason.for.absence[emp_absent$Reason.for.absence %in% 0] = 20
emp_absent$Reason.for.absence = as.factor(as.character(emp_absent$Reason.for.absence))

emp_absent$Month.of.absence[emp_absent$Month.of.absence %in% 0] = NA
emp_absent$Month.of.absence = as.factor(as.character(emp_absent$Month.of.absence))

emp_absent$Day.of.the.week = as.factor(as.character(emp_absent$Day.of.the.week))
emp_absent$Seasons = as.factor(as.character(emp_absent$Seasons))
emp_absent$Disciplinary.failure = as.factor(as.character(emp_absent$Disciplinary.failure))
emp_absent$Education = as.factor(as.character(emp_absent$Education))
emp_absent$Son = as.factor(as.character(emp_absent$Son))
emp_absent$Social.drinker = as.factor(as.character(emp_absent$Social.drinker))
emp_absent$Social.smoker = as.factor(as.character(emp_absent$Social.smoker))
emp_absent$Pet = as.factor(as.character(emp_absent$Pet))

#Structure of variables
str(emp_absent)

#Make a copy of data
df = emp_absent

########################################MISSING VALUE ANALYSIS########################################
#Get number of missing values
sum(is.na(df))
sapply(df,function(x){sum(is.na(x))})
missing_values = data.frame(sapply(df,function(x){sum(is.na(x))}))

#Get the rownames as new column
missing_values$Variables = row.names(missing_values)

#Reset the row names 
row.names(missing_values) = NULL

#Rename the column
names(missing_values)[1] = "Miss_perc"
head(missing_values)

#Calculate missing percentage
missing_values$Miss_perc = ((missing_values$Miss_perc/nrow(emp_absent)) *100)

#Reorder the columns
missing_values = missing_values[,c(2,1)]
head(missing_values)

#Sort the rows according to decreasing missing percentage
missing_values = missing_values[order(-missing_values$Miss_perc),]
head(missing_values)

#Create a bar plot to visualie top 5 missing values
ggplot(data = missing_values[1:5,], aes(x=reorder(Variables, -Miss_perc),y = Miss_perc))+
  geom_bar(stat = "identity",fill = "grey")+xlab("Parameter")+
  ggtitle("Missing data percentage") + theme_bw()

#Create missing value and impute using mean, median and knn
df = knnImputation(data = df, k = 3)

#Check if any missing values
sum(is.na(df))

########################################EXPLORE DISTRIBUTION USING GRAPHS########################################
#Get numerical data
numeric_index = sapply(df, is.numeric)
numeric_index
numeric_data = df[,numeric_index]


#Distribution of factor data using bar plot
bar1 = ggplot(data = df, aes(x = ID)) + geom_bar() + ggtitle("Count of ID") + theme_bw()
bar1

bar2 = ggplot(data = df, aes(x = Reason.for.absence)) + geom_bar() + 
  ggtitle("Count of Reason for absence") + theme_bw()
bar2

bar3 = ggplot(data = df, aes(x = Month.of.absence)) + geom_bar() + ggtitle("Count of Month") + theme_bw()
bar3

bar4d = with(df,table(Disciplinary.failure))
barplot(bar4d,legend=c('No','Yes'),col=rainbow(2),xlab = 'Discipline',ylab='count',main = 'Absent VS Discipline graph ',)

bar4 = ggplot(data = df, aes(x = Disciplinary.failure)) + geom_bar() + 
  ggtitle("Count of Disciplinary failure") + theme_bw()
bar4

bar5d = with(df,table(Education),colors=c('red','green','yellow','blue'))
barplot(bar5d,legend=c('High School','Graduate','PostGrad','Doctor'),col=rainbow(4),xlab = 'Education',ylab='count',main = 'Absent VS Education graph ',)


bar6 = ggplot(data = df, aes(x = Son)) + geom_bar() + ggtitle("Count of Son") + theme_bw()
bar6

bar7d = with(df,table(Social.drinker))
barplot(bar7d,legend=c('No','Yes'),col=rainbow(2),xlab = 'Social Drinker',ylab='count',main = 'Absent VS Drinker graph ',)


bar8d = with(df,table(Day.of.the.week))
barplot(bar8d,legend=c('Mon','Tue','Wed','Thur','Fri'),col=rainbow(5),xlab = 'Day',ylab='count',main = 'Absent VS Days graph ')

bar9d = with(df,table(Social.smoker))
barplot(bar9d,legend=c('No','Yes'),col=rainbow(2),xlab = 'Social Smoker',ylab='count',main = 'Absent VS Smoker graph ')

#Check the distribution of numerical data using histogram

hist1 = ggplot(data = numeric_data, aes(x =Transportation.expense)) + 
  ggtitle("Transportation.expense") + geom_histogram(bins = 25)
hist2 = ggplot(data = numeric_data, aes(x =Height)) + 
  ggtitle("Distribution of Height") + geom_histogram(bins = 25)
hist3 = ggplot(data = numeric_data, aes(x =Body.mass.index)) + 
  ggtitle("Distribution of Body.mass.index") + geom_histogram(bins = 25)
hist4 = ggplot(data = numeric_data, aes(x =Absenteeism.time.in.hours)) + 
  ggtitle("Distribution of Absenteeism.time.in.hours") + geom_histogram(bins = 25)

gridExtra::grid.arrange(hist1,hist2,hist3,hist4,ncol=2)

########################################OUTLIER ANALYSIS########################################
#Get the data with only numeric columns
numeric_index = sapply(df, is.numeric)
numeric_index
numeric_data = df[,numeric_index]

#Get the data with only factor columns
factor_data = df[,!numeric_index]

#Check for outliers using boxplots
for(i in 1:ncol(numeric_data)) {
  assign(paste0("box",i), ggplot(data = df, aes_string(y = numeric_data[,i])) +
           stat_boxplot(geom = "errorbar", width = 0.5) +
           geom_boxplot(outlier.colour = "red", fill = "grey", outlier.size = 1) +
           labs(y = colnames(numeric_data[i])) +
           ggtitle(paste("Boxplot: ",colnames(numeric_data[i]))))
}

#Arrange the plots in grids
gridExtra::grid.arrange(box1,box2,box3,box4,ncol=2)
gridExtra::grid.arrange(box5,box6,box7,box8,ncol=2)
gridExtra::grid.arrange(box9,ncol=1)

#Get the names of numeric columns
numeric_columns = colnames(numeric_data)

#Replace all outlier data with NA
for(i in numeric_columns){
  val = df[,i][df[,i] %in% boxplot.stats(df[,i])$out]
  print(paste(i,length(val)))
  df[,i][df[,i] %in% val] = NA
}

#Check number of missing values
sapply(df,function(x){sum(is.na(x))})

#Get number of missing values after replacing outliers as NA
missing_values_out = data.frame(sapply(df,function(x){sum(is.na(x))}))
missing_values_out$Columns = row.names(missing_values_out)
row.names(missing_values_out) = NULL
names(missing_values_out)[1] = "Miss_perc"
missing_values_out$Miss_perc = ((missing_values_out$Miss_perc/nrow(emp_absent)) *100)
missing_values_out = missing_values_out[,c(2,1)]
missing_values_out = missing_values_out[order(-missing_values_out$Miss_perc),]
missing_values_out

#Compute the NA values using KNN imputation
df = knnImputation(df, k = 5)

#Check if any missing values
sum(is.na(df))

########################################FEATURE SELECTION########################################


#Check for multicollinearity using corelation graph
library(corrgram)
corrgram(numeric_data, order = NULL, upper.panel=panel.pie, 
         text.panel=panel.txt, main = "Correlation Plot")
############################################################################## 
#Variable Reduction

df = subset.data.frame(df, select = -c(Body.mass.index))

#Make a copy of Clean Data
clean_data = df
#write.xlsx(clean_data, "clean_data.xlsx", row.names = F)
numeric_index = sapply(df,is.numeric)
numeric_data = df[,numeric_index]
numeric_columns = names(numeric_data)
numeric_columns = numeric_columns[-9]

#Normalization of continuous variables
for(i in numeric_columns){
  print(i)
  df[,i] = (df[,i] - min(df[,i]))/
    (max(df[,i]) - min(df[,i]))
}

#Get the names of factor variables
factor_columns = names(factor_data)

#Create dummy variables of factor variables
df = dummy.data.frame(df, factor_columns)

rmExcept(keepers = c("df","emp_absent"))


########################################DIMENSION REDUCTION USING PCA########################################
#Principal component analysis

#Splitting data into train and test data
set.seed(1)
train_index = sample(1:nrow(df), 0.8*nrow(df))        
train = df[train_index,]
test = df[-train_index,]
prin_comp = prcomp(train)

set.seed(1)
train_index = sample(1:nrow(df), 0.8*nrow(df))        
train = df[train_index,]
test = df[-train_index,]
prin_comp = prcomp(train)

#Compute standard deviation of each principal component
pr_stdev = prin_comp$sdev

#Compute variance
pr_var = pr_stdev^2

#Proportion of variance explained
prop_var = pr_var/sum(pr_var)

#Cumulative scree plot
plot(cumsum(prop_var), xlab = "Principal Component",
     ylab = "Cumulative Proportion of Variance Explained",
     type = "b")

#Add a training set with principal components
train.data = data.frame(Absenteeism.time.in.hours = train$Absenteeism.time.in.hours, prin_comp$x)

# From the above plot selecting 45 components since it explains almost 95+ % data variance
train.data =train.data[,1:45]

#Transform test data into PCA
test.data = predict(prin_comp, newdata = test)
test.data = as.data.frame(test.data)

#Select the first 45 components
test.data=test.data[,1:45]

########################################DECISION TREE########################################

#Build decsion tree using rpart
dt_model = rpart(Absenteeism.time.in.hours ~., data = train.data, method = "anova")

#Predict the test cases
dt_predictions = predict(dt_model,test.data)

#Create data frame for actual and predicted values
df_pred = data.frame("actual"=test[,114], "dt_pred"=dt_predictions)
head(df_pred)

#Calcuate MAE, RMSE, R-sqaured for testing data 
print(postResample(pred = dt_predictions, obs = test$Absenteeism.time.in.hours))

#Plot a graph for actual vs predicted values
plot(test$Absenteeism.time.in.hours,type="l",lty=2,col="green")
lines(dt_predictions,col="blue")

#RMSE  Rsquared       MAE 
#0.2108736 0.1660149 0.1443652 

########################################RANDOM FOREST########################################

#Train the model using training data
rf_model = randomForest(Absenteeism.time.in.hours~., data = train.data, ntrees = 500)

#Predict the test cases
rf_predictions = predict(rf_model,test.data)

#Create dataframe for actual and predicted values
df_pred = cbind(df_pred,rf_predictions)
head(df_pred)

#Calcuate MAE, RMSE, R-sqaured for testing data 
print(postResample(pred = rf_predictions, obs = test$Absenteeism.time.in.hours))

#Plot a graph for actual vs predicted values
plot(test$Absenteeism.time.in.hours,type="l",lty=2,col="green")
lines(rf_predictions,col="blue")

#RMSE  Rsquared       MAE 
#0.1571539 0.5486220 0.1051845 

########################################LINEAR REGRESSION########################################


#Train the model using training data
lr_model = lm(Absenteeism.time.in.hours ~ ., data = train.data)

#Get the summary of the model
summary(lr_model)

#Predict the test cases
lr_predictions = predict(lr_model,test.data)

#Create dataframe for actual and predicted values
df_pred = cbind(df_pred,lr_predictions)
head(df_pred)

#Calcuate MAE, RMSE, R-sqaured for testing data 
print(postResample(pred = lr_predictions, obs =test$Absenteeism.time.in.hours))

#Plot a graph for actual vs predicted values
plot(test$Absenteeism.time.in.hours,type="l",lty=2,col="green")
lines(lr_predictions,col="blue")

# RMSE   Rsquared        MAE 
#0.11901781 0.70385587 0.07940121