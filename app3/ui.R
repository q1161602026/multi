shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(width=3,
                 selectInput('attsel1',"请选择变量1",names(student)[c(-3,-30:-33)]),
                 selectInput('attsel2',"请选择变量2",names(student)[c(-3,-30:-33)]),
                 radioButtons("testk","",choices = list("卡方独立检验"=1,"Fisher精确检验"=2))
                 ),
    mainPanel(width=9,
              verbatimTextOutput("deptest")
              )
                )
                  )
      )
