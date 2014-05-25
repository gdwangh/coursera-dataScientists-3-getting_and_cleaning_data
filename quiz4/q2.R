library(stringr)
setwd("D:/doc/study/dataScientists/Getting and cleaning Data/quiz4")

fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
download.file(fileUrl, destfile="./getdata_data_GDP.csv")
dt<-read.csv("./getdata_data_GDP.csv", header = FALSE, skip=5,nrow=190)

dt$V5<-as.numeric(gsub(",","",dt$V5))

mean(dt2$V5, na.rm=TRUE)

grep("^United",dt$V4)
