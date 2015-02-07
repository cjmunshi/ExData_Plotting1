# ------------------------------------
# Exploratory Data Analysis
# Project 1
# 2/7/2015
# CJMunshi
# File: plot1.R
# output: plot1.png
# ------------------------------------
setwd("D:\\Coursera\\ExploratoryDataAnalysis\\ExData_Plotting1")

# --------------------
# Load Libaries
# --------------------


# --------------------
# Load full data set
# --------------------

pcolClasses<- c("character","character","numeric","numeric","numeric","numeric",
                "numeric","numeric","numeric")

pcolNames<- c("Date","Time","GlobalActivePower","GlobalReactivePower",
              "Voltage","GlobalIntensity","SubMetering1","SubMetering2",
              "SubMetering3")

x<- read.table("household_power_consumption.txt",
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


# ---------------------------
# plot Global Active Power
# ---------------------------
?hist

png(filename="plot1.png",width=480,height=480)

hist(targetData$GlobalActivePower,xlab=c("Global Active Power (kilowatts)"),
     main=c("Global Active Power"),col="red")

dev.off()

