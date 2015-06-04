# Exploratory Data Analysis
# Project 1
# Plot 2 of 4

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

# strptime(myRows$Time, "%X")
# as.Date(myRows$Date, "%d/%m/%Y")

# dd <- as.Date(paste(myRows$Date, " ", myRows$Time), "%d/%m/%Y %X")
# d2 <- strftime(dd)

# Combine the date and time vectors into one date object vector
dateTime <- strptime(paste(myRows$Date, " ", myRows$Time), "%d/%m/%Y %X")

png("plot2.png")
plot(dateTime, as.numeric(myRows$Global_active_power), type = 'l', ylab = 'Global Active Power (kilowatts)',
     xlab = '')
dev.off()
