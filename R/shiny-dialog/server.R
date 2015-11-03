library(shiny)
library(stringr)
shinyServer(function(input, output) {

  output$text1 <- renderText({
    if (input$submit > 0) {
      if(input$varname != '')
        outstr <- paste(input$varname, ' <- describe(')
      else
        outstr <- 'describe('
      command <<- str_c(outstr, input$data_frame, ", ", paste(input$varname1, collapse = ', '), ")")
      stopApp()
      message(command)
    }
    paste("You have selected", input$data_frame)
  })
  output$selectVar1 <- renderUI({
    if(input$data_frame != '') {
      varnames <- colnames(get(input$data_frame))
      selectInput("varname1", "Select your choice", varnames)
    }
  })
  output$selectVar2 <- renderUI({
    if(input$data_frame != '') {
      varnames <- colnames(get(input$data_frame))
      selectInput("varname2", "Select your choice", varnames)
    }
  })
  output$selectMultipleVar1 <- renderUI({
    if(input$data_frame != '') {
      varnames <- colnames(get(input$data_frame))
      selectInput("varname1", "Select your choice", varnames, multiple=TRUE, selectize=TRUE)
    }
  })
})
