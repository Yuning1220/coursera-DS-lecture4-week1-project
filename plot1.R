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



dev.new()
par(mfrow = c(1, 1))
hist(as.numeric(subpower$Global_active_power),col="red", xlab = "Global Active Power (kilowatts)"
     ,main="Global Active Power")
png("plot1.png",width = 480, height = 480)
dev.off() 



