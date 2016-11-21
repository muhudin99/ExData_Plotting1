# Plot 2 

#This R script processes the household power consumption data at
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
# The dataset is downloaded and is in the working directory
## Reading the dataset into housepowerconsumption dataframe
housepowerconsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# formatting the Date variable of the dataframe
housepowerconsumption$Date <- as.Date(housepowerconsumption$Date, format = "%d/%m/%Y")
# Extracting the data set that corresponds the required dates, which are 2007-02-01 and 2007-02-02
Required_data <- subset(housepowerconsumption, Date == "2007-02-01" | Date == "2007-02-02")
# formatting the time variable by combining date and time variables
time <- strptime(paste(Required_data$Date, Required_data$Time), "%Y-%m-%d %H:%M:%S")
# plotting the graph
png("plot2.png", width = 480, height = 480)
with(Required_data, plot(time, Global_active_power, type = "s", ylab = "Global Active Power (killowatts)", xlab = ""), bg = "transparent")
dev.off()