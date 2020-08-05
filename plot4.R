power=read.csv("household_power_consumption.txt",header = TRUE,sep = ";")

power$datetime=as.POSIXct(paste(power$Date,power$Time),format="%d/%m/%Y%H:%M:%S")
power=subset(power,datetime==as.Date("2007/02/01")|datetime==as.Date("2007/02/02"))
power[,3:8]=apply(power[,3:8],2,as.numeric)

png("plot4.png")
par(mfrow=c(2,2))
#plot1
with(power,plot(datetime,Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = ""))

#plot2 
with(power,plot(datetime,Voltage,type = "l",ylab = "Voltage"))

#plot3
with(power,plot(datetime,Sub_metering_1,type = "n",ylab = "Energy sub metering"))
lines(power$datetime,power$Sub_metering_1,col="black")
lines(power$datetime,power$Sub_metering_2,col="red")
lines(power$datetime,power$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("black","red","blue"))

#plot4
with(power,plot(datetime,Global_reactive_power,type = "l"))

dev.off()
