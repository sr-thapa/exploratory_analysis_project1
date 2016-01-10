
##get file path
data_file<-"./Data/household_power_consumption.txt"

##get dataset
data_set<-read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##subsetting data
subset_data <- data_set[data_set$Date %in% c("1/2/2007","2/2/2007") ,]

Global_ActivePower <- as.numeric(subset_data$Global_active_power)

##Plotting the data
png("plot1.png", width=480, height=480)
hist(Global_ActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

