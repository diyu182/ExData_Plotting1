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
png(filename = "plot3.png", width = 480, height = 480)
colors = c("black", "red", "blue")

plot(power_dataset$DateTime, power_dataset[, 7], type = "l", col = colors[1], xlab = "",  ylab = "Energy sub metering")
lines(power_dataset$DateTime, power_dataset[, 8], col = colors[2])
lines(power_dataset$DateTime, power_dataset[, 9], col = colors[3])
legend("topright", legend = names(power_dataset[7:9]), col = colors, lty = c(1, 1, 1))
dev.off()
