power=read.csv("household_power_consumption.txt",header = TRUE,sep = ";")

power$datetime=as.POSIXct(paste(power$Date,power$Time),format="%d/%m/%Y%H:%M:%S")
power=subset(power,datetime==as.Date("2007/02/01")|datetime==as.Date("2007/02/02"))
power[,3:8]=apply(power[,3:8],2,as.numeric)

png("plot1.png")

with(power,plot(datetime,Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = ""))

dev.off()
