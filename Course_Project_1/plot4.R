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

#-----------------------< Plot 4
png(file='plot4.png', width = 480, height = 480)
par(mfrow=c(2, 2))
#1-1----------------
plot(data$CompleteTime, data$Global_active_power, type="l", 
     xlab="",
     ylab="Global Active Power")
#1-2----------------
plot(data$CompleteTime, data$Voltage, type="l", 
     xlab="datetime",
     ylab="Voltage")
#2-1----------------
plot(data$CompleteTime, data$Sub_metering_1, type="l", 
     col=1, xlab="", pch="1",
     ylab="Energy sub metering")
lines(data$CompleteTime, data$Sub_metering_2, col=2)
lines(data$CompleteTime, data$Sub_metering_3, col=4)
legend("topright", lty=1, col=c(1, 2, 4),
       legend=c("Sub_metering_1", "Sub_metering_2", 
                "Sub_metering_3"))
#2-2----------------
plot(data$CompleteTime, data$Global_reactive_power, type="l", 
     xlab="datetime",
     ylab="Global_reactive_power")
#-------------------
dev.off()