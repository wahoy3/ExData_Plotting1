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

# create plot 3

png(filename = "plot3.png", width = 480, height = 480) 
plot(Sub_metering_1 ~ datetime, data=dtPlot, type="l", xlab="", 
	ylab="Energy sub metering", col=1)
lines(Sub_metering_2 ~ datetime, data=dtPlot, col=2)
lines(Sub_metering_3 ~ datetime, data=dtPlot, col=4)
legend(x="topright", legend=paste0("Sub_metering_",c(1:3)), lty=1, col=c(1,2,4) )
dev.off()
