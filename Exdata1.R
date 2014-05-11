#PLOT 1 + DATA PREP
ex1 <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
ex1$plot1 <- as.numeric(ex1$Global_active_power)/1000
dates <- c("2007-02-01","2007-02-02")
ex1$Date <- strptime(ex1$Date, format ="%d/%m/%Y")
ex1$Date <- as.Date(ex1$Date)
ex2 <- ex1[ex1$Date %in% as.Date(dates),]
ex2$Time2 <- strptime(ex2$Time,format="%H:%M:%S")
plot1 <- hist(as.numeric(ex2$plot1),col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
png(filename="/home/bjoseph/exploratoryAnalysis1/ExData_Plotting1/plot1.png")
hist(as.numeric(ex2$plot1),col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

ex2$DateTime <- strptime(paste(ex2$Date, ex2$Time), "%Y-%m-%d %H:%M:%S")

#PLOT 2
png(filename="/home/bjoseph/exploratoryAnalysis1/ExData_Plotting1/plot2.png")
plot(ex2$DateTime,ex2$plot1,type="l", ylab="Global Active Power (kilowatts)",
     xlab="",main="",)
dev.off()

#PLOT 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")

heads = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(ex2$DateTime, ex2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(ex2$DateTime, ex2$Sub_metering_2, type="l", col="red")
lines(ex2$DateTime, ex2$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=heads)

dev.off()

#PLOT 4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
    
par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(ex2, {
    plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
    plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
    heads = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, type="l", col="red")
    lines(DateTime, Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=heads, bty="n")
    plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
})
dev.off()



