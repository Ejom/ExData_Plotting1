#   Important note!!!
#   Data file contains lines with "?" signs instead of values, which forces R to see all columns as factors
#   They are now interpreted as lost ones. While my solution is not good niether universal, it works here


data = read.csv('household_power_consumption.txt', sep = ";", na.strings = "?")
data = subset (data, Date == "1/2/2007" | Date == "2/2/2007")

png(file = "plot2.png")
with (data, plot(Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = NA, xaxt = "n"))
axis (2, lwd = 2)
axis(1, c(1,length(data$Global_active_power)/2,length(data$Global_active_power)), c("Thu","Fri", "Sat"))
dev.off()
