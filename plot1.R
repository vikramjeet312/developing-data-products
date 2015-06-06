library("sqldf")
power<-read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007','2/2/2007')", header=T, sep=";")
GlobalActivePower<-power[,3]
png(filename = "plot1.png", width = 480, height = 480, units="px")
hist(GlobalActivePower, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()