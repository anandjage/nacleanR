# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

percent_na <- function(x){
  round(apply(x,2, function(y) {
    sum(is.na(y))/length(y)*100}),2)
}

validcols <- function(x,p) {
  names(x[percent_na(x)<p])
}

invalidcols <- function(x,p) {
  names(x[percent_na(x)>p])
}

select_cols <- function(x,l) {
  x[validcols(x,l)]
}

age_cal <- function(dataset,variable){
  as.character(variable)
  as.integer(format(Sys.Date(), "%Y")) - dataset[variable]
}



