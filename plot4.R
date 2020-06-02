setwd("/Users/safi/Documents/DataR")

dt <- fread("./household_power_consumption.txt", na.strings = "?")

dt$Date <- as.Date(dt$Date,"%d/%m/%Y")

dt.filter <- subset(dt, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dt)

datetime <- paste(as.Date(dt.filter$Date), dt.filter$Time)
dt.filter$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dt.filter, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_Rective_Power",xlab="datetime")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
