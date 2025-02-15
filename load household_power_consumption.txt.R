# Load required libraries
library(data.table)

# Define file path
file_path <- "household_power_consumption.txt"

# Read only rows with required dates
data <- fread(file_path, sep=";", na.strings="?", stringsAsFactors=FALSE)

# Convert Date column to Date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter data for 2007-02-01 and 2007-02-02
filtered_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Create DateTime column
filtered_data$DateTime <- as.POSIXct(paste(filtered_data$Date, filtered_data$Time),
                                     format="%Y-%m-%d %H:%M:%S")
