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
final$Sub_metering_1 <- as.numeric(final$Sub_metering_1)
final$Sub_metering_2 <- as.numeric(final$Sub_metering_2)
final$Sub_metering_3 <- as.numeric(final$Sub_metering_3)

#draw graph

png("plot3.png",width = 480, height = 480)
with(final, plot(fulltimedate, Sub_metering_1, type="l",xlab="", ylab="Energy sub metering"))
lines(final$fulltimedate, final$Sub_metering_2, col="red", type="l")
lines(final$fulltimedate, final$Sub_metering_3, col="blue", type="l")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col= c("black", "red", "blue"))
dev.off()

