data<-read.table("C:\\Users\\rohitk\\Desktop\\COURSERA R\\exdata_data_household_power_consumption\\household_power_consumption.txt",stringsAsFactors= FALSE,sep = ";",na.strings = "?", header = TRUE)
data$Date<- as.Date(data$Date,format = "%d/%m/%Y")
library(chron)
data$Time<- chron(times=data$Time)
library(dplyr)
histdata<-select(data,Global_active_power,Date,Time)
histoftwodays<-filter(histdata, Date == "2007-02-01" | Date == "2007-02-02")
png(filename = "Plot1_Hist.png")
hist(histoftwodays$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (killowatt)")
dev.off()
