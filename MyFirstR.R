23%/%3 #numerator
23%%3 #reminder
ls()
rm(df4)
memory.limit()
#library for 3d charts
install.packages("plotrix")
ajay=rnorm(100,5,4)
ajay
mean(ajay)
sd(ajay)
median(ajay)

ajay=c(1,2,29,34,59,64,58,24,51)
vijay=c(1,2,3,4,5)
strAjay=c("red","blue")
sort(ajay)
class(ajay)
class(vijay)
class(strAjay)
vijay*ajay
ajay*vijay


for (number in 1:5){number=number+1 ;print (number)}

for(i in 1:5){print("hello")}


myfunction=function(){print("this is my function")}
myfunction() #functioncall
myfunction #to view function definition
kmeans

setwd("C:/Users/Dell/Desktop")
dir()

dir(".",pattern = "csv")

diamonds=read.csv("BigDiamonds.csv")
head(diamonds)

diamonds $X=NULL  #dropped a variable(column X)

head(diamonds)

str(diamonds)

#install.packages(data.table)
library(data.table)

diamonds2=fread("BigDiamonds.csv")  #fread is fast read

summary(diamonds)

table(diamonds$cut,diamonds$color)

diamonds$ppc=diamonds$price/diamonds$carat
diamonds5=na.omit(diamonds)
diamonds5$ppc=diamonds5$price/diamonds5$carat
head(diamonds5)

summary(diamonds5$price)