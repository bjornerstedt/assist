describe <- function(df,...)
{
  if(!is.data.frame(df))
    stop("First argument must be a data frame")
  df <- df[sapply(df, is.numeric)]
  varnames <- sort(names(df))
  if(length(varnames) == 0)
    stop("No numeric variables found.")
  if (nargs() > 1) {
    vars <- sapply(as.list(substitute(list(...))) [-1L], toString)
    if (all(vars %in% varnames) ) {
      varnames <- vars
    } else {
      stop("Only numeric variables in dataset can be specified")
    }
  }
  dfout <- rbind_all(lapply( varnames, function(x) {
    summarise_each_(df, funs(
        n = sum(1-is.na(.)), mean(.,na.rm = TRUE),
        min(.,na.rm = TRUE), max(.,na.rm = TRUE), sd(.,na.rm = TRUE)),
      x)
  }))
  rownames(dfout) <- varnames
  as.matrix(dfout)
}
