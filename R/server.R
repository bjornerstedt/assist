library(shiny)
library(stringr)
shinyServer(function(input, output) {
  datasetInput <- reactive({
    input$menu_choice
  })

  observeEvent(input$submit,{
    if (input$submit > 0) {
      cmd <- 'describe'
      command <<- str_c(cmd, "(", paste(input$data_frame, input$varname1, collapse = ', '), ")")
      if(input$varname != '')
        command <<- str_c(input$varname, ' <- ', command, "\n", input$varname)
      stopApp()
      message("\nCommand(s) executed:\n",command,"\n")
    }
  })

  observeEvent(input$cancel,{
      command <<- ''
      stopApp()
  })

  output$text1 <- renderText({
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

  output$contents <- renderTable({

    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.

    inFile <- input$file1

    if (is.null(inFile))
      return(NULL)

    read.csv(inFile$datapath, header=input$header, sep=input$sep,
             quote=input$quote)
  })
})
