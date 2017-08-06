# Course Project 2
# Question 2, total PM2.5 Emissions in Baltimore 1999, 2002, 2005, 2008

# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Narrow the dataset down to just Baltimore
NEI.bmore <- NEI[NEI$fips == 24510, ]

# Sum all of the PM 2.5 emission measurements in Baltimore 1999, 2002, 2005, 2008
tot.em.bmore <- with(NEI.bmore, tapply(Emissions, year, sum))

# Plot the results
png("plot2.png")
barplot(tot.em.bmore, main = "Total PM2.5 Emissions in Baltimore (1999, 2002, 2005, 2008)",
        xlab = "Year", ylab = "Total PM2.5 Emissions (tons)", col = "orange")
dev.off()