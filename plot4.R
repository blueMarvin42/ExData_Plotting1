require ("sqldf")
Sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'" 
Data <- read.csv2.sql("household_power_consumption.txt",Sql) #only read data from 1/2/2007 and 2/2/2007
Data$DT<-strptime(paste(Data[,1],Data[,2]),"%d/%m/%Y%H:%M:%S") #make a new variable that combines date and time

png("plot4.png",width=480,height=480,units="px",bg ="transparent")
par(mfrow=c(2,2))
plot(Data$DT,Data$Global_active_power,type="l",xlab="", ylab="Global Active Power") #topleft figure
plot(Data$DT,Data$Voltage,type="l",xlab="datetime",ylab="Voltage") #topright figure
#following four lines of code generate bottomleft figure
plot(Data$DT,Data$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
lines(Data$DT,Data$Sub_metering_2,type="l",col="red",ylim=c(0,30))
lines(Data$DT,Data$Sub_metering_3,type="l",col="blue",ylim=c(0,30))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n",lwd=1,col=c("black","red","blue"))
plot(Data$DT,Data$Global_reactive_power,type="l",xlab="datatime", ylab="Global_reactive_power") #bottomright figure
dev.off()