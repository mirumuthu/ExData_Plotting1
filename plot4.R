#Read the data into local table 
alldt <- read.table("household_power_consumption.txt", sep=";",  colClasses=c("character","character","numeric","numeric",  "numeric","numeric", "numeric","numeric","numeric"),
                    header=T, stringsAsFactors=F, na.strings = "?" );

##subset the data 
hpc <-subset(alldt, Date=="1/2/2007" | Date=="2/2/2007"); 

remove(alldt); ## remove the full data sest from memory

hpc$Time <- strptime( paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S" );
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y"); 

##plot 4
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot( hpc$Time,hpc$Global_active_power, ylab ="Global Active Power", type="l", xlab="")
plot( hpc$Time,hpc$Voltage, ylab="Voltage", xlab="datetime", type = "l")

plot ( hpc$Time , hpc$Sub_metering_1 , type ="l", xlab="", ylab="Energy sub metring")
lines(hpc$Time, hpc$Sub_metering_2, col="red", lty=1, lwd=1)
lines(hpc$Time, hpc$Sub_metering_3, col="blue", lty=1, lwd=1)
legend("topright", lwd=1, col=c("black","red","blue"),bty="n",  legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot( hpc$Time, hpc$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")
dev.off()