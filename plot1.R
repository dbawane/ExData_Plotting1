# create plot1.png file

# get the processed data
source("DownLoadData.R")


png(filename = "plot1.png")

hist(pdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()
