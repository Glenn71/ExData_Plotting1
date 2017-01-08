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

#plot3
with(hpcFeb, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})

#create legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)


#save file as png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()