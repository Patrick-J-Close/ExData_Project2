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
#Merge datasets
if(!exists("NEISCC")){
     NEISCC <- merge(NEI, SCC, by = "SCC")
}
#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore
#City?
#
MotorVehicles <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
MotorVehicles <- aggregate(Emissions ~ year, MotorVehicles, sum)
#
library(ggplot2)
png("plot5.png")
g <- ggplot(MotorVehicles, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity") + xlab("year") +
     ylab("Total PM2.5 Emissions") +
     ggtitle("Total PM2.5 Emissions from Motor Vehicles In Baltimore City, MD by year")
print(g)
dev.off()
