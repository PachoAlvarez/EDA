#---------------------------< Set working directory
setwd("D:/aToCoursera/") 

#---------------------------< Read the problem data
data <- read.table("household_power_consumption.txt", header=F, sep=";",
                   skip=66637, nrows=2880, 
                   colClasses=c("character", "character", 
                                "numeric", "numeric", "numeric", "numeric", 
                                "numeric", "numeric", "numeric"))

names <- c("Date",                  "Time",           "Global_active_power", 
           "Global_reactive_power", "Voltage",        "Global_intensity", 
           "Sub_metering_1",        "Sub_metering_2", "Sub_metering_3")

colnames(data)    <- names

data$CompleteTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                              format="%d/%m/%Y %H:%M:%S")

#-----------------------< Plot 1
png(file='plot1.png', width = 480, height = 480)
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()