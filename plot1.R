d <- read.delim(
  'household_power_consumption.txt',
  sep = ";",
  colClasses = c('character', 'character', rep('numeric', 7)),
  na = "?")
d <- d[d$Date == '1/2/2007' | d$Date == '2/2/2007',]

png('plot1.png')
hist(
  d$Global_active_power,
  main = 'Global Active Power',
  xlab = 'Global Active Power (kilowatts)',
  col = 'red')
dev.off()