shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(width=3,
                 conditionalPanel(condition='input.dataset === "图"',
                                  radioButtons(inputId = "plotk",
                                               label = "",choices=c("条形图"=1,"饼图"=2,"直方图"="3","箱线图"="4"),
                                               selected = 1),
                                  conditionalPanel(condition = "input.plotk == 1||input.plotk == 2",
                                                   selectInput('attsel1',"请选择变量",names(student)[c(-3,-30:-33)]),
                                                   conditionalPanel(condition = "input.plotk == 1",
                                                                   checkboxInput(inputId = "seconddata",label = "变量2",value = FALSE),
                                                                   conditionalPanel(condition = "input.seconddata == true",
                                                                                    uiOutput("secondchoi"),
                                                                                    radioButtons("position","",c("分组条形图"="dodge","堆砌条形图"="stack","棘状条形图"="fill")
                                                                    )
                                                   ))
                                  ),
                                  conditionalPanel(condition = "input.plotk == 3||input.plotk == 4",
                                                   selectInput('attsel4',"请选择变量",names(student)[30:33]),
                                                   checkboxInput(inputId = "seconddata2",label = "变量2",value = FALSE),
                                                   conditionalPanel(condition = "input.seconddata2 == true",
                                                                    uiOutput("secondchoi2")
                                                   ),
                                                   conditionalPanel(condition = "input.plotk == 3",sliderInput("widt","请选择组距",min=1,max=10,value=5))
                                  )
                                  
                 ),
                 conditionalPanel(condition ='input.dataset === "表"',
                                  radioButtons(inputId="tablek",label="",choices=c("频数分布表"=1,"数据透视表"=2),selected = 1),
                                  selectInput('attsel8',"请选择变量",names(student)[c(-3,-30:-33)]),
                                  checkboxInput(inputId = "seconddata4",label = "变量2",value = FALSE),
                                  conditionalPanel(condition = "input.seconddata4 == true",
                                                   uiOutput("secondchoi3")
                                                   )
                 )
    ),
    mainPanel(width=9,
              tabsetPanel(id='dataset',type = "tabs", 
                          tabPanel("图", plotOutput("plot")),
                          tabPanel("表", verbatimTextOutput("table2"))
              )
    )
  )
)
)
