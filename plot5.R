## Read the original txt file then subset out only  the two days we're interested in.
## Create a new datetime column so we can plot against it.

NEI <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/summarySCC_PM25.rds")
SCC <- readRDS("~/Coursera Files/ExploratoryDataAnalysis/Course Project 2/CourseProject2/Source_Classification_Code.rds")

veh_sources <- SCC[grepl("veh",SCC$Short.Name,ignore.case=TRUE),]
only_veh_data <- merge(x=NEI,y=veh_sources,by="SCC")



png("plot5.png", width=480, height=480)
plot_data <- only_veh_data %>% filter(fips=="24510") %>% group_by(year) %>% summarize(Emissions = sum(Emissions))
plotTitle = "Total US Emissions PM[2.5] from Motor Vehicles in Baltimore City"
plotYLab = "Total PM2.5 Emissions (tons)"
plotXLab = "Year"
plotType = "l"

plot<- ggplot(plot_data, aes(x=as.factor(year),y=Emissions)) + geom_bar(stat="identity",color='red',fill='red') +
  geom_text(aes(label=format(Emissions,digits=2,nsmall=2))) +  labs(x=plotXLab, y=plotYLab, title=plotTitle)
print(plot)
dev.off()