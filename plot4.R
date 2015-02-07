# create plot4.png file

# get the processed data
source("DownLoadData.R")

png(filename="plot4.png")

par(mfrow=c(2,2))

# R1C1

plot(pdata$DateTime, pdata$Global_active_power,
     ylab="Global Active Power", xlab="", type="l")

# R1C2
plot(pdata$DateTime, pdata$Voltage,
     xlab="datetime", ylab="Voltage", type="l")

# R2C1
plot(pdata$DateTime, pdata$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

lines(pdata$DateTime, pdata$Sub_metering_2, col="red")

lines(pdata$DateTime, pdata$Sub_metering_3, col="blue")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),lty="solid", bty="n")

# R2C2
plot(pdata$DateTime, pdata$Global_reactive_power,
     xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()
