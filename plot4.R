# Exploratory Data Analysis
# Project 1
# Plot 4 of 4

path2csv <- "household_power_consumption.txt"

## In this plot, we need so many columns to be converted to numeric that
## it makes sense to convert them all at once.
colTypes <- c('character', 'character', 
              'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric',
              'numeric')
mydf <- read.csv(path2csv, sep = ";", 
                 colClasses = colTypes,
                 na.strings = "?", blank.lines.skip = TRUE,
                 stringsAsFactors = FALSE)
myRows <- mydf[mydf$Date == "1/2/2007" | mydf$Date == "2/2/2007", ]

# Combine the date and time vectors into one date object vector
dateTime <- strptime(paste(myRows$Date, " ", myRows$Time), "%d/%m/%Y %X")

png("plot4.png")    ## save image to this file
par(mfrow = c(2,2)) ## 2x2 matrix of graphs

## Top left graph
plot(dateTime, myRows$Global_active_power, type = 'l', ylab = 'Global Active Power',
     xlab = '')

## Top right graph
plot(dateTime, myRows$Voltage, type = 'l', ylab = 'Voltage',
     xlab = 'datetime')

## Bottom left graph
plot(dateTime, myRows$Sub_metering_1, type = 'l', ylab = 'Energy sub metering',
     xlab = '')
lines(dateTime, myRows$Sub_metering_2, col = 'red')
lines(dateTime, myRows$Sub_metering_3, col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       lty = 1, # display lines for the symbols. 1 repeats, so no need for c(1,1,1)
       lwd = 2, # the thickness of the lines
       col = c('black', 'red', 'blue'),  # colors for the lines
       bty = 'n')  # turn off the legend border

## bottom right graph
plot(dateTime, myRows$Global_reactive_power, type = 'l', ylab = 'Global_reactive_power',
     xlab = 'datetime')

dev.off()
