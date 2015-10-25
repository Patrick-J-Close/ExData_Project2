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
#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?
#
MotorVehicles <- NEI[(NEI$fips == "24510" | NEI$fips =="06037") & NEI$type == "ON-ROAD", ]
MotorVehicles <- aggregate(Emissions ~ year + fips, MotorVehicles, sum)
#
#Rename
MotorVehicles$fips[MotorVehicles$fips == "24510"] <- "Baltimore City, MD"
MotorVehicles$fips[MotorVehicles$fips == "06037"] <- "Los Angeles, CA"
#
#
library(ggplot2)
png("plot6.png", width = 1040, height = 480)
g <- ggplot(MotorVehicles, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
     xlab("year") +
     ylab(expression("Total PM2.5 Emissions")) +
     ggtitle("Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD vs Los Angeles, CA 1999-2008")
print(g)
dev.off()
#
#Normalize data to 1999
Ba1999 <- MotorVehicles[MotorVehicles$fips == "Baltimore City, MD" & MotorVehicles$year == "1999", "Emissions"]
MotorVehiclesBaNorm <- MotorVehicles[MotorVehicles$fips == "Baltimore City, MD", ]
MotorVehiclesBaNorm$Emissions <- MotorVehiclesBaNorm$Emissions / Ba1999
LA1999 <- MotorVehicles[MotorVehicles$fips == "Los Angeles, CA" & MotorVehicles$year == "1999", "Emissions"]
MotorVehiclesLANorm <- MotorVehicles[MotorVehicles$fips == "Los Angeles, CA", ]
MotorVehiclesLANorm$Emissions <- MotorVehiclesLANorm$Emissions / LA1999
MotorVehiclesNorm <- rbind(MotorVehiclesBaNorm, MotorVehiclesLANorm)
#
png("plot6b.png")
g <- qplot(year, Emissions, data = MotorVehiclesNorm, geom = "line", color = fips)
g <- g + xlab("year") + ylab("Total PM2.5 Emissions Normalized to 1999")
print(g)
dev.off()







