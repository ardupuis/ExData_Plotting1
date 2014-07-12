## Read the file into dataset called data
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption2.txt"'),header=TRUE,as.is=TRUE,sep=";",na.string="?")
colnames(data) <-names(read.table('household_power_consumption2.txt',header=TRUE,as.is=TRUE,sep=";",na.string="?",nrows=1))

## Convert Date and Time String to POSIXlt Date/Time class.
data$NewDate<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %T")

## Open PNG device to receive plot
png(filename="plot4.png",width=480,height=480,units="px")

## set label and axis font size smaller and plots per row
par(mfcol=c(2,2))

## Plot data according to request
## Global Active Power plot
plot(data$NewDate,data$Global_active_power,"l",ylab="Global Active Power",xlab="")

## Energy sub metering plot
with(data,{
    plot(NewDate,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="");
    lines(NewDate,Sub_metering_2,col="red");
    lines(NewDate,Sub_metering_3,col="blue");
    legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.9,bty="n")
})

## Voltage plot
plot(data$NewDate,data$Voltage,"l",ylab="Voltage",xlab="datetime")

## Global-reactive_power plot
plot(data$NewDate,data$Global_reactive_power,"l",ylab="Global_reactive_power",xlab="datetime")


## Save plot as PNG file
dev.off() 