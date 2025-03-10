household_power_consumption <- read.csv("~/Desktop/Coursera/household_power_consumption.txt", sep=";")

HPC <- data.frame(household_power_consumption)
HPC$Date <- strptime(as.character(HPC$Date), "%d/%m/%Y")
HPC$Date <- format(HPC$Date, "%Y-%m-%d")
HPC$Date <- as.Date(HPC$Date)
subHPC <- subset(HPC, HPC$Date >= '2007-02-01'
                 & HPC$Date <= '2007-02-02')
subHPC$Global_active_power <- as.numeric(subHPC$Global_active_power)
subHPC$Global_reactive_power <- as.numeric(subHPC$Global_reactive_power)

subHPC$DateTime <- as.POSIXct(paste(subHPC$Date, subHPC$Time,
                                    format = "%Y-%m-%d %H:%M:%S"))

png(filename = "~/Desktop/Coursera/plot4.png",width = 480,height = 480)

par(mfrow = c(2,2))

plot(subHPC$DateTime, subHPC$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

plot(subHPC$DateTime, subHPC$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(subHPC$DateTime, subHPC$Sub_metering_1, 
     type = "l", xlab = "", ylab = "Energy sub metering")

lines(subHPC$DateTime, subHPC$Sub_metering_2, col = "red")

lines(subHPC$DateTime, subHPC$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1",
                              "Sub_metering_2",
                              "Sub_metering_3"),
       col = c("black","red","blue"), lty = 1)

plot(subHPC$DateTime, subHPC$Global_reactive_power,
     xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()