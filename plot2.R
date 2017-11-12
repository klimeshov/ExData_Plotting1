powerData <- read.table("household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

##subset according to given dates
powerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]


#deleted all the rows that had NA values
powerData <-na.omit(powerData)

#making date in format
datetime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(powerData$Global_active_power)

#creating a plot
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

