require ("sqldf")
Sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'" 
Data <- read.csv2.sql("household_power_consumption.txt",Sql) #only read data from 1/2/2007 and 2/2/2007
Data$DT<-strptime(paste(Data[,1],Data[,2]),"%d/%m/%Y%H:%M:%S") #make a new variable that combines date and time
png("plot2.png",width=480,height=480,units="px",bg ="transparent")
plot(Data$DT,Data$Global_active_power,type="l",xlab=NA, ylab="Global Active Power(kilowatts)")
dev.off()