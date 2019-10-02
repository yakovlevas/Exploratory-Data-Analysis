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



#4
png(filename = "plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(t1$DateTime, t1$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(t1$DateTime, t1$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(t1$DateTime, t1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(t1$DateTime, t1$Sub_metering_2, type="l", col="red")
lines(t1$DateTime, t1$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))
plot(t1$DateTime, t1$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
dev.off()