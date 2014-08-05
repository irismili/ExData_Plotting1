# Assume file is in working directory
data <- read.csv2("household_power_consumption.txt", header = TRUE)

# Convert dates to date format 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset data to include only range between dates 2007-02-01 and 2007-02-02
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Transform values to numeric
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <-  as.numeric(as.character(data$Sub_metering_3))

# Open PNG device to output plot
png(filename = "plot3.png", width=480, height=480)

# Create the plot
with(data, plot(datetime, Sub_metering_1, type="n", xlab="",ylab="Energy sub metering"))
with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
# draw a legend, position at top right
with(data, legend("topright", colnames(data)[7:9],lty=1,col=c("black","red","blue"), cex=1))

# Close the PNG device
dev.off() 
