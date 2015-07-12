rough <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
filtered <- subset(rough, Date == "1/2/2007"| Date == "2/2/2007")
filtered$Date.Time <- paste(filtered$Date, filtered$Time)
final <- cbind(filtered[1:2],filtered[10], filtered[3:9])
final$Date.Time <- strptime(final$Date.Time, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")
plot(final$Date.Time, final$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()