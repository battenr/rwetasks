
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

### mean\_by\_group

mean\_by\_group provides a way to calculate the mean for each group. Can
also be used across a dataframe when you want to calculate mean(sd) for
each group for every variable

``` r
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
#> ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
#> ✓ tibble  3.1.2     ✓ dplyr   1.0.7
#> ✓ tidyr   1.1.3     ✓ stringr 1.4.0
#> ✓ readr   1.4.0     ✓ forcats 0.5.1
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
library(rwetasks)

rwetasks::mean_by_group(mtcars, mpg, gear)
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3  16.1  3.37
#> 2     4  24.5  5.28
#> 3     5  21.4  6.66

# Can also use across a dataframe like so

mtcars %>%
  purrr::map(
    ~mean_by_group(mtcars, .x, gear)
  )
#> $mpg
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3  20.1  6.03
#> 2     4  20.1  6.03
#> 3     5  20.1  6.03
#> 
#> $cyl
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3  6.19  1.79
#> 2     4  6.19  1.79
#> 3     5  6.19  1.79
#> 
#> $disp
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3  231.  124.
#> 2     4  231.  124.
#> 3     5  231.  124.
#> 
#> $hp
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3  147.  68.6
#> 2     4  147.  68.6
#> 3     5  147.  68.6
#> 
#> $drat
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3  3.60 0.535
#> 2     4  3.60 0.535
#> 3     5  3.60 0.535
#> 
#> $wt
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3  3.22 0.978
#> 2     4  3.22 0.978
#> 3     5  3.22 0.978
#> 
#> $qsec
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3  17.8  1.79
#> 2     4  17.8  1.79
#> 3     5  17.8  1.79
#> 
#> $vs
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3 0.438 0.504
#> 2     4 0.438 0.504
#> 3     5 0.438 0.504
#> 
#> $am
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3 0.406 0.499
#> 2     4 0.406 0.499
#> 3     5 0.406 0.499
#> 
#> $gear
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3  3.69 0.738
#> 2     4  3.69 0.738
#> 3     5  3.69 0.738
#> 
#> $carb
#> # A tibble: 3 x 3
#>    gear  mean    sd
#>   <dbl> <dbl> <dbl>
#> 1     3  2.81  1.62
#> 2     4  2.81  1.62
#> 3     5  2.81  1.62
```

### count\_percent

count\_percent provides a way to quickly calculate the number (n) and
proportion of each value of a variable, arranged by proportion.

``` r
library(tidyverse)
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
