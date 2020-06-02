setwd("/Users/safi/Documents/DataR")

dt <- fread("./household_power_consumption.txt", na.strings = "?")

dt$Date <- as.Date(dt$Date,"%d/%m/%Y")

dt.filter <- subset(dt, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dt)

datetime <- paste(as.Date(dt.filter$Date), dt.filter$Time)
dt.filter$Datetime <- as.POSIXct(datetime)

plot(dt.filter$Global_active_power~dt.filter$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
