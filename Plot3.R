## Import the household consumption data 
setwd('C:/Users/kdavison/Desktop/Coursera/Exploratory Data Analysis/Course Project 1')
householddata <- read.table('household_power_consumption.txt',header= TRUE,sep = ';',stringsAsFactors = FALSE,na.strings="?")


##Convert the date and time columns into the correct class 

householddata$Date <- as.Date(householddata$Date, "%d/%m/%Y")

## Subset only the days that we are interested in - 2007-02-01 and 2007-02-02. 

febdata <- subset(householddata,householddata$Date == "2007-02-01"  |householddata$Date == "2007-02-02")


#Convet the date and time variables into the correct class 

febdata$datetime <- as.POSIXlt(paste(febdata$Date,febdata$Time),format = "%Y-%m-%d %H:%M:%S")


# Create plot 3

plot(febdata$datetime, febdata$Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab = "")
with(febdata, lines(datetime, Sub_metering_1))
with(febdata, lines(datetime, Sub_metering_2,col = "red"))
with(febdata, lines(datetime, Sub_metering_3,col = "blue"))
legend("topright",col = c("black","red","blue"),lty=c(1,1),lwd=c(1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.9)


dev.copy(png,file="plot3.png")
dev.off()
