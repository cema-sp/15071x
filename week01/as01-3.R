CPS <- read.csv("CPSData.csv")
MetroAreaCodes <- read.csv("MetroAreaCodes.csv")
CountryCodes <- read.csv("CountryCodes.csv")

print("Industries sorted:")
sort(table(CPS$Industry))

# Hispanics <- subset(CPS, CPS$Hispanic == 1)
# table(Hispanics$Race)
table(CPS$Race, CPS$Hispanic)

table(CPS$Region, is.na(CPS$Married))

print("Proportion of non-metropolitans")
sort(tapply(is.na(CPS$MetroAreaCode), CPS$State, mean))

sprintf("MetroAreaCodes: %d", nrow(MetroAreaCodes))
sprintf("CountryCodes: %d", nrow(CountryCodes))

CPS <- merge(CPS, MetroAreaCodes, by.x="MetroAreaCode", by.y="Code", all.x=TRUE)

print("Interviewees per Metropolitan Area:")
sort(table(CPS$MetroArea))

print("Proportion of Hispanics per MetroArea:")
sort(tapply(CPS$Hispanic, CPS$MetroArea, mean, na.rm=TRUE))

print("Proportion of Asians per MetroArea:")
sort(tapply(CPS$Race == 'Asian', CPS$MetroArea, mean, na.rm=TRUE))

print("Proportion of not-educated per MetroArea:")
sort(tapply(CPS$Education == "No high school diploma", CPS$MetroArea, mean, na.rm=TRUE))

CPS <- merge(CPS, CountryCodes, by.x="CountryOfBirthCode", by.y="Code", all.x=TRUE)

print("Non-US born living in NY-NJ-LI:")
tapply(CPS$Country != "United States", CPS$MetroArea, mean, na.rm=TRUE)

