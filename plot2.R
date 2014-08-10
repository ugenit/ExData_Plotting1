# Exploratory Data Analysis - Project 1
# Base Plotting exercises - Plot 2

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

# Convert Time to Datetime
data$Time <- strptime(paste(format(data$Date,"%d/%m/%Y"), data$Time), "%d/%m/%Y %H:%M:%S")


# Plot & create PNG file
png("plot2.png", width=480, height=480)
par(bg="transparent") 
plot(data$Time, data$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

