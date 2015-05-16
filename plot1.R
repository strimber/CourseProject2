## Create a plot that shows total US Emissions of PM 2.5 by year


NEI <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/summarySCC_PM25.rds")

png("plot1.png")

plot_data <- NEI %>% group_by(year) %>% summarize(Emissions = sum(Emissions))
plotTitle = "Total US Emissions from all sources (tons by year)"
plotYLab = "Total Emissions (tons)"
plotXLab = "Year"
plotType = "l"
plotYlim=c(0, max(plot_data$Emissions)+max(plot_data$Emissions)/20)
plot <- barplot(plot_data$Emissions,names.arg=factor(plot_data$year),ylim=plotYlim,main=plotTitle, xlab = plotXLab, ylab = plotYLab)
text(plot,plot_data$Emissions+max(plot_data$Emissions)/30,format(plot_data$Emissions,digits=2,nsmall=2))
dev.off()