# Course Project 2
# Question 5, total PM2.5 Emissions from motor vehicles 
# in Baltimore 1999, 2002, 2005, 2008

rm(list = ls())

# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Select vehicle data from Baltimore only
vehicle <- grepl("vehicle", SCC$EI.Sector, ignore.case = TRUE)
vehicle.code <- SCC$SCC[vehicle]
NEI.bmore <- NEI[NEI$fips == 24510, ]
NEI.bmore.vehicles <- NEI.bmore[NEI.bmore$SCC %in% vehicle.code, ]

# Sum all of the PM 2.5 emission measurements in Baltimore 1999, 2002, 2005, 2008
tot.em.bmore.vehicles <- with(NEI.bmore.vehicles, tapply(Emissions, year, sum))

# Plot the results
png("plot5.png", width = 600)
barplot(tot.em.bmore.vehicles, main = 
              expression("Total PM"[2.5]*" Emissions from Baltimore Vehicles (1999, 2002, 2005, 2008)"),
        xlab = "Year", ylab = 
              expression("Total PM"[2.5]*" Emissions (tons)"), col = "orange")
dev.off()