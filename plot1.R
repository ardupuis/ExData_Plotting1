## Used Text Editor to select data for the two dates in question: 2007-02-01 and 2007-02-02
## because I don't know how to read in selective data...yet.

## Read the already filtered data file into dataset called data
data<-read.csv("household_power_consumption.txt",header=TRUE,as.is=TRUE,sep=";",na.string="?")

## Convert Date and Time String to POSIXlt Date/Time class.
data$NewDate<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %T")

## Open PNG device to receive plot
png(filename="plot1.png",width=504,height=504,units="px")

## Plot data as histogram per assignment
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Save histogram as PNG file
dev.off()