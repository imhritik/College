library(visualize)
library(BSDA)
machine1<-c(363,404,518,521,613,587,412,469,468,496)
machine2<-c(536,474,556,549,479,422,414,505,505,552)
mean1=mean(machine1)
mean2=mean(machine2)
mean1
mean2
var(machine1)
var(machine2)
sd(machine1)
sd(machine2)
t.test(x=machine1,y=machine2,var.equal = TRUE,conf.level=0.95)
#p> alpha. So failed to reject null hypthesis.

qt(p=0.05/2,df=18,lower.tail=TRUE)
qt(p=0.05/2,df=18,lower.tail=FALSE)
visualize.t(stat=c(-2.100922,2.100922),df=18,section="tails")

visualize.t(stat=c(-0.47061,0.47061),df=18,section="tails")
visualize.t(stat=c(-0.47061),df=18,section="upper")

visualize.t(stat=c(-0.47061),df=18,section="lower")
