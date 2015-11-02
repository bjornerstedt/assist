library(shiny)

data_frame_names <- function() {
  choose = list("Choose data frame" = '')
  dfnames <- as.list(Filter(function(x) is.data.frame(get(x)), ls(envir=.GlobalEnv) ))
  c(choose,dfnames)
}

shinyUI(fluidPage(
  # titlePanel(a),
   titlePanel("Select data and fields"),

  sidebarLayout(
    sidebarPanel(
      selectInput("data_frame", label = h5("Select data frame"),
                  choices = data_frame_names(), selectize = FALSE),
      textOutput("text1"),
      br(),
      htmlOutput("selectVar1"),
      actionButton('submit', "Submit")
    ),
    mainPanel()
  )
))
