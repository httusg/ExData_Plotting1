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
png(file="plot2.png")

#explore data
plot(as.POSIXct(df$dtime, format="%d/%m/%Y %H:%M:%S"), df$Global_active_power, type="l", xlab="Datetime", ylab="Global Active Power (kilowatts)")

# save and close the graphics device
dev.off()

