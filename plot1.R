setwd("/Users/safi/Documents/DataR")

install.packages("data.table")
library(data.table)

dt <- fread("./household_power_consumption.txt", na.strings = "?")

dt$strDate <- as.Date(dt$Date,"%d/%m/%Y")

dt.filter<-dt[dt$strDate=="2007-02-01" | dt$strDate=="2007-02-02",]
dt.filter$Global_active_power<-as.numeric(DT.filter$Global_active_power)
rm(dt)

png(filename = "plot1.png", width = 480, height = 480)
hist(dt.filter$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power"
     )
dev.off()