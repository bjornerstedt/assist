library(shiny)

data_frame_names <- function() {
  choose = list("Choose data frame" = '')
  dfnames <- as.list(Filter(function(x) is.data.frame(get(x)), ls(envir=.GlobalEnv) ))
  c(choose,dfnames)
}

data_frame_vars <- function() {
  sidebarPanel(
    selectInput("data_frame", label = h5("Select data frame"),
                choices = data_frame_names(), selectize = FALSE),
    textOutput("text1"),
    br(),
    uiOutput("selectVar1"),
    uiOutput("selectVar2"),
    actionButton('submit', "Submit")
  )
}

shinyUI(fluidPage(
  titlePanel("Select data and fields"),

  sidebarLayout(
    data_frame_vars(),
    mainPanel()
  )
))
