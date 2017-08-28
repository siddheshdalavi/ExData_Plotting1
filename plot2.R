#Read the file into R
dataFile <- "./data/household_power_consumption.txt"

powerConsume<-read.table(dataFile,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

sub_powerConsume <- subset(powerConsume,powerConsume$Date=="1/2/2007" | powerConsume$Date =="2/2/2007")

datetime <- strptime(paste(sub_powerConsume$Date, sub_powerConsume$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(sub_powerConsume$Global_active_power)

png("plot2.png",width=480, height=480)

plot(datetime,globalActivePower,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#title(main())
#hist(as.numeric(as.character(sub_powerConsume$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()