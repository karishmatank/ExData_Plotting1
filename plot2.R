## Reading in data
data <- "C:/Users/Karishma/Desktop/Coursera/Exploratory Data Analysis- Johns Hopkins/household_power_consumption.txt"
data_read <- read.table(data, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##Subsetting data
subset <- data_read[data_read$Date %in% c("1/2/2007","2/2/2007") ,]
remove(data_read)

##Plot data
DateTime <- strptime(paste(subset$Date, subset$Time), format = "%d/%m/%Y %H:%M:%S")
yname = "Global Active Power (kilowatts)"
plot(DateTime, subset$Global_active_power, type = "l", xlab = "", ylab = yname)

##Save to PNG file
dev.copy(png, file = "plot2.png")
dev.off()