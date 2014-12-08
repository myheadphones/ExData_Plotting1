# read in the data
power <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
power2 <- tbl_df(power)
power3 <- filter(power2,Date == "1/2/2007" | Date == "2/2/2007")
mutate(power3, Date = dmy(Date), Time = hms(Time))
power3$DateTime <- as.POSIXct(paste(power3$Date, power3$Time),"%d/%m/%Y %H:%M:%S",tz = "UTC")

#set it up for 1 plot
par(mfcol = c(1,1))

# plot it
png("plot3.png",width = 480, height = 480)
plot(power3$DateTime,power3$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(power3$DateTime, power3$Sub_metering_2, col="red")
lines(power3$DateTime, power3$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("Black","Red","Blue"), lty="solid")

# Save the plot
dev.off()
