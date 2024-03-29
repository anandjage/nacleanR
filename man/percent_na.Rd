% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/variable_operations.R
\name{percent_na}
\alias{percent_na}
\title{Calculate Percentage of NA in each variable in data}
\usage{
percent_na(data)
}
\arguments{
\item{data}{name of dataset}
}
\value{
a list of variable names with percentage of missing values
}
\description{
Probes the percentage of missing values within the variables
}
\examples{
csv = system.file("extdata", 'nadata.csv', package = "nacleanR")
data <- read_data(csv)
percent_na(data)


}
