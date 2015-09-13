## Read Full Dataset
fulldata <- read.table("./household_power_consumption.txt", header=TRUE, sep=';',na.strings="?",stringsAsFactors=FALSE)

## Use as.Date() function
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## Create the Subset Data
data <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
