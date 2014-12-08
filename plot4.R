# read in the data
power <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
power2 <- tbl_df(power)
power3 <- filter(power2,Date == "1/2/2007" | Date == "2/2/2007")
mutate(power3, Date = dmy(Date), Time = hms(Time))
power3$DateTime <- as.POSIXct(paste(power3$Date, power3$Time),"%d/%m/%Y %H:%M:%S",tz = "UTC")

#plot it
png("plot4.png",width = 480, height = 480)

#set it up for 4 plots
par(mfcol = c(2,2), "mar" = c(4.8,3.8,3.8,1.8))

#plot #1
plot(power3$DateTime,power3$Global_active_power, ylab="Global Active Power", xlab="", type="l")

# plot #2
plot(power3$DateTime,power3$Sub_metering_1, ylab="Energy Sub metering", xlab="", type="l")
lines(power3$DateTime, power3$Sub_metering_2, col="red")
lines(power3$DateTime, power3$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("Black","Red","Blue"), lty="solid", bty="n", cex=0.95)

# plot #3
plot(power3$DateTime,power3$Voltage, ylab="Voltage", xlab="datetime", type="l")

# plot #4
plot(power3$DateTime,power3$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

# Save the plot
dev.off()
