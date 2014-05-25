library(stringr)
setwd("D:/doc/study/dataScientists/Getting and cleaning Data/quiz4")

fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
download.file(fileUrl, destfile="./getdata_data_GDP.csv")
gdp<-read.csv("./getdata_data_GDP.csv", header = FALSE, skip=5,nrow=190)

fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl, destfile="./getdata_data_EDSTATS_Country.csv")
edstat<-read.csv("./getdata_data_EDSTATS_Country.csv")

mt<-merge(gdp, edstat, by.x="V1",by.y="CountryCode")

grep("[Ff]iscal year.*June 30",mt$Special.Notes,value=TRUE)
mt[grepl("[Ff]iscal year.*June 30",mt$Special.Notes), "V1"]
