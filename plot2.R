# Data Science Specilization 
# 4. Exploratory Data Analysis
# Author: Arturo Vera
# 2020/05/26
# Plot2

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

# Plot 2

png("plot2.png", width=480, height=480)
plot(x = data$DateTime, y = data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
