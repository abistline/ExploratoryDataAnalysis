# Course Project 2
# Question 6, comparison between total PM2.5 Emissions from motor vehicles 
# in Baltimore and Los Angeles, 1999, 2002, 2005, 2008

rm(list = ls())
library(ggplot2)

# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Select vehicle data from Baltimore only
vehicle <- grepl("vehicle", SCC$EI.Sector, ignore.case = TRUE)
vehicle.code <- SCC$SCC[vehicle]
NEI.bmore <- NEI[NEI$fips == "24510", ]
NEI.bmore.vehicles <- NEI.bmore[NEI.bmore$SCC %in% vehicle.code, ]
NEI.bmore.vehicles$city <- "Baltimore City"

# Select vehicle data from Los Angeles only
NEI.la <- NEI[NEI$fips == "06037", ]
NEI.la.vehicles <- NEI.la[NEI.la$SCC %in% vehicle.code, ]
NEI.la.vehicles$city <- "Los Angeles County"

# Combine the two emission datasets
em.la.bmore.vehicles = rbind(NEI.bmore.vehicles, NEI.la.vehicles)

# Plot the results
# png("plot5.png", width = 600)
png("plot6.png", width = 600)
plot6 = ggplot(data = em.la.bmore.vehicles, aes(x = factor(year), y = Emissions, fill = city)) + 
      geom_bar(stat = "identity") +
      theme_minimal() + guides(fill = FALSE) +
      theme(plot.title = element_text(hjust = 0.5)) +
      facet_grid(.~city, scales = "free", space = "free", switch = "x") +
      labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (tons)")) +
      labs(title = expression("PM"[2.5]*" Emissions, Baltimore and LA, 1999, 2002, 2005, 2008 by Source Type"))

print(plot6)
dev.off()