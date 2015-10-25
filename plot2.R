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
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
#plot answering this question.
BaltimoreNEI <- NEI[NEI$fips==24510, ]
#
BaltimoreTotalByYear <- aggregate(Emissions ~ year, BaltimoreNEI, sum)
#
png("plot2.png")
barplot(height=BaltimoreTotalByYear$Emissions, names.arg = BaltimoreTotalByYear$year, xlab = "Year", ylab = "Total PM2.5 Emissions", main = "Total PM2.5 Emissions by Year in Baltimore, MD")
dev.off()