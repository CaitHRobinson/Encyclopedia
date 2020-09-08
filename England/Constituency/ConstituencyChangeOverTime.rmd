# Set the working directory 
getwd()
setwd("Encyclopedia/England/Constituency")
getwd()

# Install packages
library(ggplot2)
library(tidyr)
library(dplyr)
library(tidyverse)
library(RColorBrewer)

# WEST MIDLANDS
# Read data from csv. folder
data <- read.csv("Con_WestMidlands.csv", check.names=FALSE)
data
colnames(data)

# Rename year column
data<- data %>% rename(Year = "ï»¿Year")
data

# Translate the data into a long format
datalong <- gather(data, key="measure", value="value", c(2:60))
head(datalong)
str(datalong)

# Make sure that R recognises the year format as a date
datalong$Year<-lubridate::ymd(datalong$Year, truncated = 2L)
head(datalong)

# Create a tile plot for West Midlands 
WestMidlands <- ggplot(datalong, aes(y=reorder(measure, desc(measure)),x= Year, fill=value))+
  geom_tile()+
  scale_fill_gradientn(colours=rev(brewer.pal(n=10,"RdYlBu")), limits=c(2.5, 27.5))+
  theme_minimal()+
  labs(title="West Midlands
       ")+
  labs(caption = " 
       Based on the Low Income High Cost fuel poverty indicator (BEIS 2019)")+
  theme(panel.background= element_blank(), 
        plot.title = element_text(face="bold", size = 13), 
        panel.grid.minor = element_blank(), panel.grid.major= element_blank(), 
        axis.title.y = element_blank(), axis.text.y = element_text(size=10),
        axis.title.x = element_blank(), axis.text.x = element_text(face="bold", size=10),
        legend.title=element_blank(), legend.text = element_text(size = 10), legend.position="bottom")

WestMidlands

# Export in a tiff format
tiff("WestMidlands500.tiff", width = 4000, height = 5000, res=500)
plot(WestMidlands)
dev.off()

# EAST MIDLANDS
# Read data from csv. folder
data <- read.csv("Con_EastMidlands.csv", check.names=FALSE)
data
colnames(data)

# Rename year column
data<- data %>% rename(Year = "ï»¿Year")
data

# Translate the data into a long format
datalong <- gather(data, key="measure", value="value", c(2:47))
head(datalong)
str(datalong)

# Make sure that R recognises the year format as a date
datalong$Year<-lubridate::ymd(datalong$Year, truncated = 2L)
head(datalong)

# Create a tile plot for West Midlands 
EastMidlands <- ggplot(datalong, aes(y=reorder(measure, desc(measure)),x= Year, fill=value))+
  geom_tile()+
  scale_fill_gradientn(colours=rev(brewer.pal(n=10,"RdYlBu")), limits=c(2.5, 27.5))+
  theme_minimal()+
  labs(title="East Midlands
       ")+
  labs(caption = " 
       Based on the Low Income High Cost fuel poverty indicator (BEIS 2019)")+
  theme(panel.background= element_blank(), 
        plot.title = element_text(face="bold", size = 13), 
        panel.grid.minor = element_blank(), panel.grid.major= element_blank(), 
        axis.title.y = element_blank(), axis.text.y = element_text(size=10),
        axis.title.x = element_blank(), axis.text.x = element_text(size=10, face ="bold"),
        legend.title=element_blank(), legend.position="bottom")

EastMidlands

# Export in a tiff format
tiff("EastMidlands500.tiff", width = 4000, height = 4500, res=500)
plot(EastMidlands)
dev.off()

# NORTH WEST 
# Read data from csv. folder
data <- read.csv("Con_NorthWest.csv", check.names=FALSE)
data
colnames(data)

# Rename year column
data<- data %>% rename(Year = "ï»¿Year")
data

# Translate the data into a long format
datalong <- gather(data, key="measure", value="value", c(2:47))
head(datalong)
str(datalong)

# Create a tile plot for North West 
NorthWest <- ggplot(datalong, aes(y=reorder(measure, desc(measure)),x= Year, fill=value))+
  geom_tile()+
  scale_fill_gradientn(colours=rev(brewer.pal(n=10,"RdYlBu")), limits=c(2.5, 27.5))+
  theme_minimal()+
  labs(title="North West
       ")+
  labs(caption = " 
       Based on the Low Income High Cost fuel poverty indicator (BEIS 2019)")+
  theme(panel.background= element_blank(), 
        plot.title = element_text(face="bold", size = 13), 
        panel.grid.minor = element_blank(), panel.grid.major= element_blank(), 
        axis.title.y = element_blank(), axis.text.y = element_text(size=10),
        axis.title.x = element_blank(), axis.text.x = element_text(size=10, face="bold"),
        legend.title=element_blank(), legend.position="bottom")

NorthWest

# Export in a tiff format
tiff("NorthWest500.tiff", width = 4000, height = 5000, res=500)
plot(NorthWest)
dev.off()

# NORTH EAST
# Read data from csv. folder
data <- read.csv("Con_NorthEast.csv", check.names=FALSE)
data
colnames(data)

# Rename year column
data<- data %>% rename(Year = "ï»¿Year")
data

# Translate the data into a long format
datalong <- gather(data, key="measure", value="value", c(2:30))
head(datalong)
str(datalong)

# Create a tile plot for North East
NorthEast <- ggplot(datalong, aes(y=reorder(measure, desc(measure)),x= Year, fill=value))+
  geom_tile()+
  scale_fill_gradientn(colours=rev(brewer.pal(n=10,"RdYlBu")), limits=c(2.5, 27.5))+
  theme_minimal()+
  labs(title="North East
       ")+
  labs(caption = " 
       Based on the Low Income High Cost fuel poverty indicator (BEIS 2019)")+
  theme(panel.background= element_blank(), 
        plot.title = element_text(face="bold", size = 13), 
        panel.grid.minor = element_blank(), panel.grid.major= element_blank(), 
        axis.title.y = element_blank(), axis.text.y = element_text(size=10),
        axis.title.x = element_blank(), axis.text.x = element_text(size=10, face="bold"),
        legend.title=element_blank(), legend.position="bottom")

NorthEast

# Export in a tiff format
tiff("NorthEast500.tiff", width = 4000, height = 3500, res=500)
plot(NorthEast)
dev.off()

# EAST OF ENGLAND
# Read data from csv. folder
data <- read.csv("Con_East.csv", check.names=FALSE)
data
colnames(data)

# Rename year column
data<- data %>% rename(Year = "ï»¿Year")
data

# Translate the data into a long format
datalong <- gather(data, key="measure", value="value", c(2:59))
head(datalong)
str(datalong)

# Create a tile plot for East of England
East <- ggplot(datalong, aes(y=reorder(measure, desc(measure)),x= Year, fill=value))+
  geom_tile()+
  scale_fill_gradientn(colours=rev(brewer.pal(n=10,"RdYlBu")), limits=c(2.5, 27.5))+
  theme_minimal()+
  labs(title="East of England
       ")+
  labs(caption = " 
       Based on the Low Income High Cost fuel poverty indicator (BEIS 2019)")+
  theme(panel.background= element_blank(), 
        plot.title = element_text(face="bold", size = 13), 
        panel.grid.minor = element_blank(), panel.grid.major= element_blank(), 
        axis.title.y = element_blank(), axis.text.y = element_text(size=10),
        axis.title.x = element_blank(), axis.text.x = element_text(size=10, face="bold"),
        legend.title=element_blank(), legend.position="bottom")
East

# Export in a tiff format
tiff("East500.tiff", width = 4000, height = 4500, res=500)
plot(East)
dev.off()

# LONDON
# Read data from csv. folder
data <- read.csv("Con_London.csv", check.names=FALSE)
data
colnames(data)

# Rename year column
data<- data %>% rename(Year = "ï»¿Year")
data

# Translate the data into a long format
datalong <- gather(data, key="measure", value="value", c(2:74))
head(datalong)
str(datalong)

# Create a tile plot for London
London <- ggplot(datalong, aes(y=reorder(measure, desc(measure)),x= Year, fill=value))+
  geom_tile()+
  scale_fill_gradientn(colours=rev(brewer.pal(n=10,"RdYlBu")), limits=c(2.5, 27.5))+
  theme_minimal()+
  labs(title="London
       ")+
  labs(caption = " 
       Based on the Low Income High Cost fuel poverty indicator (BEIS 2019)")+
  theme(panel.background= element_blank(), 
        plot.title = element_text(face="bold", size = 13), 
        panel.grid.minor = element_blank(), panel.grid.major= element_blank(), 
        axis.title.y = element_blank(), axis.text.y = element_text(size=10),
        axis.title.x = element_blank(), axis.text.x = element_text(size=10, face = "bold"),
        legend.title=element_blank(), legend.position="bottom")
London

# Export in a tiff format
tiff("London500.tiff", width = 4000, height = 5500, res=500)
plot(London)
dev.off()

# SOUTH EAST
# Read data from csv. folder
data <- read.csv("Con_SouthEast.csv", check.names=FALSE)
data
colnames(data)

# Rename year column
data<- data %>% rename(Year = "ï»¿Year")
data

# Translate the data into a long format
datalong <- gather(data, key="measure", value="value", c(2:85))
head(datalong)
str(datalong)

# Create a tile plot for London
SouthEast <- ggplot(datalong, aes(y=reorder(measure, desc(measure)),x= Year, fill=value))+
  geom_tile()+
  scale_fill_gradientn(colours=rev(brewer.pal(n=10,"RdYlBu")), limits=c(2.5, 27.5))+
  theme_minimal()+
  labs(title="South East
       ")+
  labs(caption = " 
       Based on the Low Income High Cost fuel poverty indicator (BEIS 2019)")+
  theme(panel.background= element_blank(), 
        plot.title = element_text(face="bold", size = 13), 
        panel.grid.minor = element_blank(), panel.grid.major= element_blank(), 
        axis.title.y = element_blank(), axis.text.y = element_text(size=10),
        axis.title.x = element_blank(), axis.text.x = element_text(size=10, face="bold"),
        legend.title=element_blank(), legend.position="bottom")
SouthEast

# Export in a tiff format
tiff("SouthEast500.tiff", width = 4000, height = 5500, res=500)
plot(SouthEast)
dev.off()

# SOUTH WEST
# Read data from csv. folder
data <- read.csv("Con_SouthWest.csv", check.names=FALSE)
data
colnames(data)

# Rename year column
data<- data %>% rename(Year = "ï»¿Year")
data

# Translate the data into a long format
datalong <- gather(data, key="measure", value="value", c(2:56))
head(datalong)
str(datalong)

# Create a tile plot for London
SouthWest <- ggplot(datalong, aes(y=reorder(measure, desc(measure)),x= Year, fill=value))+
  geom_tile()+
  scale_fill_gradientn(colours=rev(brewer.pal(n=10,"RdYlBu")), limits=c(2.5, 27.5))+
  theme_minimal()+
  labs(title="South West
       ")+
  labs(caption = " 
       Based on the Low Income High Cost fuel poverty indicator (BEIS 2019)")+
  theme(panel.background= element_blank(), 
        plot.title = element_text(face="bold", size = 13), 
        panel.grid.minor = element_blank(), panel.grid.major= element_blank(), 
        axis.title.y = element_blank(), axis.text.y = element_text(size=10),
        axis.title.x = element_blank(), axis.text.x = element_text(size=10, face = "bold"),
        legend.title=element_blank(), legend.position="bottom")
SouthWest

# Export in a tiff format
tiff("SouthWest500.tiff", width = 4000, height = 5500, res=500)
plot(SouthWest)
dev.off()

# YORKSHIRE AND THE HUMBER
# Read data from csv. folder
data <- read.csv("Con_Yorkshire.csv", check.names=FALSE)
data
colnames(data)

# Rename year column
data<- data %>% rename(Year = "ï»¿Year")
data

# Translate the data into a long format
datalong <- gather(data, key="measure", value="value", c(2:55))
head(datalong)
str(datalong)

# Create a tile plot for London
Yorkshire <- ggplot(datalong, aes(y=reorder(measure, desc(measure)),x= Year, fill=value))+
  geom_tile()+
  scale_fill_gradientn(colours=rev(brewer.pal(n=10,"RdYlBu")), limits=c(2.5, 27.5))+
  theme_minimal()+
  labs(title="Yorkshire and the Humber
       ")+
  labs(caption = " 
       Based on the Low Income High Cost fuel poverty indicator (BEIS 2019)")+
  theme(panel.background= element_blank(), 
        plot.title = element_text(face="bold", size = 13), 
        panel.grid.minor = element_blank(), panel.grid.major= element_blank(), 
        axis.title.y = element_blank(), axis.text.y = element_text(size=10),
        axis.title.x = element_blank(), axis.text.x = element_text(size=10, face="bold"),
        legend.title=element_blank(), legend.position="bottom")
Yorkshire

# Export in a tiff format
tiff("Yorkshire500.tiff", width = 4000, height = 5500, res=500)
plot(Yorkshire)
dev.off()
