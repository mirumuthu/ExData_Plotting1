#Read the data into local table 
alldt <- read.table("household_power_consumption.txt", sep=";",  colClasses=c("character","character","numeric","numeric",  "numeric","numeric", "numeric","numeric","numeric"),
                    header=T, stringsAsFactors=F, na.strings = "?" );

##subset the data 
hpc <-subset(alldt, Date=="1/2/2007" | Date=="2/2/2007"); 

remove(alldt); ## remove the full data sest from memory

hpc$Time <- strptime( paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S" );
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y"); 

##plot 2

png(filename="plot2.png", width=480, height=480)
plot ( hpc$Time , hpc$Global_active_power , type ="l", xlab="", ylab="Global Active Power")
dev.off();

remove(hpc)