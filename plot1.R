# download the dataset file to the working directory (getwd()), and named the target file as all_data.zip
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="all_data.zip")

# unzip the downloaded dataset file
unzip ("all_data.zip")

# read in all the data from the dataset
all_data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# subsetting data to only within the date range that we are interested in ie. 1/22007 and 2/2/2007
hpc_data <- all_data[(all_data$Date=="1/2/2007" | all_data$Date=="2/2/2007" ), ]

# Plot the histogram with title, labels for x- and y-axis, color, etc 
hist(hpc_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

# copy the plot shown on the screen to the png file format called plot1.png
dev.copy(png, file = "plot1.png", width = 480, height = 480)

# close off the png file device and reset to the screen device
dev.off()