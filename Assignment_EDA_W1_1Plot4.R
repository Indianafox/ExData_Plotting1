# Exploratory Data Analysis - Assignment 1

setwd("/Users/Denzel/Documents/Coursera")
library("dplyr")
library("graphics")

# Read in data containing column labels Raw data 
Raw_Data <- read.csv("household_power_consumption copy.txt",sep=";")
Energy_Data <- Raw_Data

Energy_Data$Date <- as.Date(as.character(Energy_Data$Date) ,format = "%d/%m/%Y")
Energy_Data <- Energy_Data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

# Allow for 4 charts in a 2 by 2 grid
par(mfrow = c(2,2))

##### Plot 1 #####
Energy_Data$Global_active_power <- as.numeric(as.character(Energy_Data$Global_active_power))
Energy_Data$Date_Time <- paste(Energy_Data$Date,Energy_Data$Time)
# Convert Date_Time variable from class Character to POSIXlt
Energy_Data$Date_Time <- strptime(Energy_Data$Date_Time, format = "%Y-%m-%d %H:%M:%S")

# Plot line graph 
plot(Energy_Data$Date_Time, Energy_Data$Global_active_power,col = "black",
     ylab = "Global Active Power",type = "l", xlab = "")

##### Plot 2 #####
Energy_Data$Voltage <- as.numeric(as.character(Energy_Data$Voltage))

# Plot line graph 
plot(Energy_Data$Date_Time, Energy_Data$Voltage,col = "black",
     ylab = "Voltage",type = "l", xlab = "datetime")

##### Plot 3 #####

# Plot line graph 
plot(Energy_Data$Date_Time, Energy_Data$Sub_metering_1,col = "black",
     ylab = "Global Active Power (kilowatts)",type = "l", xlab = "")
# Add Sub metering 2 line
lines(Energy_Data$Date_Time, Energy_Data$Sub_metering_2,col = "red",
     ylab = "Global Active Power (kilowatts)",type = "l", xlab = "")
# Add Sub metering 3 line
lines(Energy_Data$Date_Time, Energy_Data$Sub_metering_3,col = "blue",
     ylab = "Global Active Power (kilowatts)",type = "l", xlab = "")
legend("top",lwd = 2, col = c("black","red","blue"),legend = c("Sub_metering_1",
                      "Sub_metering_2","Sub_metering_3"), bty = "n", xjust = 1)

##### Plot 4 #####

Energy_Data$Global_reactive_power <- as.numeric(as.character(Energy_Data$Global_reactive_power))

# Plot line graph 
plot(Energy_Data$Date_Time, Energy_Data$Global_reactive_power,col = "black",
     ylab = "Global_Reactive_Power",type = "l", xlab = "datetime")
dev.copy(png,file = "Plot_4.png")
dev.off() # Close graphics device


 