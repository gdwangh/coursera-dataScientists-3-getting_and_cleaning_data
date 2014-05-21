library(jpeg)

setwd("D:/doc/study/dataScientists/Getting and cleaning Data/quiz3")

fileURL<-"http://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileURL,destfile="./getdata_jeff.jpg",mode="wb")
jp<-readJPEG("./getdata_jeff.jpg",native=TRUE)
quantile(jp,probs=c(0.3,0.8))
