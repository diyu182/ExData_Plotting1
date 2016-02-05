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


# Create plot
par(bg = "white")
png(filename = "plot1.png", width = 480, height = 480)
hist(power_dataset$Global_active_power, breaks = seq(0, 7.5, by = 0.5), col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
