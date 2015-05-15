## Read the original txt file then subset out only  the two days we're interested in.
## Create a new datetime column so we can plot against it.

NEI <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/summarySCC_PM25.rds")
SCC <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/Source_Classification_Code.rds")

veh_sources <- SCC[grepl("veh",SCC$Short.Name,ignore.case=TRUE),]
only_veh_data <- merge(x=NEI,y=veh_sources,by="SCC")
only_veh_data$City <- NA
only_veh_data$City[only_veh_data$fips=='24510'] <- "Baltimore City"
only_veh_data$City[only_veh_data$fips=='06037'] <- "Los Angeles"

png("plot6.png", width=480, height=550)
plot_data <- only_veh_data %>% filter(fips=="24510" | fips == "06037") %>% group_by(year,City) %>% summarize(Emissions = sum(Emissions))
plotTitle = "Total US Emissions PM[2.5] from Motor Vehicles"
plotYLab = "Total PM2.5 Emissions (tons)"
plotXLab = "Year"
plotType = "l"

plot<- ggplot(plot_data, aes(x=as.factor(year),y=Emissions,color=City,fill=City)) + geom_bar(stat="identity") + facet_grid(City ~ .) +
  geom_text(aes(label=format(Emissions,digits=2,nsmall=2)),color="black",vjust=-0.2) +  labs(x=plotXLab, y=plotYLab, title=plotTitle)
print(plot)
dev.off()