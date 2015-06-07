## Read in data
df <- read.table("household_power_consumption.txt", sep=";", header = TRUE,  na.strings="?", stringsAsFactors=FALSE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[(df$Date <= "2007-02-02" & df$Date >= "2007-02-01"),]

## Open Graphic Device and Plot
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", antialias, restoreConsole = TRUE)
with(df, hist(Global_active_power, col = "red", cex=.75, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power"))
dev.off()
