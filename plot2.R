## Read in data
df <- read.table("household_power_consumption.txt", sep=";", header = TRUE,  na.strings="?", stringsAsFactors=FALSE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[(df$Date <= "2007-02-02" & df$Date >= "2007-02-01"),]

## Open Graphic Device and Plot
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", restoreConsole = TRUE)
with(df, plot(Global_active_power, type="l", xaxt="n", ylab="Global Active Power (kilowatts)", xlab=""))
axis(1, at=c(0,1500,2880),labels=c("Thu","Fri","Sat"))

## Close Graphic Device
dev.off()