
#' Read CSV File and convert missing values in form of spaces, empty value, character NA and na into logical NAs
#'
#' @param path "path/filename.csv"
#'
#' @return Second sample data
#' @export
#'
#' @examples
#' csv = system.file("extdata", 'data2csv', package = "nacleanr")
#' read_data(csv)
read_data <- function(path){
  read.csv(path, header=T, sep=",", na.strings = c(" ","","NA","na"))
}
