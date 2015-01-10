# Set working directory to the path where household_power_consumption.txt file exists, before running below statements

mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot4.png", width=480, height=480)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
par(mfrow=c(2,2),mar=c(4,4,2,2))
plot(datetime, as.numeric(subSetData$Global_active_power), type="l", xlab="", ylab="Global Active Power")
plot(datetime,as.numeric(subSetData$Voltage),type="l",xlab="datetime",ylab="Voltage")
plot(datetime, as.numeric(subSetData$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(datetime,as.numeric(subSetData$Sub_metering_2),col="red")
lines(datetime,as.numeric(subSetData$Sub_metering_3),col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime,as.numeric(subSetData$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()