# This script is for constructing the plot1.png file from the household_power_consumption.txt file
# It assumes that the household_power_consumption.txt is in the Working Directory
# in order to see all y-axis labels, increase the size of the plot window.

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", skip = 66636, nrows = 2880))
header <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", nrows = 1)
colnames(data) <- unlist(header)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts"), ylim = c(0,1200))
dev.copy(png, file = "plot1.png")
dev.off()