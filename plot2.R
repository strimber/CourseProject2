## Create a plot showing total Baltimore PM 2.5 emissions for all sources


NEI <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/summarySCC_PM25.rds")

png("plot2.png", width=480, height=480)
plotTitle = "Total Baltimore City Emissions PM2.5 from all sources"
plotYLab = "Total PM2.5 Emissions (tons)"
plotXLab = "Year"
plotType = "l"
plot_data <- NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarize(Emissions = sum(Emissions))
plotXLab = "Year"
plotType = "l"
plotYlim=c(0, max(plot_data$Emissions)+max(plot_data$Emissions)/20)
plot <- barplot(plot_data$Emissions,names.arg=factor(plot_data$year),ylim=plotYlim,main=plotTitle, xlab = plotXLab, ylab = plotYLab)
text(plot,plot_data$Emissions+max(plot_data$Emissions)/30,format(plot_data$Emissions,digits=2,nsmall=2))
dev.off()
