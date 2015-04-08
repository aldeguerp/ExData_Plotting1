
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

#Plot1
png(file="plot1.png")
hist(house_filtered$Global_active_power,col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)",ylim = c(0,1200))
dev.off()
