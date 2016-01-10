##get data set
data_file<-"./Data/household_power_consumption.txt"
data_set<-read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


##subset required data
subset_data <- data_set[data_set$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_ActivePower <- as.numeric(subset_data$Global_active_power)
Global_ReactivePower <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subset_data$Voltage)

subMetering_1 <- as.numeric(subset_data$Sub_metering_1)
subMetering_2 <- as.numeric(subset_data$Sub_metering_2)
subMetering_3 <- as.numeric(subset_data$Sub_metering_3)



##Plot 
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, Global_ReactivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering_1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMetering_2, type="l", col="red")
lines(datetime, subMetering_3, type="l", col="blue")

legend("topright", c("SubMetering1", "SubMetering2", "SubMetering3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, Global_ReactivePower, type="l", xlab="datetime", ylab="Global_ReactivePower")

dev.off()