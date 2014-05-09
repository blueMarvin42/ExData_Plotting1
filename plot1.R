install.packages("sqldf")
require ("sqldf")
Sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'" 
Data <- read.csv2.sql("household_power_consumption.txt",Sql) #only read data from 1/2/2007 and 2/2/2007
Data$DT<-strptime(paste(Data[,1],Data[,2]),"%d/%m/%Y%H:%M:%S") #make a new variable that combines date and time
png("plot1.png",width=480,height=480,units="px",bg ="transparent")
max(Data$Global_active_power) #get the maximum value of global active power 7.5, used to define the range in histogram
hist(Data$Global_active_power,col="red",breaks=seq(0,7.5,by=0.5),main="Global Active Power", 
     xlab="Global Active Power(kilowatts)")
dev.off()