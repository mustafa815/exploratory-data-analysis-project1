plot1 <- function(){
  ## Reading the main dataset
  main_data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
  
  
  ## Converting the data and time
  main_data$Date <- as.Date(main_data$Date, format = "%d/%m/%Y")
  
  ## Subsetting the main needed dataset
  data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
  
  attach(data)
  ## Plotting the data with some options
  hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
  
  ## Creating the image file
  dev.copy(png, file = "plot1.png", height = 504, width = 504)
  dev.off()
  detach(data)
}