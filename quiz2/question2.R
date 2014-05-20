install.packages("sqldf")
library(sqldf)

setwd("D:/document/study/数据分析师系列课程/Getting and cleaning Data/quiz2")

fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile="./getdata_data_ss06pid.csv")

acs<-read.csv("./getdata_data_ss06pid.csv")