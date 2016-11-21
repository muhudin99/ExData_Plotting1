# Plot 1; 

#This R script processes the household power consumption data at
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
# The dataset is downloaded and is in the working directory
## Reading the dataset into housepowerconsumption dataframe
housepowerconsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# formatting the Date variable of the dataframe
housepowerconsumption$Date <- as.Date(housepowerconsumption$Date, format = "%d/%m/%Y")
# Extracting the data set that corresponds the required dates, which are 2007-02-01 and 2007-02-02
Required_data <- subset(housepowerconsumption, Date == "2007-02-01" | Date == "2007-02-02")
#Plotting the graph
png("plot1.png", width = 480, height = 480)
par(xaxp  = c(0, 6, 3))
hist(as.numeric(Required_data$Global_active_power), col = "red", breaks = 12, main = " Global Active Power", xlab = "Global Active Power (killowatts)", ylab = "Frequency")
dev.off()