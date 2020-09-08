# Set your working directory
setwd("Encyclopedia/England/Regions")
getwd()

# Install ggplot2 for making charts
library(ggplot2)

# Install tidyr and plyr package, useful tools for tidying up your data
library(tidyr)
library(plyr)

# Install R Color Brewer for nice looking colour palettes later on...
library(RColorBrewer)

#Install package for dealing with dates
library(lubridate)

# Read your data from the csv. file
# Notice when you use head() to see the data that we have a column for each year in the dataset
data <- read.csv("Regions_EP.csv")
data

# Make a barplot from your data using ggplot for data from 2011
plot<-ggplot(data, aes(x=Regions, y=X2011))+ 
  geom_col(aes(fill=Regions), colour="black") # Colour your columns according to region. 
plot

# Tidying up our data into the right format
## We now want to produce a figure with a bar chart for each year
## The gather function gathers columns into Key-Value Pairs, ie. multiple columns are collapsed from a wide into a long format.
## This will allow us to plot data from multiple years together.
## Notice that when you use head() this time, you only have three columns in your dataset, ie. all the years have been collapsed into a single column.
names(data) <- c("Regions", "2011", "2012","2013","2014","2015","2016","2017","2018")

datalong <- gather(data, key="measure", value="value", c("2011","2012","2013","2014","2015","2016","2017","2018"))
head(datalong)
str(datalong)

# We can now plot the data for every year using facet_wrap()
barchart <- ggplot(data=datalong, aes(x=Regions, y=value))+ 
  geom_col(aes(fill=Regions))+
  ylim(0,16)+ #Add the same scale limits to your y axis so that the graphs are comparable.
  labs(title="Fuel poor households for regions in England from 2011-2018",y="Fuel poor households (%)", x=" ")+
  theme(plot.title = element_text(face="bold"), axis.text.x = element_blank())+
  facet_wrap(~measure)
barchart

# Choose a colour palette from Rcolorbrewer
## Investigate the colour palettes are on offer from RcolorBrewer package that we have installed.
display.brewer.all(colorblindFriendly = TRUE)

# Then select a palette using scale_fill_brewer 
barchart1<-barchart+scale_fill_brewer(palette="Paired")
barchart1

# Line graph
ggplot(datalong)+
  geom_line(aes(x=measure, y=value, group=Regions, colour=Regions),size=2)+
  theme_minimal()+
  scale_colour_brewer(palette="Paired")+
  labs(title="Fuel poor households for regions in England from 2011-2018
       ",y="Fuel poor households (%)", x=" ")+
  theme(plot.title = element_text(face="bold", size=14), axis.title.x.bottom = element_text(size=10),
        legend.title = element_text(face="bold", size=12))+
  labs(caption = " 
       Based on the Low Income High Cost fuel poverty indicator (BEIS 2019)")

# Tile of regions
datalong$measure<-lubridate::ymd(datalong$measure, truncated = 2L)
datalong

RegionSquare <- ggplot(datalong, aes(y=reorder(Regions, desc(Regions)),x= measure, fill=value))+
  geom_tile()+
  scale_fill_gradientn(colours=rev(brewer.pal(n=10,"RdBu")), limits=c(6, 16))+
  theme_minimal()+
  labs(title="Proportion of households classified as fuel poor for regions in England 2011-2018
       ")+
  labs(caption = " 
       Based on the Low Income High Cost fuel poverty indicator (BEIS 2019)")+
  theme(panel.background= element_blank(), 
        plot.title = element_text(face="bold", size = 13), 
        panel.grid.minor = element_blank(), panel.grid.major= element_blank(), 
        axis.title.y = element_blank(), axis.text.y = element_text(size=11),
        axis.title.x = element_blank(), axis.text.x = element_text(size=11),
        legend.title=element_blank(), legend.position="bottom")
RegionSquare

# Export image as a high resolution tiff. image
tiff("Region_Square.tiff", width = 3000, height = 3000, res=300)
plot(RegionSquare)
dev.off()
