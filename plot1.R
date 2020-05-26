# Data Science Specilization 
# 4. Exploratory Data Analysis
# Author: Arturo Vera
# 2020/05/26
# Plot1

library(data.table)

#Download data an save in Work Directory

dir <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(dir, "data.zip"))
unzip(zipfile = "data.zip")

data <- fread(input = "household_power_consumption.txt", na.strings = "?")  # Reads data
data$Global_active_power <- as.numeric(data$Global_active_power)            # Convert Global_ac... column to numeric type
data$Date <- as.Date(data$Date, "%d/%m/%Y")                                 # Convert Date column to date type
data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]               # Subset data for specified dates

# Plot 1

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
