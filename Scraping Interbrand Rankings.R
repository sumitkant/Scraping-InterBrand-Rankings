library(rvest)
library(stringr)
year = 1999
url <- paste("http://interbrand.com/best-brands/best-global-brands/",year,"/ranking/",sep = "")
webpage <- read_html(url)

# Extracting Ranks
rank_data_html <- html_nodes(webpage,'.brand-rank')
rank_data <- html_text(rank_data_html)
ranks <- as.numeric(rank_data)

# Extracting Names
brand_names_html <- html_nodes(webpage,'.logo-img')
brands <- as.character(html_attr(brand_names_html,"alt"))

# Extracting Brand Value
brand_value_html <- html_nodes(webpage,'.brand-value')
BV <- as.character(html_attr(brand_value_html,"title"))
BV <- gsub("Value: ","",BV) 
BV <- gsub(",","",BV)
regexp <- "[[:digit:]]+"
BV <- as.numeric(str_extract(BV, regexp))

# Extracting Change in Brand Value
DeltaBV_html <- html_nodes(webpage,'.brand-value-change')
DeltaBV <- html_text(DeltaBV_html)
DeltaBV <- gsub("\n","",DeltaBV) 
DeltaBV <- gsub(" ","",DeltaBV) 
DeltaBV <- gsub("%","",DeltaBV) 
DeltaBV <- as.numeric(DeltaBV)
DeltaBV[is.na(DeltaBV)] <- 0

# Extracting Brand Country
country_html <-  html_nodes(webpage,'.brand-country')
country <- html_text(country_html)
country <- gsub("\n","",country) 
country <- gsub("  ","",country) 

# Extracting Brand Sector
sector_html <-  html_nodes(webpage,'.brand-sector')
sector <- html_text(sector_html)
sector <- gsub("\n","",sector) 
sector <- gsub("  ","",sector) 

# Extracting Brand Region
region_html <-  html_nodes(webpage,'.brand-region')
region <- html_text(region_html)
region <- gsub("\n","",region) 
region <- gsub("  ","",region) 

InterBrand <- data.frame(ranking = ranks,
                         Brand = brands,
                         BrandValue = BV,
                         ChangeinBrandValue = DeltaBV,
                         Sector = sector,
                         Region = region,
                         Country = country)
colnames(InterBrand)[1] <- paste('Ranking', year, sep="_")
colnames(InterBrand)[3] <- paste('BrandValue', year, sep="_")
colnames(InterBrand)[4] <- paste('PercentChangeinBV', year, sep="_")
filename <- paste("Interbrand Rankings", year, sep = " ")
write.csv(InterBrand, file = paste(filename,".csv",sep=""))

