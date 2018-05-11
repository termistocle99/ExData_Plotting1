# This is the code for assignement 1 in data exploratory course

# setting my working directory

#setwd("C:/Users/Ali TIMITE/Downloads/data science/exam")

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="consumption.zip")
#unzip consumption to /consumption directory

unzip(zipfile= "consumption.zip",exdir="./consumption")

#import file as a dataframe
cons <- read.table("./consumption/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

#create a 10th column combining Date and Time
fulltimedate <- strptime(paste(cons$Date, cons$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

# combine new column with cons
cons <- cbind(cons, fulltimedate)

# Date column conversion 
cons$Date <- as.Date(cons$Date, format= "%d/%m/%Y")

#subsetting cons for final dataframe
final <- subset(cons, Date == "2007-02-01" | Date == "2007-02-02")

# variable Global_active_power conversion as numeric
final$Global_active_power <- as.numeric(final$Global_active_power)

# graph desingning
png("plot2.png")
with(final, plot(fulltimedate, Global_active_power, type="l",xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()