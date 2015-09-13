## Read Full Dataset
fulldata <- read.table("./household_power_consumption.txt", header=TRUE, sep=';',na.strings="?",stringsAsFactors=FALSE)

## Use as.Date() function
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## Create the Subset Data
data <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting Date & Time (Same as plot2)
data$Datetime <- paste(as.Date(data$Date),data$Time)
data$Datetime <- as.POSIXct(data$Datetime)

## Create a 2x2 window
par(mfrow=c(2,2))

# Subplot 1
plot(data$Datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Subplot2
plot(data$Datetime,data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Subplot3
plot(data$Datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Datetime,data$Sub_metering_2, type="l", col="red")
lines(data$Datetime,data$Sub_metering_3, type="l", col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2)

# Subplot4
plot(data$Datetime,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Export Png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
