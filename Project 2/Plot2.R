setwd("C:/Users/Administrador/Downloads")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore<-NEI[which(NEI$fips=="24510"),]

Total1999<-sum(Baltimore$Emissions[which(Baltimore$year==1999)])
Total2002<-sum(Baltimore$Emissions[which(Baltimore$year==2002)])
Total2005<-sum(Baltimore$Emissions[which(Baltimore$year==2005)])
Total2008<-sum(Baltimore$Emissions[which(Baltimore$year==2008)])
Totales<-c(Total1999,Total2002,Total2005,Total2008)

Años<-c(1999,2002,2005,2008)

png(filename="Plot1.png",width = 480,height = 480, units = "px")
plot(Años,Totales, type="b", col=35, pch=19)
dev.off()
