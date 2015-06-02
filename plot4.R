#   Important note!!!
#   Data file contains lines with "?" signs instead of values, which forces R to see all columns as factors
#   They are now interpreted as lost ones. While my solution is not good niether universal, it works here


data = read.csv('household_power_consumption.txt', sep = ";", na.strings = "?")
data = subset (data, Date == "1/2/2007" | Date == "2/2/2007")


png(file = "plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,1))

# Graph 1
with (data, plot(Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = NA, xaxt = "n"))
axis (2, lwd = 2)
axis(1, c(1,length(data$Global_active_power)/2,length(data$Global_active_power)), c("Thu","Fri", "Sat"))

# Graph 2
with (data, plot(Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt = "n"))
axis (2, lwd = 2)
axis(1, c(1,length(data$Voltage)/2,length(data$Voltage)), c("Thu","Fri", "Sat"))

# Graph 3
with (data, plot(Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = NA, xaxt = "n"))
axis (2, lwd = 2)
axis(1, c(1,length(data$Sub_metering_1)/2,length(data$Sub_metering_1)), c("Thu","Fri", "Sat"))
lines(data$Sub_metering_1, col = "black")
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, bty = "n")

#Graph 4
with (data, plot(Global_reactive_power, type = "l", xlab = "datetime", xaxt = "n"))
axis (2, lwd = 2)
axis(1, c(1,length(data$Global_reactive_power)/2,length(data$Global_reactive_power)), c("Thu","Fri", "Sat"))

dev.off()
