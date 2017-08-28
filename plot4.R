#Read the file into R
dataFile <- "./data/household_power_consumption.txt"

powerConsume<-read.table(dataFile,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

sub_powerConsume <- subset(powerConsume,powerConsume$Date=="1/2/2007" | powerConsume$Date =="2/2/2007")

datetime <- strptime(paste(sub_powerConsume$Date, sub_powerConsume$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


globalReactivePower <- as.numeric(sub_powerConsume$Global_reactive_power)

voltage <- as.numeric(sub_powerConsume$Voltage)

globalActivePower <- as.numeric(sub_powerConsume$Global_active_power)

subMeter1<-as.numeric(sub_powerConsume$Sub_metering_1)

subMeter2<-as.numeric(sub_powerConsume$Sub_metering_2)

subMeter3<-as.numeric(sub_powerConsume$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMeter2, type="l", col="red")

lines(datetime, subMeter3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()