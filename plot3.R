power=read.csv("household_power_consumption.txt",header = TRUE,sep = ";")

power$datetime=as.POSIXct(paste(power$Date,power$Time),format="%d/%m/%Y%H:%M:%S")
power=subset(power,datetime==as.Date("2007/02/01")|datetime==as.Date("2007/02/02"))
power[,3:8]=apply(power[,3:8],2,as.numeric)

png("plot3.png")
par(mar=c(4,4,4,4))
with(power,plot(datetime,Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab=""))
lines(power$datetime,power$Sub_metering_1,col="black")
lines(power$datetime,power$Sub_metering_2,col="red")
lines(power$datetime,power$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("black","red","blue"))
dev.off()
