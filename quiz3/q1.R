setwd("D:/doc/study/dataScientists/Getting and cleaning Data/quiz3")

fileURL<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL,destfile="./getdata_data_ss06hid.csv")

# ACR=3 .House on ten or more acres
# AGS Sales of Agriculture Products =6 .$10000+
hd<-read.csv("./getdata_data_ss06hid.csv")

which(hd$ACR==3 & hd$AGS==6)
