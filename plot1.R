# Assume file is in working directory
data <- read.csv2("household_power_consumption.txt", header = TRUE)

# Convert dates to date format 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset data to include only range between dates 2007-02-01 and 2007-02-02
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Transform values to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Open PNG device to output plot
png(filename = "plot1.png", width=480, height=480)

# Plot the histogram
with(data, hist(Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", 
                 xaxt='n'))

# draw x axis with bucket ids
axis(side=1, at=seq(0,6, 2), labels=seq(0,6,2))

# Close the PNG device
dev.off() 






