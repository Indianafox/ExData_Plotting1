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
# Plot 1

Energy_Data$Global_active_power <- as.numeric(as.character(Energy_Data$Global_active_power))

png(filename = "Plot_1.png",width = 480, height = 480)
hist(Energy_Data$Global_active_power,col = "red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

 