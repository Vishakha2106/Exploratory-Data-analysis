setwd("C:/Users/Vishakha Sangwan/Downloads/R directory")

#Reading Data
data <- read.csv('household_power_consumption.txt', header=T, sep=';', na.strings="?", 
                 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


#filtering the date for the power consumption data with date of "1/2/2007" and  "2/2/2007"

data_new<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")



datetime <- strptime(paste(data_new$Date, data_new$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 



Global_active_power <- as.numeric(data_new$Global_active_power)


Global_reactive_power <- as.numeric(data_new$Global_reactive_power)



voltage <- as.numeric(data_new$Voltage)



SubMeter1 <- as.numeric(data_new$Sub_metering_1)



SubMeter2 <- as.numeric(data_new$Sub_metering_2)



SubMeter3 <- as.numeric(data_new$Sub_metering_3)



par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 



plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)



plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")



plot(datetime, SubMeter1, type="l", ylab="Energy Submetering", xlab="")



lines(datetime, SubMeter2, type="l", col="red")



lines(datetime, SubMeter3, type="l", col="blue")



legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")



plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

