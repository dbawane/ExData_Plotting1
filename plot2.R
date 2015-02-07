# create plot2.png file

# get the processed data
source("DownLoadData.R")


png(filename = "plot2.png")

plot(pdata$DateTime, pdata$Global_active_power,
     xlab="", ylab="Global Active Power (kilowatts)",type="l")

dev.off()
