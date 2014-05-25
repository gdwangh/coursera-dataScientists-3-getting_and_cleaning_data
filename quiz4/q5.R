library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

table(format(sampleTimes, '%Y')=="2012")

table(format(sampleTimes, '%Y %a')=="2012 ÷‹“ª")
