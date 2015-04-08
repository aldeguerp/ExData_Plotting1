
#Transformation Date
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
#setClass('myTime')
#setAs("character","myTime", function(from) as.Date(from, format="%H:%M:%S") )
#Read data
house_data <- read.csv("household_power_consumption.txt",sep=";",header = TRUE,na.strings="?", colClasses =  c("myDate",  "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"),encoding="UTF-8",dec=".")
#Filter data for two days
house_filtered <- house_data[ house_data$Date>="2007-02-01" & house_data$Date<="2007-02-02" , ]
#calculate date+time only for filtered data
house_filtered$DataTime <- strptime(paste(house_filtered$Date,house_filtered$Time),"%Y-%m-%d %H:%M:%S")

#Plot3
png(file="plot3.png")
plot(house_filtered$DataTime,house_filtered$Sub_metering_1,type="l",main="Plot3",ylab="Energy sub metering",xlab="",col="black")
#lines(house_filtered$DataTime,house_filtered$Sub_metering_1,col="black")
lines(house_filtered$DataTime,house_filtered$Sub_metering_2,col="red")
lines(house_filtered$DataTime,house_filtered$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),box.col="black",text.col="black",lty = 1)
dev.off()
