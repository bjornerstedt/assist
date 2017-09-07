#' safe left join
#'
#' safe_join performs a dplyr left_join, checking for common errors and warning
#' when matches are not found.
#'
#' safe_join performs the following checks:
#'
#' 1. Checks that key is unique in df2
#'
#' 2. Reports that matches not found in df1 or df2 (Corresponding to _merge == 1)
#'
#' 3. Checks if non-key columns exist in both datasets
#'
#' @param x Data frame
#' @param y Data frame
#' @param by Key(s) to join by. Required.
#' @param return_errors Set to TRUE to return error dataset
#' @param ... Other parameters sent to dplyr
#'
#' @return Joined dataset
#' @export
#'
#' @examples
safe_join <- function(x, y, by = NULL, return_errors = FALSE, ...) {
  duplicates = y %>% group_by(.vars = eval(as.name(by))) %>% mutate(n = n()) %>% filter(n>1)
  if ( duplicates %>% distinct() %>% nrow() > 0 ) {
    if (return_errors){
      return(duplicates)
    }
    # print(duplicates)
    stop("Duplicate key entries found in joined dataset")
  }
  common = setdiff( intersect(
    names(x),
    names(y)
  ), by)
  if (length(common) > 0 ) {
    if (return_errors){
      return(common)
    }
    # print(common)
    stop("There are data columns with the same name in both data frames.")
  }
  not_in_df2 = anti_join(x, y, by, ...)
  not_in_df1 = anti_join(y, x, by, ...)
  if (not_in_df1 %>% tally() > 0) {
    warning("Some observations in data frame 1 not matched")
  }
  if (not_in_df2 %>% tally() > 0) {
    warning("Some observations in data frame 2 not matched")
  }
  left_join(x, y, by, ...)
}
