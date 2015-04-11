#Read the data into local table 
alldt <- read.table("household_power_consumption.txt", sep=";",  colClasses=c("character","character","numeric","numeric",  "numeric","numeric", "numeric","numeric","numeric"),
                    header=T, stringsAsFactors=F, na.strings = "?" );

##subset the data 
hpc <-subset(alldt, Date=="1/2/2007" | Date=="2/2/2007"); 

remove(alldt); ## remove the full data sest from memory

hpc$Time <- strptime( paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S" );
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y"); 

##Plot1
png(filename="plot1.png", width=480, height=480)
hist(hpc$Global_active_power, xlab= "Global Active Power (kilowatts)",
     col="red", main="Global Active Power", breaks = "Sturges",
     ylim = c(0,1200), xlim=c(0,6), xaxt="n", plot=T)
axis(side=1, at=seq(0,6,2))
dev.off();

remove(hpc)
