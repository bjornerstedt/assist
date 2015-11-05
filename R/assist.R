assist <- function(domenu = FALSE) {
  require(shiny)
  message("Select menu alternatives in the Viewer pane, or press Esc to cancel")
  runApp()
  eval(parse( text = command ), envir = .GlobalEnv)
}
