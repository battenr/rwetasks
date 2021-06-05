# Cleaning Strings

#' Clean a String, trim whitespace and all lowercase
#' @importFrom magrittr %>%
#' @param x a vector
#'
#' @return vector x, in all lowercase and with whitespace trimmed
#'
cleaneR_string <- function(x){
  x %>%
    stringr::str_to_lower() %>% # converts string to lowercase
    stringr::str_trim() # trims whitespace
}
