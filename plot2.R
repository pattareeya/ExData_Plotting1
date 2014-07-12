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

#plot Date vs Global Active Power
library(datasets)
png("plot2.png", width=480, height=480)
with(data2, plot(Date_Time, Global_active_power, type="l", 
                 ylab = "Global Active Power (kilowatts)", xlab = " "))
dev.off()
