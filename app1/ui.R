attach(student)
shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
     checkboxGroupInput('show_vars', 'Columns to show:',
                           names(student), selected = names(student)[-3:-29])
      ),
    mainPanel(DT::dataTableOutput('mytable1'))
  )
)
)
