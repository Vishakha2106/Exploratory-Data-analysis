
setwd("C:/Users/Vishakha Sangwan/Downloads/R directory")

#Reading Data
data <- read.csv('household_power_consumption.txt', header=T, sep=';', na.strings="?", 
                      
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data_new <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(data)



## Converting dates

datetime <- paste(as.Date(data_new$Date), data_new$Time)

data_new$datetime <- as.POSIXct(datetime)

## Plot 1

hist(data_new$Global_active_power, main="Global Active Power", 
     
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")



## Saving to file

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()









