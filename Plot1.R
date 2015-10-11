## Import the household consumption data 
setwd('C:/Users/kdavison/Desktop/Coursera/Exploratory Data Analysis/Course Project 1')
householddata <- read.delim('household_power_consumption.txt',header= TRUE,sep = ';',stringsAsFactors = FALSE,na.strings="?")


## Subset only the days that we are interested in - 2007-02-01 and 2007-02-02. 
febdata <- subset(householddata,Date == '1/2/2007'|Date == '2/2/2007')

##Convert the date and time columns into the correct class 

febdata$Date <- as.Date(febdata$Date, "%d/%m/%y")


#Create the first plot - a histogram
hist(febdata$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

## Copy plot 1 to a png file
dev.copy(png,file="plot1.png")
dev.off()