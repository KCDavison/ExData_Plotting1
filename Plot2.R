
## Import the household consumption data 
setwd('C:/Users/kdavison/Desktop/Coursera/Exploratory Data Analysis/Course Project 1')
householddata <- read.table('household_power_consumption.txt',header= TRUE,sep = ';',stringsAsFactors = FALSE,na.strings="?")


##Convert the date and time columns into the correct class 

householddata$Date <- as.Date(householddata$Date, "%d/%m/%Y")

## Subset only the days that we are interested in - 2007-02-01 and 2007-02-02. 

febdata <- subset(householddata,householddata$Date == "2007-02-01"  |householddata$Date == "2007-02-02")


#Convet the date and time variables into the correct class 

febdata$datetime <- as.POSIXlt(paste(febdata$Date,febdata$Time),format = "%Y-%m-%d %H:%M:%S")

#Create plot 2 

plot(febdata$datetime, febdata$Global_active_power, type ="l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Copy plot 2 to a png file
dev.copy(png,file="plot2.png")
dev.off()
