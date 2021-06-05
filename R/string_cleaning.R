# String Cleaning (that time of year)

#' Cleaning Strings
#'
#' @param x # variable x
#'
#' @return # variable x

cleaneR_string <- function(x){
  x %>%
    stringr::str_to_lower() %>% # converts string to lowercase
    stringr::str_trim() # trims whitespace
}
