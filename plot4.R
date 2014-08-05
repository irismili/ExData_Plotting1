# Assume file is in working directory
data <- read.csv2("household_power_consumption.txt", header = TRUE)

# Convert dates to date format 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset data to include only range between dates 2007-02-01 and 2007-02-02
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Transform values to numeric when necessary
data$Global_active_power <-  as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <-  as.numeric(as.character(data$Global_reactive_power))
data$Voltage <-  as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <-  as.numeric(as.character(data$Sub_metering_3))

png(filename = "plot4.png", width=480, height=480)

# Divide plot area into a matrix 2 x 2
par(mfrow = c(2,2))

# PLOT 1 positioned at (1,1)
with(data, plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power"))
with(data, lines(datetime, Global_active_power))

# PLOT 2 positioned at (1,2)
with(data, plot(datetime, Voltage, type="n",xlab="datetime", ylab="Voltage"))
with(data, lines(datetime, Voltage))

# PLOT 3 positioned at (2,1)
with(data, plot(datetime, Sub_metering_1, type="n", xlab="",ylab="Energy sub metering"))
with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
# draw a legend, position at top right, do not include a box around the legend (bty="n")
with(data, legend("topright", bty="n", colnames(data)[7:9],lty=1,col=c("black","red","blue")))

# PLOT 4 positioned at (2,2)
with(data, plot(datetime, Global_reactive_power, type="n"))
with(data, lines(datetime, Global_reactive_power))

# Close the PNG device
dev.off() 

# Reset to defaults
par(mfrow = c(1,1))






