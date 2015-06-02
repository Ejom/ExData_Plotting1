#   Important note!!!
#   Data file contains lines with "?" signs instead of values, which forces R to see all columns as factors
#   They are now interpreted as lost ones. While my solution is not good niether universal, it works here


data = read.csv('household_power_consumption.txt', sep = ";", na.strings = "?")
data = subset (data, Date == "1/2/2007" | Date == "2/2/2007")

png(file = "plot3.png")
with (data, plot(Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = NA, xaxt = "n"))
axis (2, lwd = 2)
axis(1, c(1,length(data$Sub_metering_1)/2,length(data$Sub_metering_1)), c("Thu","Fri", "Sat"))
lines(data$Sub_metering_1, col = "black")
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
dev.off()
