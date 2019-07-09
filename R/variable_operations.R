


# percent_na --------------------------------------------------------------


#' Calculate Percentage of NA in each variable in data
#'
#'Probes the percentage of missing values within the variables
#'
#' @param data name of dataset
#'
#' @return a list of variable names with percentage of missing values
#' @export
#'
#' @examples
#' csv = system.file("extdata", 'nadata.csv', package = "nacleanR")
#' data <- read_data(csv)
#' percent_na(data)
#'
#'
percent_na <- function(data){
  round(apply(data,2, function(y) {
    sum(is.na(y))/length(y)*100}),2)
}

# validcols ---------------------------------------------------------------


#' Return Valid variable names
#'
#' @param data name of dataset
#' @param threshold threshold percentage of NAs or missing values
#'
#' @return names of variables that fall within user defined criteria for missing value
#' @export
#'
#' @examples
#' csv = system.file("extdata", 'nadata.csv', package = "nacleanR")
#' data <- read_data(csv)
#' validcols(data,50)
validcols <- function(data,threshold) {
  names(data[percent_na(data)<threshold])
}

# invalidcols ---------------------------------------------------------------

#' Return Invalid Variable Names
#'
#' @param data name of dataset
#' @param threshold threshold percentage of NAs or missing values
#'
#' @return
#' @export
#'
#' @examples
#' csv = system.file("extdata", 'nadata.csv', package = "nacleanR")
#' data <- read_data(csv)
#' invalidcols(data,50)
invalidcols <- function(data,threshold) {
  names(data[percent_na(data)>threshold])
}

# select_cols ---------------------------------------------------------------

#' Valid Variable Selector
#'
#' @param data name of dataset
#' @param threshold threshold percentage of NAs or missing values
#'
#' @return output dataset after operation
#' @export
#'
#' @examples
#' csv = system.file("extdata", 'nadata.csv', package = "nacleanR")
#' data <- read_data(csv)
#' select_cols(data,50)
  select_cols <- function(data,threshold) {
    output <- data[validcols(data,threshold)]
    return(output)
  }

  # select_cols <- function(data,threshold) {
  #   data[validcols(data,threshold)]
  # }



# age_cal ---------------------------------------------------------------

#' Age Calculator
#'
#' Calculate age variable in years from an existing calendar year variable in dataset by subtracting year variable from System Date
#' @param data name of dataset
#' @param variable variable name whose age is to be calculated
#'
#' @return a dataframe with age as a vector
#' @export
#'
#' @examples
#' csv = system.file("extdata", 'agedata.csv', package = "nacleanR")
#' agedata <- read_data(csv)
#' agedata$ageTodaySinceBuilt <- age_cal(agedata,"YearBuilt")
#' agedata$ageTodaySinceRenovated <- age_cal(agedata, "YearRenovated")
#' head(agedata)
age_cal <- function(data,variable){
  as.character(variable)
  age <- as.integer(format(Sys.Date(), "%Y")) - data[variable]
  return(age[[variable]])
}

# age_cal <- function(data,variable){
#   as.character(variable)
#   age <- as.integer(format(Sys.Date(), "%Y")) - data[variable]
#   return(age[variable])
# }






