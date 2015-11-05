library(shiny)

df_names <- function() {
  choose = list("Choose data frame" = '')
  dfnames <- as.list(Filter(function(x) is.data.frame(get(x)), ls(envir=.GlobalEnv) ))
  c(choose,dfnames)
}

df_vars <- function(cname, multipleVars = TRUE) {
  menu_choice <<- cname
  sidebarPanel(
    selectInput("data_frame", label = h5("Select data frame"),
                choices = df_names(), selectize = FALSE),
    textOutput("text1"),
    uiOutput("selectMultipleVar1"),
    # uiOutput("selectVar2"),
    br(),
    textInput('varname', 'Put result in variable'),
    br(),
    actionButton(cname, "Submit"),
    actionButton("cancel", "Cancel")
  )
}

shinyUI(navbarPage("R Mosaic",
navbarMenu("Data",
 tabPanel("Panel 2")
),
navbarMenu("Statistics",
tabPanel("Describe", df_vars('submit'), value='describe'),
tabPanel("Panel 3")
),
navbarMenu("Graphics",
tabPanel("Panel 2"),
tabPanel("Panel 3")
),
collapsible = FALSE,
id ="menu_choice"
# , header = tags$head(tags$style(type='text/css', ".navbar-header { font-size: 10pt; }"))
))
