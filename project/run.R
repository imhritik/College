M1<-matrix(data=c(1:9),nrow=3,ncol=3,byrow=F)
M1
M4<-matrix(data=(1:9),nrow=3)
M4
M4[2,]
num1<- c(1,2,3,4)
char1<-c('a','b','c','d')
real1<-c(10.5,20.5,30.5,40.5)
str1 <- c("Red", "White", "Green","Black")
logical1<- c(TRUE,TRUE,TRUE,FALSE)
F1<-data.frame(num1,char1,real1,str1,logical1)
F1  
F1[2,2]
names<-c("A","B","C","D")
rownames(F1)<-names
F1
FT1 <- factor(c("Single", "Married", "Married", "Single"));
FT1
gender <- c(rep("male",20), rep("female", 30))
gender <- factor(gender, order = TRUE,levels = c("male","female"))
gender
