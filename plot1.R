## Read the file into dataset called data
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption2.txt"'),header=TRUE,as.is=TRUE,sep=";",na.string="?")
colnames(data) <-names(read.table('household_power_consumption2.txt',header=TRUE,as.is=TRUE,sep=";",na.string="?",nrows=1))

## Convert Date and Time String to POSIXlt Date/Time class.
data$NewDate<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %T")

## Open PNG device to receive plot
png(filename="plot1.png",width=480,height=480,units="px")

## Plot data as histogram per assignment
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Save histogram as PNG file
dev.off()