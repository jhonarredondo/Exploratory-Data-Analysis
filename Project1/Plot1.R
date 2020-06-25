###Project1-----------------------------
setwd("~/Desktop")

Data1<-read.csv("https://raw.github.com/jhonarredondo/Exploratory-Data-Analysis/master/Datos1.csv",sep = ",",header = T, dec = ".", quote = "", check.names = T)
Data1$Date<-as.Date(Data1$Date, format="%d-%m-%Y")
Data1$Time<-format(strptime(Data1$Time, "%H:%M:%S"),"%H:%M:%S")
str(Data1)

#Plot1:
png(filename="Plot1.png",width = 480,height = 480, units = "px")
hist(Data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="#FF2E00FF")
dev.off()

