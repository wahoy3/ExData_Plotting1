#---------------------------------------#
# Coursera - Exploratory Data Analysis -#
#---------------------------------------#
# Course project 1
#--------

# set working directory
setwd("C:\\Users\\hoyerwa1\\My Local Documents\\Coursera\\Exploratory Data Analysis\\Course Project 1")

# reading and subsetting data
dtIn <- read.table("household_power_consumption.txt", header=T, na.strings="?", sep=";", dec=".",
                    stringsAsFactors=FALSE)

dtPlot <- subset(dtIn, Date=="1/2/2007" | Date=="2/2/2007")

# introduce date-time variable, combining $Date and $Time
dtPlot$x <- paste(dtPlot$Date, dtPlot$Time)
dtPlot$datetime <- strptime(dtPlot$x, format="%d/%m/%Y %H:%M:%S")
dtPlot$datetime <- as.POSIXct(dtPlot$datetime)
dtPlot <- dtPlot[,-which(names(dtPlot)=="x")]

# create plot 1

png(filename = "plot1.png", width = 480, height = 480) 
hist(dtPlot$Global_active_power, col=2,
      main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
