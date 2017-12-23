plot2 <- function(){
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
  plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")
  
  
  ## Creating the image file
  dev.copy(png, file = "plot2.png", height = 504, width = 504)
  dev.off()
  detach(data)
}