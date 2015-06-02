#   Important note!!!
#   Data file contains lines with "?" signs instead of values, which forces R to see all columns as factors
#   They are now interpreted as lost ones. While my solution is not good niether universal, it works here


data = read.csv('household_power_consumption.txt', sep = ";", na.strings = "?")
data = subset (data, Date == "1/2/2007" | Date == "2/2/2007")

png(file = "plot1.png")
with (data, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)"))
dev.off()
