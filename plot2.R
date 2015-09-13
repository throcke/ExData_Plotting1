## Read Full Dataset
fulldata <- read.table("./household_power_consumption.txt", header=TRUE, sep=';',na.strings="?",stringsAsFactors=FALSE)

## Use as.Date() function
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## Create the Subset Data
data <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Codes for plot2.r
data$Datetime <- paste(as.Date(data$Date),data$Time)
data$Datetime <- as.POSIXct(data$Datetime)

## Plot 2
plot(data$Datetime, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

## Png 2
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
