filename <- "Course4week1.zip"
# if archieve already exists.
if (!file.exists(filename))
  {
  URL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
   download.file(URL, filename)
   
  }  
if (!file.exists("household_power_consumption.txt"))
{
  unzip(filename) 
}  

t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
t1 <- t[t$Date %in% c("1/2/2007","2/2/2007"),]
rm(t)
DateTime <-strptime(paste(t1$Date, t1$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
t1 <- cbind(DateTime, t1)


#3
png(filename = "plot3.png")
with(t1, {
  plot(Sub_metering_1 ~ DateTime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ DateTime, col = 'Red')
  lines(Sub_metering_3 ~ DateTime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
