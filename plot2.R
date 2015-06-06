library("sqldf")
power<-read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007','2/2/2007')", header=T, sep=";")
GlobalActivePower<-power[,3]
dateTime   <- as.POSIXlt(paste(as.Date(power$Date, format="%d/%m/%Y"), power$Time, sep=" "))
png(filename = "plot2.png", width = 480, height = 480, units="px")
plot(dateTime, GlobalActivePower, xlab = "", ylab="Global Active Power (kilowatts)", type = "l")
dev.off()