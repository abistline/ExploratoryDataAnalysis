# Course Project 2
# Question 3, total PM2.5 Emissions in Baltimore 1999, 2002, 2005, 2008

rm(list = ls())
library(ggplot2)

#
# # Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#
# # Narrow the dataset down to just Baltimore
NEI.bmore <- NEI[NEI$fips == 24510, ]

# Plot the results in ggplot2
png("plot3.png", width = 600)
plot3 = ggplot(data=NEI.bmore, aes(x = factor(year), y = Emissions, fill = type)) + 
      geom_bar(stat = "identity") +
      theme_minimal() + guides(fill = FALSE) +
      theme(plot.title = element_text(hjust = 0.5)) +
      facet_grid(.~type, scales = "free", space = "free", switch = "x") +
      labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (tons)")) +
      labs(title = expression("PM"[2.5]*" Emissions, Baltimore, 1999, 2002, 2005, 2008 by Source Type"))

print(plot3)
dev.off()