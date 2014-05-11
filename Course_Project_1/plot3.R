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

#-----------------------< Plot 3
plot(data$CompleteTime, data$Sub_metering_1, type="l", 
     col=1, xlab="", pch="1",
     ylab="Energy sub metering")
lines(data$CompleteTime, data$Sub_metering_2, col=2)
lines(data$CompleteTime, data$Sub_metering_3, col=4)
legend("topright", pch="__", col=c(1, 2, 4),
       legend=c("Sub_metering_1", "Sub_metering_2", 
                "Sub_metering_3"))
dev.copy(png, file='plot3.png', width = 480, height = 480)
dev.off()