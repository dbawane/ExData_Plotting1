# create plot3.png file

# get the processed data
source("DownLoadData.R")

png(filename="plot3.png")

plot(pdata$DateTime, pdata$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

lines(pdata$DateTime, pdata$Sub_metering_2, col="red")

lines(pdata$DateTime, pdata$Sub_metering_3, col="blue")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), 
       lty="solid")

dev.off()
