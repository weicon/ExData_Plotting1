# download the dataset file to the working directory (getwd()), and named the target file as all_data.zip
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="all_data.zip")

# unzip the downloaded dataset file
unzip ("all_data.zip")

# read in all the data from the dataset
all_data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# subsetting data to only within the date range that we are interested in ie. 1/22007 and 2/2/2007
hpc_data <- all_data[(all_data$Date=="1/2/2007" | all_data$Date=="2/2/2007" ), ]

# convert Date in character string format into "dd/mm/YYYY" date format
hpc_data$Date <- as.Date(hpc_data$Date, format="%d/%m/%Y")

# join up the date and time to be a single variable
dateTime <- paste(hpc_data$Date, hpc_data$Time)

# create the DateTime variable in calendar time format in the hpc_data table
hpc_data$DateTime <- as.POSIXct(dateTime)

# Plot 3 line graghs for 3 sub meterings with their respective colouring, y-axis label, etc. 
with(hpc_data, {
  
  # plot sub metering 1 with black colour
  plot(Sub_metering_1 ~ DateTime, type = "l",
       ylab = "Energy sub metering", xlab = "", col = "black")
  
  # plot sub metering 2 with red colour
  lines(Sub_metering_2 ~ DateTime, col = 'Red')
  
  # plot sub metering 3 with red colour
  lines(Sub_metering_3 ~ DateTime, col = 'Blue')
})

# create a "legend" at the top right hand corner
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7)

# copy the plot shown on the screen to the png file format called plot3.png
dev.copy(png, file = "plot3.png", width = 480, height = 480)

# close off the png file device and reset to the screen device
dev.off()