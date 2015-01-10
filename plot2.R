# Set working directory to the path where household_power_consumption.txt file exists, before running below statements

mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot2.png", width=480, height=480)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower<- as.numeric(subSetData$Global_active_power)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
