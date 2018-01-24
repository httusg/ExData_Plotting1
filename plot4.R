library(dplyr)

# Examine household energy usage over a 2-day period in February
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
df <- df %>% filter(Date == "2/2/2007" | Date == "1/2/2007")

# Concate date and time
df<- df %>% mutate(dtime = paste(Date, Time))
#as.POSIXct(df$dtime, format="%d/%m/%Y %H:%M:%S")


# Extract weekdays in English
Sys.setlocale("LC_TIME", "C")
#weekdays(as.Date("2/2/2007", format="%d/%m/%Y"))


# plot to file *.png
png(file="plot4.png")

#explore data by four graphs
par(mfrow=c(2,2))
plot(as.POSIXct(df$dtime, format="%d/%m/%Y %H:%M:%S"), df$Global_active_power, type="l", xlab="Datetime", ylab="Global Active Power (kilowatts)")
 
plot(as.POSIXct(df$dtime, format="%d/%m/%Y %H:%M:%S"), df$Voltage, type="l", xlab="Datetime", ylab="Voltage")

plot(as.POSIXct(df$dtime, format="%d/%m/%Y %H:%M:%S"), df$Sub_metering_1, type="l", xlab="Datetime", ylab="Energy sub metering")
lines(as.POSIXct(df$dtime, format="%d/%m/%Y %H:%M:%S"), df$Sub_metering_2, col="red")
lines(as.POSIXct(df$dtime, format="%d/%m/%Y %H:%M:%S"), df$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), lwd=c(1.5,1.5,1.5), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(as.POSIXct(df$dtime, format="%d/%m/%Y %H:%M:%S"), df$Global_reactive_power, type="l", xlab="Datetime", ylab="Global Reactive Power")

# save and close the graphics device
dev.off()

