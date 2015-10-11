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

png('plot2.png')
plot(
  d$DateTime,
  d$Global_active_power,
  type = 'l',
  xlab = '',
  ylab = 'Global Active Power (kilowatts)')
dev.off()