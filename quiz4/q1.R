setwd("D:/doc/study/dataScientists/Getting and cleaning Data/quiz4")

fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./getdata_data_ss06hid.csv")
dt<-read.csv("./getdata_data_ss06hid.csv")

strsplit(names(dt), "wgtp")[123]
