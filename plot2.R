## Read the original txt file then subset out only  the two days we're interested in.
## Create a new datetime column so we can plot against it.

NEI <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/summarySCC_PM25.rds")

png("plot2.png", width=480, height=480)
baltimoreEmissions <- subset(NEI,fips == "24510")
totalEmissions <- with(baltimoreEmissions, {aggregate(Emissions,list(year), FUN = "sum")})
plotTitle = "Total Baltimore City Emissions PM2.5 from all sources"
plotYLab = "Total PM2.5 Emissions (tons)"
plotXLab = "Year"
plotType = "l"
plot(totalEmissions,main=plotTitle, type = plotType, xlab = plotXLab, ylab = plotYLab)


dev.off()