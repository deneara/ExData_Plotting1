# This script is for constructing the plot2.png file from the household_power_consumption.txt file
# It assumes that the household_power_consumption.txt is in the Working Directory

library(lubridate)
library(dplyr)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", skip = 66636, nrows = 2880)
header <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", nrows = 1)
colnames(data) <- unlist(header)
data$Date_Time <- with(data, dmy(Date) + hms(Time))
plot(x = data$Date_Time, y = data$Global_active_power, "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()