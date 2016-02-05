### Getting data, data are stored in the directory data
file_path = "./data/household_power_consumption.txt"
#start_date = "2007-02-01"
#stop_date =  "2007-02-02"

power_dataset = read.table(file_path, sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
names(power_dataset) = names(read.table(file_path, header = TRUE, sep = ";", nrows = 1))
#head(power_dataset)
str(power_dataset)


# collect the right data




# Create DateTime column
power_dataset$DateTime = strptime(paste(power_dataset$Date, power_dataset$Time),  "%d/%m/%Y %H:%M:%S")
#head(plot_data)


# Create plots
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(power_dataset, {
	# plot(1,1)
	plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
	# plot(1,2)
	plot(DateTime, Voltage, type = "l")
	# plot(2,1)
	colors = c("black", "red", "blue")
	plot(DateTime, power_dataset[, 7], type = "l", col = colors[1], xlab = "", ylab = "Energy sub metering")
	lines(DateTime, power_dataset[, 8], col = colors[2])
	lines(DateTime, power_dataset[, 9], col = colors[3])
	legend("topright", legend = names(power_dataset[7:9]), col = colors, lty = c(1, 1, 1), bty = "n")
	# plot(2,1)
	plot(DateTime, Global_reactive_power, type = "l")
})

dev.off()
