describe <- function(df,...)
{
  require(stringr)
  require(dplyr)
  if(!is.data.frame(df))
    stop("First argument must be a data frame")
  df <- df[!sapply(df, is.character)]
  if(length(names(df)) == 0)
    stop("No numeric variables found.")
  if (nargs() > 1)
      df <- df %>% select(...)
  # Create a string var with factor levels
  factorLevels <- sapply(df, function(x)ifelse(is.factor(x),
    ifelse(str_length(fd <- str_c(levels(x), collapse = '/')) < 10, fd, str_c(length(levels(x)), " levels") ),
    ''))
  hasFactors <- any(sapply(df, is.factor))
  df <- df %>% mutate_each(funs(as.numeric))
  dfout <- sapply(c(mean=mean, min=min, max=max, n=function(x,...)sum(1-is.na(x))),
    function(x){sapply(df, x, na.rm=TRUE)})
  # Handle strange behavior of sapply when there is only one variable
  if(length(df) == 1) {
    dfout <- t(as.matrix(dfout))
    rownames(dfout) <- names(df)
    colnames(dfout) <- c("mean","min","max","n")
  }
  dfout <- as.data.frame(dfout)
  if(hasFactors)
    dfout$factor <- factorLevels
  dfout
}
