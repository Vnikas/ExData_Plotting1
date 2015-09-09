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
png(file="plot2.png")
plot(data2$my_dates,data2$Global_active_power, type="line", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
