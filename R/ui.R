library(shiny)

# Get data frame with all datasets
# x <- as.data.frame(data()$results)

df_names <- function() {
  choose = list("Choose data frame" = '')
  dfnames <- as.list(Filter(function(x) is.data.frame(get(x)), ls(envir=.GlobalEnv) ))
  dfnames <- c(choose,dfnames)
  selectInput("data_frame", label = h5("Select data frame"),
    choices = dfnames, selectize = FALSE)
}

df_vars <- function() {
  sidebarPanel(
    df_names(),
    textOutput("text1"),
    uiOutput("selectMultipleVar1"),
    br(),
    textInput('varname', 'Put result in variable'),
    br(),
    actionButton('submit', "Submit"),
    actionButton("cancel", "Cancel")
  )
}

menu_plot2 <- function() {
  sidebarPanel(
    df_names(),
    textOutput("text1"),
    uiOutput("selectVar1"),
    uiOutput("selectVar2"),
    br(),
    textInput('varname', 'Put plot result in variable'),
    br(),
    actionButton('submit', "Submit"),
    actionButton("cancel", "Cancel")
  )
}

shinyUI(navbarPage("R Mosaic",
  navbarMenu("Data",
    tabPanel("Panel 2")
  ),

  navbarMenu("Statistics",
    tabPanel("Describe", df_vars(), value='describe'),
    tabPanel("Panel 3")
  ),

  navbarMenu("Graphics",
    # tabPanel("Plot", menu_plot2(), value='plot'),
    tabPanel("Panel 3")
  ),

  collapsible = FALSE,
  id ="menu_choice"
  # , header = tags$head(tags$style(type='text/css', ".navbar-header { font-size: 10pt; }"))
))
