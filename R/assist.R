assist <- function() {
x <<-  data.frame(c(1,2))
yy<<-data.frame(var1=c(2,2),var2=c(3,4))
message("Select menu alternatives in the Viewer pane, or press Esc to cancel")
runApp("shiny-dialog")
# runApp('shiny-menu')
}
