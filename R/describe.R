#' describe
#'
#' describe provides summary statistics of variables. Logicals and factors are converted to
#' numeric and for strings statistics of string length are provided.
#'
#' @param df data frame
#' @param ... optional list of variables or other dplyr selection
#'
#' @return data frame with summary statistics
#' @export
#'
#' @examples describe(cars)

describe <- function(df,...)
{
  if (nargs() > 1) df = dplyr::select(df, ...)
  df %>%
    mutate_if(is.character, str_length) %>%
    mutate_if( is.factor, as.numeric) %>%
    mutate_if(is.logical, as.numeric) %>%
    gather(var, value) %>%
    mutate(na = 1 - is.na(value)) %>%
    group_by(var) %>%
    summarise(
      mean = mean(value, na.rm = TRUE),
      sd = sd(value, na.rm = TRUE),
      min = min(value, na.rm = TRUE),
      max = max(value, na.rm = TRUE),
      N = sum(na)
    ) %>%
    bind_cols( data_frame(type =map(df, function(x)stringr::str_c("<",type_sum(x),">")) )) %>%
    select(var, type, N, everything()) %>%
    mutate_if(is.numeric, ~ round(.x , digits = 3) ) %>%
    as.data.frame()
}
