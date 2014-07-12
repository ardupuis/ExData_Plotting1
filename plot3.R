## Used Text Editor to select data for the two dates in question: 2007-02-01 and 2007-02-02
## because I don't know how to read in selective data...yet.

## Read the already filtered data file into dataset called data
data<-read.csv("household_power_consumption.txt",header=TRUE,as.is=TRUE,sep=";",na.string="?")

## Convert Date and Time String to POSIXlt Date/Time class.
data$NewDate<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %T")

## Open PNG device to receive plot
png(filename="plot3.png",width=504,height=504,units="px")

## Plot data according to request
with(data,{
    plot(NewDate,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="");
    lines(NewDate,Sub_metering_2,col="red");
    lines(NewDate,Sub_metering_3,col="blue");
    legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

## Save plot
dev.off()