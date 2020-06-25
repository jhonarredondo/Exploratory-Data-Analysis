###Project1-----------------------------
setwd("~/Desktop")

Data1<-read.csv("https://raw.github.com/jhonarredondo/Exploratory-Data-Analysis/master/Datos1.csv",sep = ",",header = T, dec = ".", quote = "", check.names = T)
Data1$Date<-as.character(Data1$Date)
Data1$Time<-as.character(Data1$Time)
Data1$Time<-paste(Data1$Date,"",Data1$Time)
Data1$Time<-strptime(Data1$Time,format = "%d/%m/%Y %H:%M:%S")
Data1$Date<-as.Date(Data1$Date, format="%d/%m/%Y")
str(Data1)

##Plot3:
png(filename="Plot3.png",width = 480,height = 480, units = "px")
plot(Data1$Time, Data1$Sub_metering_1, type = "l",
     ylab="Energy sub metering", xlab="", col="black")
lines(Data1$Time,Data1$Sub_metering_2, col="red", type = "l")
lines(Data1$Time,Data1$Sub_metering_3, col="blue", type = "l")
legend("topright", legend = names(Data1[7:9]), col=c("black", "red", "blue"), lty=1)
dev.off()

