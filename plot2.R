#download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip")

#unzip file
unzip ("power.zip", exdir = ".")

#read data
hpc <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

#limit data to dates of interest
hpcFeb <- hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ), ]

#format date and time & combine into dateTime
hpcFeb$Date <- as.Date(hpcFeb$Date, format="%d/%m/%Y")
dateTime <- paste(hpcFeb$Date, hpcFeb$Time)
hpcFeb$DateTime <- as.POSIXct(dateTime)

#plot2
plot(hpcFeb$Global_active_power~hpcFeb$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#save file as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()