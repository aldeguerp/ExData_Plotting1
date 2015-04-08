
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

#Plot2
png(file="plot2.png")
plot(house_filtered$DataTime,house_filtered$Global_active_power,type="l",main="Plot2",ylab="Global Active Power (kilowatts)",xlab="",col="black")
dev.off()
#OR
#with(house_filtered,plot(DataTime,Global_active_power,type="l",main="Plot2",ylab="Global Active Power (kilowatts)",xlab="",col="black"))
