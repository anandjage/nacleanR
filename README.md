
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nacleanr

<!-- badges: start -->

<!-- badges: end -->

## DESCRIPTION

The goal of nacleanR is to provide functions that aide in data
cleansing. It comprises of functions to  
\* **Probe the percentage of missing values** within the variables  
\* **Find valid & invalid variables** from point of view of percentage
of missing data  
\* **Remove Variables with Missing Values** above user defined limit
from a dataset  
\* **Calculate age variable in years** from an existing calendar year
variable in dataset by subtracting year variable from System Date

## Installation

*Update:Package is currently not available on CRAN*  
*Please use GitHub to install development version*  
You can install the released version of nacleanr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("nacleanR")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("anandjage/nacleanR")
```

## Example `perecnt_na()`

This is a basic example which shows how to find percentage of missing
values in the form of NA in each variable:

``` r
library(nacleanR)
## basic example code
csv <- system.file("extdata", 'nadata.csv', package = "nacleanR")
sample_data <- read_data(path = csv)
percent_na(sample_data)
#> Length  Width Height Weight 
#>     20     40     60     20
```

## Example `invalidcols(dataset,threshold)`

This is a basic example which shows variables that contain missing
values NA above user defined threshold

``` r
nacleanR::invalidcols(data = sample_data,threshold = 50)
#> [1] "Height"
```

## Example `validcols(dataset,threshold)`

This is a basic example which shows variables that contain missing
values NA in the form within the user defined threshold.

``` r
nacleanR::validcols(data = sample_data,threshold = 50)
#> [1] "Length" "Width"  "Weight"
```

## Example `select_cols(dataset,threshold)`

This is a basic example which returns dataset after removing variables
that contain missing values above the user defined threshold.

``` r
new_data <- nacleanR::select_cols(data = sample_data,threshold = 50)
new_data
#>    Length Width Weight
#> 1       5    NA     17
#> 2       9    NA     19
#> 3       7     6     NA
#> 4       6     7     NA
#> 5      NA     3     10
#> 6       5    NA     23
#> 7      NA    NA     12
#> 8       4     9     13
#> 9       5     4     14
#> 10      7     6     16
```

## Example `age_cal(dataset,variable)`

Calculates age by subtracting a year vector variable from current system
year. Creates a new vector in dataset.

``` r
csv = system.file("extdata", 'agedata.csv', package = "nacleanR")
agedata <- read_data(csv)
agedata$ageTodaySinceBuilt <- age_cal(agedata,"YearBuilt")
agedata$ageTodaySinceRenovated <- age_cal(agedata, "YearRenovated")
head(agedata)
#>   YearBuilt YearRenovated ageTodaySinceBuilt ageTodaySinceRenovated
#> 1      1991          2011                 28                      8
#> 2      1993          2003                 26                     16
#> 3      1991          2008                 28                     11
#> 4      1978          2000                 41                     19
#> 5      1983          2007                 36                     12
#> 6      1987          2005                 32                     14
```
