# Set working directory to the path where household_power_consumption.txt file exists, before running below statements

mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot1.png", width=480, height=480)
hist(as.numeric(subSetData$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()