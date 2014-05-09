library(sqldf)

file<-"./household_power_consumption.txt"
s<-"SELECT * from file WHERE Date= '1/2/2007' OR Date = '2/2/2007'"

f<-read.csv2.sql(file, s)
f2<-f
str(f2)

f2$DateTime<-paste(f2$Date,f2$Time)
f2$DateTimeFormat<-strptime(f2$DateTime,format="%d/%m/%Y %H:%M:%S")
f2$DateFormat <-as.Date(f2$Date,format="%d/%m/%Y")
f2$TimeFormat<-strptime(f2$Time,format="%H:%M:%S")

#Many thanks to the excellent resource at https://www.harding.edu/fmccown/r/
par(mfrow=c(2,2))
plot(y=f2$Global_active_power, x=f2$DateTimeFormat, type="l", xlab=NA, ,ylab="Global Active Power (kilowatts)", ylim=c(0,8), yaxt='n') 
axis(side=2, at=c(0,2,4,6))
plot(y=f2$Voltage, x=f2$DateTimeFormat, type="l",xlab="datetime",ylab="Voltage", ylim=c(232,248), yaxt='n')
axis(side=2, at=c(234,238,242,246))
axis(side=2, at=c(236,240,244),labels=NA)
plot(y=f2$Sub_metering_1, x=f2$DateTimeFormat, type="l", col=pc[1], ylim=c(0,40), yaxt="n",xlab=" ", ylab="Energy sub metering")
axis(side=2, las=1, at=c(0,10,20,30))
lines(y=f2$Sub_metering_2, x=f2$DateTimeFormat, type="l", col=pc[2])
lines(y=f2$Sub_metering_3, x=f2$DateTimeFormat, type="l", col=pc[3])
legend("topright", n, col=pc,lty=1, lwd=2,bty="n")
plot(y=f2$Global_reactive_power,x=f2$DateTimeFormat,type="l",xlab="datetime",ylab="Global_reactive_power",ylim=c(0,0.5))
dev.copy(png,file="plot4.png",width=480, height=480)
dev.off()
