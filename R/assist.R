assist <- function(domenu = FALSE) {
  message("Select menu alternatives in the Viewer pane, or press Esc to cancel")
  if(domenu)
    runApp('shiny-menu')
  else
    runApp("shiny-dialog")
  eval(parse( text=command ), envir = .GlobalEnv)
}
