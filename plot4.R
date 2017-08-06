# Course Project 2
# Question 4, total PM2.5 Emissions from coal combustion 
# sources 1999, 2002, 2005, 2008

rm(list = ls())

# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Determine the SCC code for coal combustion sources
coal <- grepl("coal", SCC$EI.Sector, ignore.case = TRUE)
comb <- grepl("comb", SCC$EI.Sector, ignore.case = TRUE)
coal.comb <- coal & comb
coal.comb.code <- SCC$SCC[coal.comb]

# Narrow the dataset down to just coal-combustion sources
NEI.coal.comb <- NEI[NEI$SCC %in% coal.comb.code, ]

# Sum all of the PM 2.5 emission measurements in Baltimore 1999, 2002, 2005, 2008
tot.em.cc <- with(NEI.coal.comb, tapply(Emissions, year, sum))

# Plot the results
png("plot4.png")
barplot(tot.em.cc, main = "Total PM2.5 Emissions from Coal Combustion (1999, 2002, 2005, 2008)",
        xlab = "Year", ylab = "Total PM2.5 Emissions (tons)", col = "orange")
dev.off()