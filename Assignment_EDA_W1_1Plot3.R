# Exploratory Data Analysis - Assignment 1

setwd("/Users/Denzel/Documents/Coursera")
library("dplyr")

#library(sqldf)
#Raw_Data <- read.csv.sql(fn, sql = 'select * from file where Date = "2007-02-01" or Date ="2007-02-02"')
# Read in data containing column labels Raw data 
Raw_Data <- read.csv("household_power_consumption copy.txt",sep=";")

Energy_Data <- Raw_Data
Energy_Data$Date <- as.Date(as.character(Energy_Data$Date) ,format = "%d/%m/%Y")
Energy_Data <- Energy_Data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

library("graphics")
# Plot 3

Energy_Data$Global_active_power <- as.numeric(as.character(Energy_Data$Global_active_power))
Energy_Data$Date_Time <- paste(Energy_Data$Date,Energy_Data$Time)
# Convert Date_Time variable from class Character to POSIXlt
Energy_Data$Date_Time <- strptime(Energy_Data$Date_Time, format = "%Y-%m-%d %H:%M:%S")
# Set Graphics device to png file
png(filename = "Plot_3.png",width = 480, height = 480)
# Plot line graph 
plot(Energy_Data$Date_Time, Energy_Data$Sub_metering_1,col = "black",
     ylab = "Energy Sub Metering (kilowatts)",type = "l", xlab = "")
# Add Sub metering 2 line
lines(Energy_Data$Date_Time, Energy_Data$Sub_metering_2,col = "red",
     type = "l", xlab = "")
# Add Sub metering 3 line
lines(Energy_Data$Date_Time, Energy_Data$Sub_metering_3,col = "blue",
     type = "l", xlab = "")
legend("topright",lwd = 2, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       xjust = 1)
dev.off() # Close graphics device


 