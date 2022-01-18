## project of week 1 of lecture 4
setwd("/Users/sunyuning/Desktop/背景/JHU data science/lecture4/week1")

power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
# 上两条操作过后，subpower$Time地方的年月日是当下的年月日，要转成"2007-02-01"和"2007-02-02"
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],
                                  "2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],
                                     "2007-02-02 %H:%M:%S")


dev.new()
par(mfrow = c(1,1))
plot(subpower$Time,
     as.numeric(as.character(subpower$Global_active_power)),
     type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

title(main="Global Active Power Vs Time")
dev.off()
