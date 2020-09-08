### Set working directory:
setwd("Encyclopedia/Europe/ComparingCountries.rmd")
getwd()

### Install relevant packages
install.packages("ggplot")
install.packages("viridis")
install.packages("ggrepel")
library(ggplot2) # For graphs
library(ggrepel) # For labels
library(viridis) # For colour palettes

### Download csv. data file
data <-read.csv("EUData_2015.csv", check.names=FALSE)
data

### Use ggplot to create plot
plot1 <- ggplot(data, aes(x=KEEPWARM, y=ARREARS, fill=REGION))+
  geom_point(aes(colour=REGION),alpha = 0.7, size=2)+ # Colour points according to region
  scale_colour_viridis_d()+ 
  geom_label_repel(label = data$COUNTRY, size=4, # Add country labels
                   fontface = 'bold', color = 'white',
                   box.padding = unit(0.1, "lines"),
                   point.padding = unit(0.1, "lines"),
                   segment.color = 'grey50')+
  scale_fill_viridis_d()+ # Colour labels according to region
  labs(fill = 'Region')+ 
  ylab("Inability to keep home adequately warm (%)") +
  xlab("Arrears on utility bills (%)")+
  theme_minimal()+
  theme(legend.title=element_blank(), legend.text = element_text(size=12), legend.position="right",
        axis.title.x=element_text(face="bold", size=15), axis.text.x=element_text(size=14),
        axis.title.y=element_text(face="bold", size=15), axis.text.y=element_text(size=14))
plot1

### Export as high resolution tiff.
tiff("Graph.tiff", width = 2900, height = 2400, res=300)
plot(plot1)
dev.off()
