#
# read in the data
power <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
power2 <- tbl_df(power)
power3 <- filter(power2,Date == "1/2/2007" | Date == "2/2/2007")

#set it up for 1 plot
par(mfcol = c(1,1))

# plot it
png("plot1.png",width = 480, height = 480)
hist(power3$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

# Save the plot
dev.off()
