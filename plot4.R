# Exploratory Data Analysis - Project 1
# Base Plotting exercises - Plot 4

# Read data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";", na="?",
                 colClasses=c("character", "character", rep("numeric",7)))


# Convert "Date" to Date format
data$Date<-as.Date(data$Date, "%d/%m/%Y")

# Filter data
data<-data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

# Convert Time to Datetime
data$Time <- strptime(paste(format(data$Date,"%d/%m/%Y"), data$Time), "%d/%m/%Y %H:%M:%S")


# Plot & create PNG file
png("plot4.png", width=480, height=480)
par(bg="transparent") 
par(mfrow=c(2,2))

plot(data$Time, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

plot(data$Time, data$Voltage, 
     type="l",
     xlab="datetime", 
     ylab="Voltage")

plot(data$Time, data$Sub_metering_1, 
     type="l", 
     col="black",
     xlab="", 
     ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       box.lwd=0)

plot(data$Time, data$Global_reactive_power, 
     type="n",
     xlab="datetime", 
     ylab="Global_reactive_power")
lines(data$Time, data$Global_reactive_power)
dev.off()

