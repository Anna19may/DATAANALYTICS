#fetching data from the sample data file using fread

#step1-set orking directory
setwd("C:/Users/Dell/Desktop")

#step1- load data.table package

library(data.table)
fileDiamond=fread("BigDiamonds.csv")
#get the structure of data set
str(fileDiamond)
print(fileDiamond$cut) 

#GET THE SUMMARY OF THE TABLE
summary(fileDiamond)

##################################################################################
#1. Which color has maximum price/carat

#Step 1: assign the price per column values to another field
fileDiamond$ppc=fileDiamond$price/fileDiamond$carat
#step2:file Diamonds has NA values hence remove it
fileDiamondOmittedNA=na.omit(fileDiamond)
#Step3: Repeat Step 2 with omitted NAs
fileDiamondOmittedNA$ppc=fileDiamondOmittedNA$price/fileDiamondOmittedNA$carat
#Step4:Verify using Summary
str(fileDiamondOmittedNA)
#Step5:find color of maximum price/carat value
maxPpc=subset(fileDiamondOmittedNA,ppc==max(ppc))
#to remove duplicate sin the result
install.packages("dplyr")
library(dplyr)
distinctMaxPpc=maxPpc %>% distinct(ppc, .keep_all=TRUE)
print(distinctMaxPpc)
color=distinctMaxPpc$color
print(color)

##########################################################################
#2.which clarity has minimum price/carat
#step1: get minimum price per carat
minPpc=subset(fileDiamondOmittedNA,ppc==min(ppc))
clarity=minPpc$clarity
print(clarity)
##############################################################################
#3. Which cut has minimum missing values
#fileDiamondMissingValues=na.

#############################################################################
#4.Which color has minimum median price
#Method1: Using sqldf package

install.packages("sqldf")
library(sqldf)
medianPriceColor=sqldf('SELECT color,median(price) AS MP from fileDiamondOmittedNA GROUP BY color' )
minMedianPriceColor=subset(medianPriceColor,MP==min(MP))
print(minMedianPriceColor)


#Medthod2:Using dplyr package
require(dplyr)
medianPriceColorbydplyr=fileDiamondOmittedNA %>% group_by(color) %>% summarise(MP=median(price))
print(medianPriceColorbydplyr)
minMedianPriceColorbydplyr=subset(medianPriceColorbydplyr,MP==min(MP))
print(minMedianPriceColorbydplyr)

####################################################################################
Obsrv=sqldf('Select color,cut,price,carat from fileDiamond group by color')
#My Observations


  
