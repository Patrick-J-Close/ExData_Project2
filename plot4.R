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
#Across the United States, how have emissions from coal combustion-related
#sources changed from 1999-2008?
#
coal <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)
coal <- NEISCC[coal, ]
CoalTotalbyYear <- aggregate(Emissions ~ year, coal, sum)
#
library(ggplot2)
png("plot4.png", width = 640, height = 480)
g <- ggplot(CoalTotalbyYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity") +
     xlab("year") +
     ylab("Total PM2.5 Emissions") +
     ggtitle("Total PM2.5 Emissions from coal by year")
print(g)
dev.off()