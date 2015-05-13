## Read the original txt file then subset out only  the two days we're interested in.
## Create a new datetime column so we can plot against it.

NEI <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/summarySCC_PM25.rds")

png("plot1.png", width=480, height=480)

totalEmissions <- with(NEI, {aggregate(Emissions,list(year), FUN = "sum")})
plotTitle = "Total US Emissions from all sources (tons by year)"
plotYLab = "Total Emissions (tons)"
plotXLab = "Year"
plotType = "l"
plot(totalEmissions,main=plotTitle, type = plotType, xlab = plotXLab, ylab = plotYLab)


dev.off()