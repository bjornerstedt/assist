library(shiny)
library(stringr)
shinyServer(function(input, output) {

  output$text1 <- renderText({
    if (input$submit > 0) {
      command <<- str_c("plot(", input$data_frame, ", ", input$varname1,")")
      message(command)
      stopApp()
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
})
