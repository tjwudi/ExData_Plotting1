d <- read.delim(
  'household_power_consumption.txt',
  sep = ";",
  colClasses = c('character', 'character', rep('numeric', 7)),
  na = "?")
d <- d[d$Date == '1/2/2007' | d$Date == '2/2/2007',]
d <- transform(d, Date = Date)
d <- cbind(d, DateTime = paste(d$Date, d$Time))
d <- transform(d, DateTime = as.character(DateTime))
d <- transform(d, DateTime = strptime(DateTime, '%d/%m/%Y %H:%M:%S'))

png(filename = "plot4.png", 
    width = 480,
    height = 480)
par(mfrow = c(2, 2))

plot(d$DateTime,
     d$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(d$DateTime,
     d$Voltage,
     type = "l",
     ylab = "Voltage")

plot(d$DateTime,
     d$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(d$DateTime, d$Sub_metering_2, col = "red")
lines(d$DateTime, d$Sub_metering_3, col = "blue")
# Remove the border of legend here.
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

plot(d$DateTime, d$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime",
     ylab = colnames(d)[4])
dev.off()