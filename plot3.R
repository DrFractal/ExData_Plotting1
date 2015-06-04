# Exploratory Data Analysis
# Project 1
# Plot 3 of 4

path2csv <- "D:/R/Coursera/Exploratory Data Analysis/Project 1/ExData_Plotting1/household_power_consumption.txt"
#classes <- c("Date", character, numeric, numeric, numeric, numeric, numeric, numeric, numeric)
colTypes <- c(character, character, 
              numeric, numeric, numeric, numeric, numeric, numeric, numeric)
mydf <- read.csv(path2csv, sep = ";", #colClasses = colTypes, 
                 na.strings = "?", blank.lines.skip = TRUE,
                 stringsAsFactors = FALSE)

library(dplyr)
plot1df <- tbl_df(mydf)
rm("mydf")  ## clean up

myRows <- filter(plot1df, Date == "1/2/2007" | Date == "2/2/2007")

# Combine the date and time vectors into one date object vector
dateTime <- strptime(paste(myRows$Date, " ", myRows$Time), "%d/%m/%Y %X")

png("plot3.png")

plot(dateTime, as.numeric(myRows$Sub_metering_1), type = 'l', ylab = 'Energy sub metering',
     xlab = '')
lines(dateTime, as.numeric(myRows$Sub_metering_2), col = 'red')
lines(dateTime, as.numeric(myRows$Sub_metering_3), col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       lty = 1, # display lines for the symbols
       lwd = 2, # the thickness of the lines
       col = c('black', 'red', 'blue'))

dev.off()
