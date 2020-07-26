setwd("C:/Users/Administrador/Downloads")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalCoal <- aggregate(Emissions ~ year + type, NEI, sum)

png(filename="Plot4.png",width = 480,height = 480, units = "px")
library(ggplot2)
ggplot(totalCoal, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  xlab("Year") +
  ylab("TOTAL") +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold"))

dev.off()
