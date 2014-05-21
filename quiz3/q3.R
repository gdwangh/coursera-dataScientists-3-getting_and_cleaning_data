library(plyr)
library(reshape2)

setwd("D:/doc/study/dataScientists/Getting and cleaning Data/quiz3")

gdpfile<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(gdpfile, destfile="./getdata_data_GDP.csv")
GDP<-read.csv("./getdata_data_GDP.csv",,header=FALSE,skip=5,as.is=TRUE)
res_GDP<-GDP[GDP$V1!=""&GDP$V2!="",c("V1","V2","V4","V5")]
res_GDP$V2=as.numeric(as.list(res_GDP$V2))
names(res_GDP)<-c("CountryCode","Ranking","Economy","millions.of.US.dollars")

edstatfile<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv "
download.file(edstatfile, destfile="./getdata_data_EDSTATS_Country.csv")
edstat<-read.csv("./getdata_data_EDSTATS_Country.csv")

# for question 3
m<-arrange(merge(res_GDP,edstat), Ranking, decreasing=TRUE)
dim(m)
m[13,"Long.Name"]

# for question 4
incomeGroup<-m[m$Income.Group %in% c("High income: OECD","High income: nonOECD"),]
DT<-melt(incomeGroup, id="Income.Group",measure.vars="Ranking")
dcast(DT, Income.Group~variable,mean)

# for question 5
