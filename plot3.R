##get data set
data_file<-"./Data/household_power_consumption.txt"
data_set<-read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


##subset required data
subset_data <- data_set[data_set$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_ActivePower <- as.numeric(subset_data$Global_active_power)
subMetering_1 <- as.numeric(subset_data$Sub_metering_1)
subMetering_2 <- as.numeric(subset_data$Sub_metering_2)
subMetering_3 <- as.numeric(subset_data$Sub_metering_3)

##plot to png
png("plot3.png", width=480, height=480)
plot(datetime, subMetering_1, type="l", ylab="Energy SubMetering", xlab="")
lines(datetime, subMetering_2, type="l", col="red")
lines(datetime, subMetering_3, type="l", col="blue")
legend("topright", c("SubMetering_1", "SubMetering_2", "SubMetering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()