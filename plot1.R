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
