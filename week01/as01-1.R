mvt <- read.csv('mvtWeek1.csv')

sprintf("Rows in MVT: %d", nrow(mvt))

sprintf("Max ID: %d", max(mvt$ID))

sprintf("Min Beat: %d", min(mvt$Beat))

sprintf("Arrests: %d", nrow(subset(mvt, mvt$Arrest == TRUE)))

sprintf("Crimes in Alleys: %d", nrow(subset(mvt, mvt$LocationDescription == 'ALLEY')))

sprintf("First Date: %s", mvt$Date[1])

DateConvert <- as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))

sprintf("Median DateConvert: %s", median(DateConvert))

mvt$Month = months(DateConvert)
mvt$Weekday = weekdays(DateConvert)
mvt$Date = DateConvert

print("Crimes per Month:")
table(mvt$Month)

print("Crimes per Weekday:")
table(mvt$Weekday)

print("Arrests per Month:")
table(mvt$Month, mvt$Arrest)

print("Histogram of dates")
hist(mvt$Date, breaks=100)

print("Boxplot of Arrests by Date")
boxplot(Date~Arrest, data=mvt)

print("Arrests per year")
table(format(mvt$Date, "%Y"), mvt$Arrest)

print("Top Locations")
tail(sort(table(mvt$LocationDescription)), n = 6)

Top5 <- subset(mvt, mvt$LocationDescription %in% c('STREET', 'PARKING LOT/GARAGE(NON.RESID.)', 'ALLEY', 'GAS STATION', 'DRIVEWAY - RESIDENTIAL'))

print("Rows in Top5 Locations")
nrow(Top5)

# Refresh data & remove useless
Top5$LocationDescription = factor(Top5$LocationDescription)

print("Arrest on Top5 Locations")
table(Top5$LocationDescription, Top5$Arrest)

print("GTA on Gas Stations")
table(subset(Top5, Top5$LocationDescription == 'GAS STATION')$Weekday)

