#download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip")

#unzip file
unzip ("power.zip", exdir = ".")

#read data
hpc <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

#limit data to dates of interest
hpcFeb <- hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ), ]

## Plot 1
hist(hpcFeb$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)

## export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()