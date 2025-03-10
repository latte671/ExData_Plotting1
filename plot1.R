household_power_consumption <- read.csv("~/Desktop/Coursera/household_power_consumption.txt", sep=";")

HPC <- data.frame(household_power_consumption)
HPC$Date <- strptime(as.character(HPC$Date), "%d/%m/%Y")
HPC$Date <- format(HPC$Date, "%Y-%m-%d")
HPC$Date <- as.Date(HPC$Date)
subHPC <- subset(HPC, HPC$Date >= '2007-02-01'
                 & HPC$Date <= '2007-02-02')
subHPC$Global_active_power <- as.numeric(subHPC$Global_active_power)

png(filename = "~/Desktop/Coursera/plot1.png",width = 480,height = 480)

Histogram <- hist(subHPC$Global_active_power,
                  xlab = "Global Active Power (kilowatts)",
                  col = "red", main = "Global Active Power")
dev.off()