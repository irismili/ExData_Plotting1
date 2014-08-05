# Assume file is in working directory
data <- read.csv2("household_power_consumption.txt", header = TRUE)

# Convert dates to date format 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset data to include only range between dates 2007-02-01 and 2007-02-02
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Transform values to numeric 
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create a field containing both date and time 
data$datetime <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")

# Open PNG device to output plot
png(filename = "plot2.png", width=480, height=480)

# Create the plot
with(data, plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(data, lines(datetime, Global_active_power))

# Close the PNG device
dev.off() 





