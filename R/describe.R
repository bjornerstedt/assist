describe <- function(df,...)
{
  require(stringr)
  require(dplyr)
  if(!is.data.frame(df))
    stop("First argument must be a data frame")
  # df <- df[!sapply(df, is.character)]
  ischar <- sapply(df, is.character)
  if(any(ischar))
    df <- mutate_each_(df, funs(str_length), names(df)[ischar])
  if (nargs() > 1)
      df <- df %>% select(...)
  # Create a string var with factor levels
  factorLevels <- sapply(df, function(x)ifelse(is.factor(x),
    ifelse(str_length(fd <- str_c(levels(x), collapse = '/')) < 10, fd, str_c(length(levels(x)), " levels") ),
    ''))
  hasFactors <- any(sapply(df, is.factor))
  df <- df %>% mutate_each(funs(as.numeric))
  dfout <- sapply(c(
    mean=mean,
    sd=sd,
    min=min,
    max=max,
    n=function(x,...)sum(1-is.na(x))),
    function(x){sapply(df, x, na.rm=TRUE)})
  # Handle strange behavior of sapply when there is only one variable
  if(length(df) == 1) {
    dfout <- t(as.matrix(dfout))
    colnames(dfout) <- c("mean","sd","min","max","n")
  }
  dfout <- as.data.frame(dfout)
  dfout <- bind_cols(data_frame(vars=names(df),
      type=sapply(out, function(x)str_c("(",type_sum(x),")") )),dfout)

  if(hasFactors)
    dfout$factor <- factorLevels
 dfout
}
