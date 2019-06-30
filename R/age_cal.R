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
age_cal <- function(data,variable){
  as.character(variable)
  age <- as.integer(format(Sys.Date(), "%Y")) - data[variable]
  return(age[variable])
}




