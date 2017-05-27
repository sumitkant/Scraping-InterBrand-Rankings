library(ggplot2)
library(readr)

ib2016 <- read_csv(file="D:/Data Analyst/Own Data/Interbrand Rankings/Interbrand Rankings 2016.csv")[,2:8]

ib2015 <- read_csv(file="D:/Data Analyst/Own Data/Interbrand Rankings/Interbrand Rankings 2015.csv")[,2:5]
ib15_16 <- merge(x = ib2016, y = ib2015, by = "Brand", all.x = TRUE)

ib2014 <- read_csv(file="D:/Data Analyst/Own Data/Interbrand Rankings/Interbrand Rankings 2014.csv")[,2:5]
ib14_16 <- merge(x = ib15_16, y = ib2014, by = "Brand", all.x = TRUE)


ib2013 <- read_csv(file="D:/Data Analyst/Own Data/Interbrand Rankings/Interbrand Rankings 2013.csv")[,2:5]
ib13_16 <- merge(x = ib14_16, y = ib2013, by = "Brand", all.x = TRUE)


ib2012 <- read_csv(file="D:/Data Analyst/Own Data/Interbrand Rankings/Interbrand Rankings 2012.csv")[,2:5]
ib12_16 <- merge(x = ib13_16, y = ib2012, by = "Brand", all.x = TRUE)


ib2011 <- read_csv(file="D:/Data Analyst/Own Data/Interbrand Rankings/Interbrand Rankings 2011.csv")[,2:5]
ib11_16 <- merge(x = ib12_16, y = ib2011, by = "Brand", all.x = TRUE)


ib2010 <- read_csv(file="D:/Data Analyst/Own Data/Interbrand Rankings/Interbrand Rankings 2010.csv")[,2:5]
ib10_16 <- merge(x = ib11_16, y = ib2010, by = "Brand", all.x = TRUE)


ib2009 <- read_csv(file="D:/Data Analyst/Own Data/Interbrand Rankings/Interbrand Rankings 2009.csv")[,2:5]
ib09_16 <- merge(x = ib10_16, y = ib2009, by = "Brand", all.x = TRUE)



ib2008 <- read_csv(file="D:/Data Analyst/Own Data/Interbrand Rankings/Interbrand Rankings 2008.csv")[,2:5]
ib08_16 <- merge(x = ib09_16, y = ib2008, by = "Brand", all.x = TRUE)

library(plotly)
ggplot(data = ib08_16, aes(x = Brand, y = BrandValue_2016)) + geom_bar(stat = "identity")
