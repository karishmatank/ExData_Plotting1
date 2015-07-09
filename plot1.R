## Reading in data
data <- "C:/Users/Karishma/Desktop/Coursera/Exploratory Data Analysis- Johns Hopkins/household_power_consumption.txt"
data_read <- read.table(data, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##Subsetting data
subset <- data_read[data_read$Date %in% c("1/2/2007","2/2/2007") ,]
remove(data_read)

##Plot data
xname <- "Global Active Power (kilowatts)"
yname <- "Frequency"
hist(subset$Global_active_power, main = "Global Active Power", xlab = xname, ylab = yname, col = "red")

##Save to PNG file
dev.copy(png, file = "plot1.png")
dev.off()