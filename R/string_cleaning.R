# Cleaning Strings

library(magrittr)
library(rlang)
library(dplyr)

#' Clean a String, trim whitespace and all lowercase
#' @param x a vector
#'
#' @return vector x, in all lowercase and with whitespace trimmed
#' @export
cleaneR_string <- function(x){
  require(magrittr)

  x %>%
    stringr::str_to_lower() %>% # converts string to lowercase
    stringr::str_trim() # trims whitespace
}
