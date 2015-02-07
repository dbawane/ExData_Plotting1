#Read file from web and clean the data

#URL name
fURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Downloaded zip file name
fzipname <- "household_power_consumption.zip"

#Unziped text file name
ftextname <- "household_power_consumption.txt"

# processed data file name
fpdata <- "pdata.Rda"

#get and save and process orignal data only once 

if (!file.exists(fpdata)) {
      
      
      if (!file.exists(fzipname)) {
            download.file(fURL, destfile=fname, method="curl")
      }
      
      if (!file.exists(ftextname)){
            unzip(fzipname)   
      }
      
      #process and clean the data
      
      pdata <- read.table(ftextname, header=TRUE, sep=';', na.strings="?", 
                          colClasses=c("character","character","numeric","numeric",
                                       "numeric","numeric","numeric","numeric","numeric"))
      # Convert dates, time class
      library(lubridate)
      pdata$Date <- dmy(pdata$Date)
      pdata$Time <- hms(pdata$Time)
      
      # Take data only for 2 days
      start <- ymd('2007-02-01')
      end <- ymd('2007-02-02')
      pdata <- subset(pdata, year(Date) == 2007 & 
                            month(Date) == 2 &
                            (day(Date) == 1 | day(Date) == 2))
      
      # add colume DataTime combined
      pdata$DateTime <- pdata$Date + pdata$Time
      
      saveRDS (pdata, file=fpdata)
}

pdata <- readRDS(fpdata)








