# Exploratory Data Analysis
# Project 1
# Plot 1 of 4

path2csv <- "household_power_consumption.txt"

## Note creating colTypes and using it in read.csv() works fine,
## but it takes longer to run, since it has to convert most of the dataframe
## to numeric. It's better to just convert a single column to numeric 
## when needed in plot().
# colTypes <- c('character', 'character', 
#               'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric',
#               'numeric')
mydf <- read.csv(path2csv, sep = ";", 
#                  colClasses = colTypes, ## works, but takes a long time
                 na.strings = "?", blank.lines.skip = TRUE,
                 stringsAsFactors = FALSE)
#dim(mydf)
#head(mydf)
myRows <- mydf[mydf$Date == "1/2/2007" | mydf$Date == "2/2/2007", ]

## Another solution to filtering the rows:
# library(dplyr)
# plot1df <- tbl_df(mydf)
# rm("mydf")  ## clean up
# myRows <- filter(plot1df, Date == "1/2/2007" | Date == "2/2/2007")

png("plot1.png") # use a PGN device to plot
hist(as.numeric(myRows$Global_active_power), freq = TRUE, breaks = 12, 
     col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off() # close the PGN device
