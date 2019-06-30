
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nacleanr

<!-- badges: start -->

<!-- badges: end -->

The goal of nacleanr is to **Removes Variables with Missing Values**
above user defined limit from a dataset .

## Installation

You can install the released version of nacleanr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("nacleanr")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("anandjage/nacleanr")
```

## Example `perecnt_na()`

This is a basic example which shows how to find percentage of missing
values in the form of NA in each variable:

``` r
library(nacleanr)
## basic example code
sample_data <- read_data(path = system.file("extdata", 'nadata.csv', package = "nacleanr"))
percent_na(sample_data)
#> Length  Width Height Weight 
#>     20     40     60     20
```

## Example `invalidcols(dataset,threshold)`

This is a basic example which shows variables that contain missing
values NA in the form more than user defined threshold

``` r
library(nacleanr)
nacleanr::invalidcols(data = sample_data,threshold = 50)
#> [1] "Height"
```

## Example `validcols(dataset,threshold)`

This is a basic example which shows variables that contain missing
values NA in the form within the user defined threshold.

``` r
nacleanr::validcols(data = sample_data,threshold = 50)
#> [1] "Length" "Width"  "Weight"
```

## Example `select_cols(dataset,threshold)`

This is a basic example which returns dataset after removing variables
that contain missing values above the user defined threshold.

``` r
nacleanr::select_cols(data = sample_data,threshold = 50)
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
year. Creates a new vector in
dataset.

``` r
building <- read_data(path = system.file("extdata", 'agedata.csv', package = "nacleanr"))
age <- age_cal(data = building, variable = "YearBuilt")
names(age)
#> [1] "YearBuilt"
building$age <- age$YearBuilt
head(building)
#>   YearBuilt YearRenovated age
#> 1      1991          2011  28
#> 2      1993          2003  26
#> 3      1991          2008  28
#> 4      1978          2000  41
#> 5      1983          2007  36
#> 6      1987          2005  32
```
