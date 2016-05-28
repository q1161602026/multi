attach(student)
shinyServer(function(input, output){
  output$mytable1 <- DT::renderDataTable({
    DT::datatable(options = list(lengthMenu=c(20,50,100),
      pageLength = 20),student[, input$show_vars, drop = T])
  })
}
)
