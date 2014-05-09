
library(sqldf)

file<-"./household_power_consumption.txt"
s<-"SELECT * from file WHERE Date= '1/2/2007' OR Date = '2/2/2007'"

f<-read.csv2.sql(file, s)
f2<-f

f2$DateTime<-paste(f2$Date,f2$Time)
f2$DateTimeFormat<-strptime(f2$DateTime,format="%d/%m/%Y %H:%M:%S")
f2$DateFormat <-as.Date(f2$Date,format="%d/%m/%Y")
f2$TimeFormat<-strptime(f2$Time,format="%H:%M:%S")

#Many thanks to the excellent resource at https://www.harding.edu/fmccown/r/
n<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
pc <- c("black", "red", "blue")
plot(y=f2$Sub_metering_1, x=f2$DateTimeFormat, type="l", col=pc[1], ylim=c(0,40), yaxt="n",xlab=" ", ylab="Energy sub metering")
axis(side=2, las=1, at=c(0,10,20,30))
lines(y=f2$Sub_metering_2, x=f2$DateTimeFormat, type="l", col=pc[2])
lines(y=f2$Sub_metering_3, x=f2$DateTimeFormat, type="l", col=pc[3])
legend("topright", n, col=pc,lty=1, lwd=2)
dev.copy(png,file="plot3.png",width=480, height=480)
dev.off()
