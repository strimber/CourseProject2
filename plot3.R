## Read the original txt file then subset out only  the two days we're interested in.
## Create a new datetime column so we can plot against it.

NEI <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/summarySCC_PM25.rds")

png("plot3.png", width=480, height=480)
plot_data <- NEI %>% filter(fips=="24510") %>% group_by(year,type) %>% summarize(Emissions = sum(Emissions))
plotTitle = "Total Baltimore City Emissions PM2.5 by Type"
plotYLab = "Total PM2.5 Emissions (tons)"
plotXLab = "Year"
plotType = "l"
##ggplot(plot_data, aes(x=as.factor(year),y=Emissions,group=type)) + geom_line() + geom_point() 
plot<- ggplot(plot_data, aes(x=as.factor(year),y=Emissions,fill=type)) + geom_bar(stat="identity") + facet_grid(type ~ .) +
  geom_text(aes(label=format(Emissions,digits=2,nsmall=2),vjust=-0.2)) +  labs(x=plotXLab, y=plotYLab, title=plotTitle)
print(plot)
dev.off()