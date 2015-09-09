# Reading Data from file and subsetting to specific dates

data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 colClasses = c("character","character",rep("numeric",7)), na.strings = "?")
data1<-subset(data,data$Date=="1/2/2007" | data$Date == "2/2/2007")


# Plotting the histogram
png(file="plot1.png")
hist(data1$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

