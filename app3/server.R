shinyServer(function(input, output) {
  output$deptest<-renderPrint({
      p1<-eval(parse(text=input$attsel1))
      p2<-eval(parse(text=input$attsel2))
      if (input$testk==1){
        dt=CrossTable(p1,p2,prop.r=F,prop.c=F,prop.t=F,prop.chisq=F,chisq=T,dnn=c(input$attsel1,input$attsel2),max.width = 5)
        }

      else{
        dt=CrossTable(p1,p2,prop.r=F,prop.c=F,prop.t=F,prop.chisq=F,fisher=T,dnn=c(input$attsel1,input$attsel2),max.width = 5)
        }
      
})
})
