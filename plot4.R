## Create a plot showing all US emissions of PM 2.5 from 'coal' based sources

NEI <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/summarySCC_PM25.rds")
SCC <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/Source_Classification_Code.rds")

coal_sources <- SCC[grepl("coal",SCC$Short.Name,ignore.case=TRUE),]
only_coal_data <- merge(x=NEI,y=coal_sources,by="SCC")



png("plot4.png", width=480, height=480)
plot_data <- only_coal_data %>% group_by(year) %>% summarize(Emissions = sum(Emissions))
plotTitle = "Total US Emissions PM[2.5] from Coal Combustion"
plotYLab = "Total PM2.5 Emissions (tons)"
plotXLab = "Year"
plotType = "l"

plot<- ggplot(plot_data, aes(x=as.factor(year),y=Emissions)) + geom_bar(stat="identity") +
  geom_text(aes(label=format(Emissions,digits=2,nsmall=2)),vjust=-0.2) +  labs(x=plotXLab, y=plotYLab, title=plotTitle)
print(plot)
dev.off()