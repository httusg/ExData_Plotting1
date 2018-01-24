library(dplyr)

# Examine household energy usage over a 2-day period in February
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
df <- df %>% filter(Date == "2/2/2007" | Date == "1/2/2007")

# plot to file *.png
png(file="plot1.png")

#explore data
hist(as.numeric(df$Global_active_power),main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

# save and close the graphics device
dev.off()

