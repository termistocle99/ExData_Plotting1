# This is the code for assignement 1 in data exploratory course

# setting my working directory

#setwd("C:/Users/Ali TIMITE/Downloads/data science/exam")

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="consumption.zip")
#unzip consumption to /consumption directory

unzip(zipfile= "consumption.zip",exdir="./consumption")

#import file as a dataframe
cons <- read.table("./consumption/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

#convert variable Date to date format
cons$Date <- as.Date(cons$Date, "%d/%m/%Y")

# subset "cons" to obtain our final dataframe
library(dplyr)
final <- filter(cons, Date == "2007-02-01" | Date == "2007-02-02")

#conversion of variables

final$Global_active_power <- as.numeric(final$Global_active_power)

# make histogramm and save it as png image

png("plot1.png")

hist(final$Global_active_power,
      main="Global Active Power",
      xlab= "Global Active Power(kilowatts)",
      col = "red")

dev.off()