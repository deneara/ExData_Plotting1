# This script is for constructing the plot4.png file from the household_power_consumption.txt file
# It assumes that the household_power_consumption.txt is in the Working Directory

library(lubridate)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", skip = 66636, nrows = 2880)
header <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", nrows = 1)
colnames(data) <- unlist(header)
data$Date_Time <- with(data, dmy(Date) + hms(Time))

par(mfrow = c(2,2), mar = c(4,4,2,2)) # set plotting space

# plot 1
plot(x = data$Date_Time, y = data$Global_active_power, "l", ylab = "Global Active Power", xlab = "")

# plot 2
plot(x = data$Date_Time, y = data$Voltage, "l", ylab = "Voltage", xlab = "datetime")

# plot 3
plot(x = data$Date_Time, y = data$Sub_metering_1, "l", ylab = "Energy sub metering", xlab = "")
lines(x = data$Date_Time, y = data$Sub_metering_2, col = "red")
lines(x = data$Date_Time, y = data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 4
plot(x = data$Date_Time, y = data$Global_reactive_power, "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file = "plot4.png")
dev.off()