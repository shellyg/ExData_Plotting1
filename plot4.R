## Read in data
df <- read.table("household_power_consumption.txt", sep=";", header = TRUE,  na.strings="?", stringsAsFactors=FALSE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[(df$Date <= "2007-02-02" & df$Date >= "2007-02-01"),]

## Open Graphic Device
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", restoreConsole = TRUE, antialias)

## Set up for multiple plots
par(mfrow = c(2, 2))

with(df, {
  ## Plot: Top Left
  plot(Global_active_power, type="l", xaxt="n", ylab="Global Active Power", xlab="")
  axis(1, at=c(0,1500,2880),labels=c("Thu","Fri","Sat"))

  ## Plot: Top Right
  plot(Voltage, type="l", xaxt="n", ylab="Voltage", xlab="datetime")
  axis(1, at=c(0,1500,2880),labels=c("Thu","Fri","Sat"))

  ## Plot: Botom Left
  plot(Sub_metering_1, type="n", xaxt="n", ylab="Energy sub metering", xlab="")
  points(Sub_metering_1, type="l", col="black")
  points(Sub_metering_2, type="l", col="red")
  points(Sub_metering_3, type="l", col="blue")
  axis(1, at=c(0,1500,2880),labels=c("Thu","Fri","Sat"))
  
  ## Plot: Bottom Right
  plot(Global_reactive_power, type="l", xaxt="n", ylab="Gobal_reactive_power", xlab="datetime")
  axis(1, at=c(0,1500,2880),labels=c("Thu","Fri","Sat"))

})
## Close Graphic Device
dev.off()