##get data set
data_file<-"./Data/household_power_consumption.txt"
data_set<-read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


##subset required data
subset_data <- data_set[data_set$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_ActivePower <- as.numeric(subset_data$Global_active_power)

##plot data
png("plot2.png", width=480, height=480)
plot(datetime, Global_ActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()