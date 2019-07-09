


# percent_na --------------------------------------------------------------


#' Calculate Percentage of NA in each variable in data
#'
#' @param data name of dataset
#'
#' @return a list of variable names with percentage of missing values
#' @export
#'
#' @examples
#' \dontrun{
#' percent_na()
#' }
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
#' @return
#' @export
#'
#' @examples
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
invalidcols <- function(data,threshold) {
  names(data[percent_na(data)>threshold])
}

# select_cols ---------------------------------------------------------------

#' Valid Variable Selector
#'
#' @param data name of dataset
#' @param threshold threshold percentage of NAs or missing values
#'
#' @return
#' @export
#'
#' @examples
select_cols <- function(data,threshold) {
  data[validcols(data,threshold)]
}

# age_cal ---------------------------------------------------------------

#' Age Calculator
#'
#' @param data name of dataset
#' @param variable variable name whose age is to be calculated
#'
#' @return a dataframe with age as a vector
#' @export
#'
#' @examples
#' csv = system.file("extdata", 'agedata.csv', package = "nacleanr")
#' agedata <- read_data(csv)
#' agedata$ageTodaySinceBuilt <- age_cal(agedata,"YearBuilt")
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






