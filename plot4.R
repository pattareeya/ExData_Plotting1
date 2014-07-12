setwd("C:/Coursera/Data Science/Explore_Data")
data <- read.table("household_power_consumption.txt", header = TRUE,sep = ";",
                   colClasses = c("factor", "factor", "numeric","numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric"), na.strings = "?")
head(data)
names(data)
data$Date <- as.Date(as.character(data$Date), format = "%d/%m/%Y")
#We want only data in the specific dates
data2 <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
data2["Date_Time"] <- "NA"
data2$Date_Time <-paste(as.character(data2$Date), as.character(data2$Time), sep = " ")
data2$Date_Time <-strptime(data2$Date_Time, format = "%Y-%m-%d %H:%M:%S")

#plot 4 graphs in one page
library(datasets)
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(data2, {
    plot(Date_Time, Global_active_power, type="l", 
         ylab = "Global Active Power (kilowatts)", xlab = " ")
    plot(Date_Time, Voltage, type = "l",xlab = "datetime" )
    plot(Date_Time, Sub_metering_1, type="l", 
         ylab = "Energy sub metering", xlab = " ")
    lines(data2$Date_Time,data2$Sub_metering_2,type = "l", col = "red")
    lines(data2$Date_Time,data2$Sub_metering_3,type = "l", col = "blue")
    legend("topright", lty = "solid", bty = "n",col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3" ))
    plot(Date_Time,Global_reactive_power, type = "l",xlab = "datetime")
})
dev.off()
