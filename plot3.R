# ------------------------------------
# Exploratory Data Analysis
# Project 1
# 2/7/2015
# CJMunshi
# File: plot3.R
# output: plot3.png
# ------------------------------------
setwd("D:\\Coursera\\ExploratoryDataAnalysis\\ExData_Plotting1")

# --------------------
# Load full data set
# --------------------

pcolClasses<- c("character","character","numeric","numeric","numeric","numeric",
                "numeric","numeric","numeric")

pcolNames<- c("Date","Time","GlobalActivePower","GlobalReactivePower",
              "Voltage","GlobalIntensity","SubMetering1","SubMetering2",
              "SubMetering3")

x<- read.table("..\\household_power_consumption.txt",
               header=FALSE,skip=1,sep=";",
               na.strings=c("?"),
               colClasses=pcolClasses,
               col.names=pcolNames)

# -------------------------------------------------
# Extract target data
# -------------------------------------------------
# Extract only February 1-2, 2007
y<- x[x$Date %in% c("1/2/2007","2/2/2007"),]

# Now create column with Date and Time for plotting
dateFormat<- c("%d/%m/%Y %H:%M:%S")
y$DateTimeString<-paste(y$Date,y$Time)
y$DateTime<-strptime(y$DateTime,dateFormat)
targetData<- y[which(y$DateTime>=strptime(c("01/02/2007 00:00:00"),dateFormat) &
                       y$DateTime<strptime(c("03/02/2007 00:00:00"),dateFormat)),]

# ------------------------------------------------
# plot Energy Submetering with Colors and Legend
# ------------------------------------------------
png(filename="plot3.png",width=480,height=480)

plot(targetData$DateTime,targetData$SubMetering1,type="l",col="black",
     ylab="Energy sub metering",
     xlab="")

lines(targetData$DateTime,targetData$SubMetering2,type="l",col="red")

lines(targetData$DateTime,targetData$SubMetering3,type="l",col="blue")

legend("topright",col=c("black","red","blue"),
       cex=1,lty=1,lwd=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
