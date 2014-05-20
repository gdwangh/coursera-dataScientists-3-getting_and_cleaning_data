fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl, destfile="./getdata_wksst8110.for")

# Reading Fixed-Width Records, and skip header
records <- read.fwf("./getdata_wksst8110.for", widths=c(15,4,6,7,5,8,5,8,5),skip=4)

sum(records[,"V4"])
