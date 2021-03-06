###Project1-----------------------------
setwd("~/Desktop")

Data1<-read.csv("https://raw.github.com/jhonarredondo/Exploratory-Data-Analysis/master/Datos1.csv",sep = ",",header = T, dec = ".", quote = "", check.names = T)
Data1$Date<-as.character(Data1$Date)
Data1$Time<-as.character(Data1$Time)
Data1$Time<-paste(Data1$Date,"",Data1$Time)
Data1$Time<-strptime(Data1$Time,format = "%d/%m/%Y %H:%M:%S")
Data1$Date<-as.Date(Data1$Date, format="%d/%m/%Y")
str(Data1)

##Plot2:
png(filename="Plot2.png",width = 480,height = 480, units = "px")
plot(Data1$Time, Data1$Global_active_power, type = "l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
