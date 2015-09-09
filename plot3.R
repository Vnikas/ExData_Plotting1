# Reading Data from file and subsetting to specific dates

data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 colClasses = c("character","character",rep("numeric",7)), na.strings = "?")
data1<-subset(data,data$Date=="1/2/2007" | data$Date == "2/2/2007")

#Replacing Date and Time cols with a new col of right class

my_dates<-paste(data1$Date,data1$Time)
my_dates<-strptime(my_dates,"%d/%m/%Y %H:%M:%S")
data2<-cbind(my_dates,data1[,3:9])

Sys.setlocale("LC_TIME", "English")

#Plotting
png(file="plot3.png")
plot(data2$my_dates,data2$Sub_metering_1,"n", xlab="",ylab="Energy sub metering")
points(data2$my_dates,data2$Sub_metering_1, type="line")
points(data2$my_dates,data2$Sub_metering_2, type="line",col="red")
points(data2$my_dates,data2$Sub_metering_3, type="line",col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red","blue"),lty=c(1,1,1) )
dev.off()
