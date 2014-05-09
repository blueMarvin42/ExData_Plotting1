require ("sqldf")
Sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'" 
Data <- read.csv2.sql("household_power_consumption.txt",Sql) #only read data from 1/2/2007 and 2/2/2007
Data$DT<-strptime(paste(Data[,1],Data[,2]),"%d/%m/%Y%H:%M:%S") #make a new variable that combines date and time
png("plot3.png",width=480,height=480,units="px",bg ="transparent")
plot(Data$DT,Data$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
lines(Data$DT,Data$Sub_metering_2,type="l",col="red",ylim=c(0,30))
lines(Data$DT,Data$Sub_metering_3,type="l",col="blue",ylim=c(0,30))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1,col=c("black","red","blue"))
dev.off()