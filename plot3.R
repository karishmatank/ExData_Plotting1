## Reading in data
data <- "C:/Users/Karishma/Desktop/Coursera/Exploratory Data Analysis- Johns Hopkins/household_power_consumption.txt"
data_read <- read.table(data, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##Subsetting data
subset <- data_read[data_read$Date %in% c("1/2/2007","2/2/2007") ,]
remove(data_read)

##Plot data
DateTime <- strptime(paste(subset$Date, subset$Time), format = "%d/%m/%Y %H:%M:%S")
yname <- "Energy sub metering"
png("plot3.png", width = 480, height = 480)
plot(DateTime, subset$Sub_metering_1, type = "l", xlab = "", ylab = yname)
lines(DateTime, subset$Sub_metering_2, col = "red")
lines(DateTime, subset$Sub_metering_3, col = "blue")
legend("topright", lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))

##Save to PNG file, using dev.copy cuts off legend
dev.off()