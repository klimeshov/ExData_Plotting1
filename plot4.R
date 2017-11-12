powerData <- read.table("household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

##subset according to given dates
powerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]


#deleted all the rows that had NA values
powerData <-na.omit(powerData)

#making date in format
datetime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, as.numeric(powerData$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, as.numeric(powerData$Voltage), type="l", xlab="datetime", ylab="voltage")
plot(datetime, as.numeric(powerData$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime,as.numeric(powerData$Sub_metering_2), type="l", col="red")
lines(datetime,as.numeric(powerData$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime,as.numeric(powerData$Global_reactive_power),xlab = "datetime",ylab = "Global_reactive_power",type = "l")
dev.off()
