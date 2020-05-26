# Data Science Specilization 
# 4. Exploratory Data Analysis
# Author: Arturo Vera
# 2020/05/26
# Plot4

library(data.table)

#Download data an save in Work Directory

dir <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(dir, "data.zip"))
unzip(zipfile = "data.zip")

data <- fread(input = "household_power_consumption.txt", na.strings = "?")  # Reads data
data$Global_active_power <- as.numeric(data$Global_active_power)            # Convert Global_ac... column to numeric type
data$DateTime <- as.POSIXct(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S") # Join Date and Time columns
data <- data[(DateTime >= "2007-02-01") & (DateTime <= "2007-02-03")]       # Subset data for specified dates

# Plot 4

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Plot 4.1
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# Plot 4.2
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
# Plot 4.3
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "), lty=c(1,1), bty="n", cex=.5) 
# Plot 4.4
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
