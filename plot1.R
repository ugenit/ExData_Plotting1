# Exploratory Data Analysis - Project 1
# Base Plotting exercises - Plot1 

# Read data
filename <- "household_power_consumption.txt"
data <- read.table(filename, 
                   header=TRUE, 
                   sep=";", 
                   na="?",
                   colClasses=c("character", "character", rep("numeric",7))
                   )

# Convert "Date" to Date format
data$Date<-as.Date(data$Date, "%d/%m/%Y")

# Filter data
data<-data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

# Plot Histogram creating PNG file
png("plot1.png", width=480, height=480)
par(bg="transparent")
hist(data$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()
