## Reading in data
data <- "C:/Users/Karishma/Desktop/Coursera/Exploratory Data Analysis- Johns Hopkins/household_power_consumption.txt"
data_read <- read.table(data, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##Subsetting data
subset <- data_read[data_read$Date %in% c("1/2/2007","2/2/2007"), ]
remove(data_read)

##Plot data
DateTime <- strptime(paste(subset$Date, subset$Time), format = "%d/%m/%Y %H:%M:%S")
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

##Plot top left graph
plot(DateTime, subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

##Plot top right graph
plot(DateTime, subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##Plot bottom left graph
plot(DateTime, subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, subset$Sub_metering_2, col = "red")
lines(DateTime, subset$Sub_metering_3, col = "blue")
legend("topright", lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), bty = "n")

##Plot bottom right graph
plot(DateTime, subset$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

##Save to PNG file, using dev.copy cuts off legend
dev.off()