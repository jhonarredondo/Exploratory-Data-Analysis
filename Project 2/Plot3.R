setwd("C:/Users/Administrador/Downloads")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

POINT<-NEI[which(NEI$type=="POINT"),]
NONPOINT<-NEI[which(NEI$type=="NONPOINT"),]
ROAD<-NEI[which(NEI$type=="ON-ROAD"),]
NONROAD<-NEI[which(NEI$type=="NON-ROAD"),]

PTotal1999<-sum(POINT$Emissions[which(POINT$year==1999)])
PTotal2002<-sum(POINT$Emissions[which(POINT$year==2002)])
PTotal2005<-sum(POINT$Emissions[which(POINT$year==2005)])
PTotal2008<-sum(POINT$Emissions[which(POINT$year==2008)])
PTotales<-c(PTotal1999,PTotal2002,PTotal2005,PTotal2008)

NPTotal1999<-sum(NONPOINT$Emissions[which(NONPOINT$year==1999)])
NPTotal2002<-sum(NONPOINT$Emissions[which(NONPOINT$year==2002)])
NPTotal2005<-sum(NONPOINT$Emissions[which(NONPOINT$year==2005)])
NPTotal2008<-sum(NONPOINT$Emissions[which(NONPOINT$year==2008)])
NPTotales<-c(NPTotal1999,NPTotal2002,NPTotal2005,NPTotal2008)

RTotal1999<-sum(ROAD$Emissions[which(ROAD$year==1999)])
RTotal2002<-sum(ROAD$Emissions[which(ROAD$year==2002)])
RTotal2005<-sum(ROAD$Emissions[which(ROAD$year==2005)])
RTotal2008<-sum(ROAD$Emissions[which(ROAD$year==2008)])
RTotales<-c(RTotal1999,RTotal2002,RTotal2005,RTotal2008)

NRTotal1999<-sum(ROAD$Emissions[which(ROAD$year==1999)])
NRTotal2002<-sum(ROAD$Emissions[which(ROAD$year==2002)])
NRTotal2005<-sum(ROAD$Emissions[which(ROAD$year==2005)])
NRTotal2008<-sum(ROAD$Emissions[which(ROAD$year==2008)])
NRTotales<-c(NRTotal1999,NRTotal2002,NRTotal2005,NRTotal2008)

TOTALES<-as.numeric(c(PTotales,NPTotales,RTotales,NRTotales))
TOTALES<-cbind(TOTALES,rep(c("POINT","NON-POINT","ON-ROAD","NON-ROAD"),each=4),rep(c(1999,2002,2005,2008),4))
TOTALES<-as.data.frame(TOTALES)
names(TOTALES)<-c("Emisiones","type","year")
TOTALES$Emisiones<-as.character(TOTALES$Emisiones)
TOTALES$Emisiones<-as.numeric(TOTALES$Emisiones)

png(filename="Plot3.png",width = 480,height = 480, units = "px")
library(ggplot2)
bp <- ggplot(TOTALES, aes(x=year, y=Emisiones, group=type)) + geom_line() + facet_wrap(.~type) +
  geom_line(data = TOTALES, aes(x=year, y=Emisiones))
bp

dev.off()
