#Read the file into R
dataFile <- "./data/household_power_consumption.txt"

powerConsume<-read.table(dataFile,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

sub_powerConsume <- subset(powerConsume,powerConsume$Date=="1/2/2007" | powerConsume$Date =="2/2/2007")

datetime <- strptime(paste(sub_powerConsume$Date, sub_powerConsume$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(sub_powerConsume$Global_active_power)

subMeter1<-as.numeric(sub_powerConsume$Sub_metering_1)

subMeter2<-as.numeric(sub_powerConsume$Sub_metering_2)

subMeter3<-as.numeric(sub_powerConsume$Sub_metering_3)

png("plot3.png",width=480, height=480)

plot(datetime,subMeter1,type="l",ylab="energy sub metering",xlab="")

lines(datetime,subMeter2,type='l',col="red")

lines(datetime,subMeter3,type='l',col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#title(main())
#hist(as.numeric(as.character(sub_powerConsume$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()