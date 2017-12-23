plot3 <- function(){
  ## Reading the main dataset
  main_data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
  
  
  ## Converting the data and time
  main_data$Date <- as.Date(main_data$Date, format = "%d/%m/%Y")
  
  ## Subsetting the main needed dataset
  data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
  
  ## To extact data and time
  data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
  data$datetime <- as.POSIXct(data$datetime)
  
  attach(data)
  
  ## Plotting the data with some options
  plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ datetime, col = "red")
  lines(Sub_metering_3 ~ datetime, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Creating the image file
  dev.copy(png, file = "plot3.png", height = 504, width = 504)
  dev.off()
  detach(data)
}