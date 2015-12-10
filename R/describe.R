describe <- function(df,...)
{
  require(stringr)
  require(dplyr)
  if(!is.data.frame(df))
    stop("First argument must be a data frame")
  # df <- df[!sapply(df, is.character)]
  ischar <- sapply(df, is.character)
  if (nargs() > 1)
      df <- df %>% select(...)
  varType <- sapply(df, function(x)str_c("(",type_sum(x),")") )
  if(any(ischar))
    df <- mutate_each_(df, funs(str_length), names(df)[ischar])
  # Create a string var with factor levels
  factorLevels <- sapply(df, function(x)ifelse(is.factor(x),
    ifelse(str_length(fd <- str_c(levels(x), collapse = '/')) < 10, fd, str_c(length(levels(x)), " levels") ),
    ''))
  hasFactors <- any(sapply(df, is.factor))
  dfout <- df %>% mutate_each(funs(as.numeric))
  dfout <- sapply(c(
    mean=mean,
    sd=sd,
    min=min,
    max=max,
    n=function(x,...)sum(1-is.na(x))),
    function(x){sapply(dfout, x, na.rm=TRUE)})
  # Handle strange behavior of sapply when there is only one variable
  if(length(df) == 1) {
    dfout <- t(as.matrix(dfout))
    colnames(dfout) <- c("mean","sd","min","max","n")
  }
  dfout <- as.data.frame(dfout)
  dfout <- bind_cols(data_frame(vars=names(df),type=varType),dfout)
 # format(dfout$mean, digits=3, scientific = FALSE, nsmall = 0) 
  formatC(dfout$min) 
  
  if(hasFactors)
    dfout$factor <- factorLevels
#  format(dfout, digits=3, scientific = FALSE, nsmall = 0) 
  as.data.frame(dfout)
}
