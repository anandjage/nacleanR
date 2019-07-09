## ----percent_na----------------------------------------------------------
library(nacleanR)
## basic example code
csv <- system.file("extdata", 'nadata.csv', package = "nacleanR")
sample_data <- read_data(path = csv)
percent_na(sample_data)

## ----invalidcols---------------------------------------------------------
nacleanR::invalidcols(data = sample_data,threshold = 50)

## ----validcols-----------------------------------------------------------
nacleanR::validcols(data = sample_data,threshold = 50)

## ------------------------------------------------------------------------
new_data <- nacleanR::select_cols(data = sample_data,threshold = 50)
new_data

## ------------------------------------------------------------------------
csv = system.file("extdata", 'agedata.csv', package = "nacleanR")
agedata <- read_data(csv)
agedata$ageTodaySinceBuilt <- age_cal(agedata,"YearBuilt")
agedata$ageTodaySinceRenovated <- age_cal(agedata, "YearRenovated")
head(agedata)

