##Coursera Exploratory Data Analysis Project 2
#
setwd("C:/Users/Patrick Close/Documents/Courses/ExploratoryDataAnalysis/Project2_Data")
#
if(!exists("NEI")){
     NEI <- readRDS("summarySCC_PM25.rds")     
}
if(!exists("SCC")){
     SCC <- readRDS("Source_Classification_Code.rds")
}
#Of the four types of sources indicated by the type (point, nonpoint, onroad, 
#nonroad) variable, which of these four sources have seen decreases in 
#emissions from 1999???2008 for Baltimore City? Which have seen increases in 
#emissions from 1999???2008? Use the ggplot2 plotting system to make a plot answer 
#this question
BaltimoreNEI <- NEI[NEI$fips==24510, ]
#
BaltimoreTotalByYearType <- aggregate(Emissions ~ year + type, BaltimoreNEI, sum)
#
library(ggplot2)
#
png("plot3.png", width = 640, height = 480)
g <- ggplot(BaltimoreTotalByYearType, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("Year") + ylab("Total PM2.5 Emissions") +
     ggtitle("Total PM2.5 Emissions from Type by Year")
print(g)
dev.off()