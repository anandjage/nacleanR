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
# percent_na <- function(data){
#   round(apply(data,2, function(y) {
#     sum(is.na(y))/length(y)*100}),2)
# }

