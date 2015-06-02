# Project 1
# Exploratory Data Analysis
# 

path2csv <- "D:/R/Coursera/Exploratory Data Analysis/Project 1/ExData_Plotting1/household_power_consumption.txt"
#classes <- c("Date", character, numeric, numeric, numeric, numeric, numeric, numeric, numeric)
colTypes <- c(character, character, 
             numeric, numeric, numeric, numeric, numeric, numeric, numeric)
mydf <- read.csv(path2csv, sep = ";", #colClasses = colTypes, 
                 na.strings = "?", blank.lines.skip = TRUE,
                 stringsAsFactors = FALSE)
#dim(mydf)
#head(mydf)

library(dplyr)
plot1df <- tbl_df(mydf)
rm("mydf")  ## clean up

myRows <- filter(plot1df, Date == "1/2/2007" | Date == "2/2/2007")

png("plot1.png") #, width = 4, height = 4, units = "in", res = 300)
hist(as(myRows$Global_active_power, "numeric"), freq = TRUE, breaks = 12, 
     col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()
