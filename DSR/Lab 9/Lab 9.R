x<-c(50,53,54,55,56,59,62,65,67,71,72,74,75,76,79)
y<-c(122,118,128,121,125,136,144,142,149,161,167,168,162,171,175)
fw<-data.frame(x,y)
fw
cor(x,y)
fw.lm=lm(x ~ y,data=fw)
summary(fw.lm)
#components of linear regression
names(fw.lm) 

fw.lm$coefficients
#Gives slope and Intercept

newypred<-fitted(fw.lm) #predict y values for each x value
newypred

#Obtaining confidence Intervals
confint(fw.lm) #obtain the confidence intervals
confint(fw.lm,parm=c('(Intercept)','y'),level =0.9)

#Fitted Values
fitted(fw.lm)
residuals(fw.lm)

#plotting the x , y values
plot(fw$y,fw$x,col="red")
coef(fw.lm)
#plotting the fitted line
abline(coef(fw.lm),lty=1,col="blue")
#plotting residuals
plot(fw.lm,which=1)
