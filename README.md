
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rwetasks

<!-- badges: start -->

<!-- badges: end -->

rwetasks has simple functions for performing common tasks, such as
calculating the number (and proportion) of people: in each age group,
receiving a specific treatment, annualizing healthcare costs and how
different inclusion criteria affects the sample size. It was built for
anyone working with real-world data (RWDD) in mind, however experienced
R users can already do everything covered here. rwetasks is aimed at
improving speed of simple tasks, so you can use your brain power for the
more complex stuff\!

Status: Currently in development, not officially released yet (aka not
ready for prime time)

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
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
#> ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
#> ✓ tibble  3.1.2     ✓ dplyr   1.0.6
#> ✓ tidyr   1.1.3     ✓ stringr 1.4.0
#> ✓ readr   1.4.0     ✓ forcats 0.5.1
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
library(rwetasks)

rwetasks::count_percent(mtcars, gear)
#> # A tibble: 3 x 3
#> # Groups:   gear [3]
#>    gear     n  prop
#>   <dbl> <int> <dbl>
#> 1     3    15 0.469
#> 2     4    12 0.375
#> 3     5     5 0.156
```

### count\_percent\_demo

count\_percent\_demo provides a way to quickly calculate the number (n)
and proportion of each value of a variable, when you have multiple
measures per participants (i.e., if you have longitudinal data, but want
to calculate proportion of females for participants).

``` r
library(tidyverse)
library(rwetasks)

rwetasks::count_percent_demo(iris, Species, Petal.Width)
#> # A tibble: 3 x 3
#> # Groups:   Species [3]
#>   Species        n  prop
#>   <fct>      <int> <dbl>
#> 1 versicolor     9 0.409
#> 2 virginica      7 0.318
#> 3 setosa         6 0.273
```
