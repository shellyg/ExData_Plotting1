## Read in data
df <- read.table("household_power_consumption.txt", sep=";", header = TRUE,  na.strings="?", stringsAsFactors=FALSE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[(df$Date <= "2007-02-02" & df$Date >= "2007-02-01"),]

## Open Graphic Device and Plot
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", restoreConsole = TRUE, antialias)
with(df, plot(Sub_metering_1, type="n", xaxt="n", ylab="Energy sub metering", xlab=""))
with(df, points(Sub_metering_1, type="l", col="black"))
with(df, points(Sub_metering_2, type="l", col="red"))
with(df, points(Sub_metering_3, type="l", col="blue"))
axis(1, at=c(0,1500,2880),labels=c("Thu","Fri","Sat"))
legend("topright", lwd=1, lty=c(1,1,1), pch = c(NA,NA,NA), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()