
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rwetasks

<!-- badges: start -->

<!-- badges: end -->

rwetasks has simple functions for performing common tasks, such as
calculating the number (and proportion) of people in each age group. It
was built with beginning R users in mind. Experienced R users can
already do everything covered here but with rwetasks they can do it
easily and focus on the fun stuff\!

Status: Currently in development, not ready for prime time

## Installation

The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("battenr/rwetasks")
```

## Using rwetasks

### count\_percent

count\_percent provides a way to quickly calculate the number (n) and
proportion of each value of a variable, arranged by proportion.

``` r
library(rwetasks)
rwetasks::count_percent(mtcars, gear)
#> Loading required package: magrittr
#> # A tibble: 3 x 3
#> # Groups:   gear [3]
#>    gear     n  prop
#>   <dbl> <int> <dbl>
#> 1     3    15 0.469
#> 2     4    12 0.375
#> 3     5     5 0.156
```
