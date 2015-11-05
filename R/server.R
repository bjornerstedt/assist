library(shiny)
library(stringr)
shinyServer(function(input, output) {
  datasetInput <- reactive({
    input$menu_choice
  })
  observeEvent(input$submit,{
    if (input$submit > 0) {
      if(input$varname != '')
        outstr <- paste(input$varname, ' <- describe(')
      else
        outstr <- 'describe('
      command <<- str_c(outstr, input$data_frame, ", ", paste(input$varname1, collapse = ', '), ")")
      stopApp()
      message("\nExecuted command:\n",command,"\n")
    }
  })
  observeEvent(input$cancel,{
      command <<- ''
      stopApp()
  })
  output$text1 <- renderText({
    # if (input$submit > 0) {
    #   if(input$varname != '')
    #     outstr <- paste(input$varname, ' <- describe(')
    #   else
    #     outstr <- 'describe('
    #   command <<- str_c(outstr, input$data_frame, ", ", paste(input$varname1, collapse = ', '), ")")
    #   stopApp()
    #   message(command)
    # }
    # test <<- input$id
    paste("You have selected", datasetInput())
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
