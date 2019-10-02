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

#1
png(filename = "plot1.png")
hist(t1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
