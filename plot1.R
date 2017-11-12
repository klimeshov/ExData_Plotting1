powerData <- read.table("household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

##subset according to given dates
powerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]

#deleted all the rows that had NA values
energyData <-na.omit(energyData)

#plot data
hist(energyData$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",ylim=c(0,1200))

#Copying to a png file
dev.copy(png,"plot1.png")
dev.off()