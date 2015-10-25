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
#Plot1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Using the base plotting system, make a plot showing the total PM2.5 emission
#from all sources for each of the years 1999, 2002, 2005, and 2008.
#
TotalByYear <- aggregate(Emissions ~ year, NEI, sum)
#
png("plot1.png")
barplot(height=TotalByYear$Emissions, names.arg = TotalByYear$year, xlab = "Year", ylab = "Total PM2.5 Emissions", main = "Total PM2.5 Emissions by Year")
dev.off()
