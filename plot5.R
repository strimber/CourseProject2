## Create a plot showing vehical emissions of PM 2.5 for Baltimore City.

NEI <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/summarySCC_PM25.rds")
SCC <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/Source_Classification_Code.rds")

vehicle_sources <- SCC[grepl("vehicle",SCC$Short.Name,ignore.case=TRUE),]
only_vehicle_data <- merge(x=NEI,y=vehicle_sources,by="SCC")



png("plot5.png")
plot_data <- only_vehicle_data %>% filter(fips=="24510") %>% group_by(year) %>% summarize(Emissions = sum(Emissions))
plotTitle = "Total US Emissions PM[2.5] from Motor Vehicles in Baltimore City"
plotYLab = "Total PM2.5 Emissions (tons)"
plotXLab = "Year"
plotType = "l"

plot<- ggplot(plot_data, aes(x=as.factor(year),y=Emissions)) + geom_bar(stat="identity") +
  geom_text(aes(label=format(Emissions,digits=2,nsmall=2)),vjust=-0.2) +  labs(x=plotXLab, y=plotYLab, title=plotTitle)
print(plot)
dev.off()