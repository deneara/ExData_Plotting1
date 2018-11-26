# This script is for constructing the plot3.png file from the household_power_consumption.txt file
# It assumes that the household_power_consumption.txt is in the Working Directory

library(lubridate)
library(dplyr)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", skip = 66636, nrows = 2880)
header <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", nrows = 1)
colnames(data) <- unlist(header)
data$Date_Time <- with(data, dmy(Date) + hms(Time))
plot(x = data$Date_Time, y = data$Sub_metering_1, "l", ylab = "Energy sub metering", xlab = "")
lines(x = data$Date_Time, y = data$Sub_metering_2, col = "red")
lines(x = data$Date_Time, y = data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()