## Read the file into dataset called data
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption2.txt"'),header=TRUE,as.is=TRUE,sep=";",na.string="?")
colnames(data) <-names(read.table('household_power_consumption2.txt',header=TRUE,as.is=TRUE,sep=";",na.string="?",nrows=1))

## Convert Date and Time String to POSIXlt Date/Time class.
data$NewDate<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %T")

## Open PNG device to receive plot
png(filename="plot2.png",width=480,height=480,units="px")

## Plot data according to request
plot(data$NewDate,data$Global_active_power,"l",ylab="Global Active Power (kilowatts)",xlab="")

## Save plot as PNG file
dev.off()