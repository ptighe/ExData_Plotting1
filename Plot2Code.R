library(sqldf)

file<-"./household_power_consumption.txt"
s<-"SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

f<-read.csv2.sql(file, s)
f2<-f

f2$DateTime<-paste(f2$Date,f2$Time)
f2$DateTimeFormat<-strptime(f2$DateTime,format="%d/%m/%Y %H:%M:%S")
f2$DateFormat <-as.Date(f2$Date,format="%d/%m/%Y")
f2$TimeFormat<-strptime(f2$Time,format="%H:%M:%S")

#Many thanks to the excellent resource at https://www.harding.edu/fmccown/r/
plot(y=f2$Global_active_power, x=f2$DateTimeFormat, type="l", xlab=NA, ,ylab="Global Active Power (kilowatts)", ylim=c(0,8), yaxt='n')
axis(side=2, at=c(0,2,4,6))
dev.copy(png,file="plot2.png",width=480, height=480)
dev.off()
