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

#plot histogram of Global Active Power
library(datasets)
png("plot1.png", width=480, height=480)
hist(data2$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
