# Course Project 2
# Question 1, total PM2.5 Emissions 1999, 2002, 2005, 2008

rm(list = ls())

# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum all of the PM 2.5 emission measurements by year
tot.em.by.year <- with(NEI, tapply(Emissions, year, sum))

# Plot the results and save PNG image
png("plot1.png")
barplot(tot.em.by.year, main = "Total PM 2.5 Emissions (1999, 2002, 2005, 2008)",
        xlab = "Year", ylab = "Total PM 2.5 Emissions (tons)", col = "blue")
dev.off()

