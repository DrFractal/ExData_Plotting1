# Exploratory Data Analysis
# Project 1
# Plot 2 of 4

path2csv <- "household_power_consumption.txt"

## Note creating colTypes and using it in read.csv() works fine,
## but it takes longer to run, since it has to convert most of the dataframe
## to numeric. It's better to just convert a single column to numeric 
## when needed in plot().
# colTypes <- c('character', 'character', 
#               'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric',
#               'numeric')
mydf <- read.csv(path2csv, sep = ";", 
                 #colClasses = colTypes, ## works, but takes a long time
                 na.strings = "?", blank.lines.skip = TRUE,
                 stringsAsFactors = FALSE)
myRows <- mydf[mydf$Date == "1/2/2007" | mydf$Date == "2/2/2007", ]

# Combine the date and time vectors into one date object vector
dateTime <- strptime(paste(myRows$Date, " ", myRows$Time), "%d/%m/%Y %X")

png("plot2.png") # use a PGN device to plot
plot(dateTime, as.numeric(myRows$Global_active_power), type = 'l', ylab = 'Global Active Power (kilowatts)',
     xlab = '')
dev.off() # close the PGN device
