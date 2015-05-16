## Create a plot comparing vehicle emissions in Baltimore City with Los Angeles


NEI <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/summarySCC_PM25.rds")
SCC <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/Source_Classification_Code.rds")

vehicle_sources <- SCC[grepl("veh",SCC$Short.Name,ignore.case=TRUE),]
only_vehicle_data <- merge(x=NEI,y=vehicle_sources,by="SCC")
only_vehicle_data$City <- NA
only_vehicle_data$City[only_vehicle_data$fips=='24510'] <- "Baltimore City"
only_vehicle_data$City[only_vehicle_data$fips=='06037'] <- "Los Angeles"

png("plot6.png")
plot_data <- only_vehicle_data %>% filter(fips=="24510" | fips == "06037") %>% group_by(year,City) %>% summarize(Emissions = sum(Emissions))
plotTitle = "Total US Emissions PM[2.5] from Motor Vehicles"
plotYLab = "Total PM2.5 Emissions (tons)"
plotXLab = "Year"
plotType = "l"
plotYlim=c(0, max(plot_data$Emissions)+max(plot_data$Emissions)/5)

plot<- ggplot(plot_data, aes(x=as.factor(year),y=Emissions,color=City,fill=City)) + geom_bar(stat="identity") + ylim(plotYlim) + facet_grid(City ~ .) +
  geom_text(aes(label=format(Emissions,digits=2,nsmall=2)),color="black",vjust=-0.2) +  labs(x=plotXLab, y=plotYLab, title=plotTitle)
print(plot)
dev.off()