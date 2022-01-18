## project of week 1 of lecture 4
setwd("/Users/sunyuning/Desktop/背景/JHU data science/lecture4/week1")

filename <- "Coursera_DS4_week1.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
}

unzip(filename) 
#sep=";"的作用是：把排成一行的9个variables分开读取，原来有1列，现在有9列
#skip=1的作用是：跳过第一行，从数据的第二行开始读取
power <- read.table("household_power_consumption.txt",sep=";")
colname <- power[1,]
power<-power #去除第一行
names(power) <- colname

subpower<-subset(power, Date=="1/2/2007"|Date=="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
# 上两条操作过后，subpower$Time地方的年月日是当下的年月日，要转成"2007-02-01"和"2007-02-02"
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],
                                  "2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],
                                     "2007-02-02 %H:%M:%S")

dev.new()
par(mfrow = c(1, 1))
plot(subpower$Time,
     as.numeric(as.character(subpower$Sub_metering_1)),
     type="l", xlab="",
     ylab="Energy sub metering")
lines(subpower$Time,
      as.numeric(as.character(subpower$Sub_metering_2)),
      col="red")
lines(subpower$Time,
      as.numeric(as.character(subpower$Sub_metering_3)),
      col="blue")
legend("topright", lty=1,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6)
dev.off()


