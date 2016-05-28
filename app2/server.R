shinyServer(function(input, output) {
  output$secondchoi<-renderUI({
    del<-which(names(student)==input$attsel1)
    selectInput('attsel2',"",names(student)[c(-del,-3,-30:-33)])
  })
  output$secondchoi2<-renderUI({
    selectInput('attsel5',"",names(student)[c(-3,-30:-33)])
  })
  output$secondchoi3<-renderUI({
    del2<-which(names(student)==input$attsel8)
    selectInput('attsel9',"",names(student)[c(-del2,-3,-30:-33)])
  }) 
  
   
  output$plot<-renderPlot({
    if (input$plotk==1){
      if (input$seconddata ==T){
        p=ggplot(data=NULL,aes_string(x=input$attsel1,fill=input$attsel2))
        q=p+geom_bar(stat = "count",position = input$position)}
      else {
        p=ggplot(data=NULL,aes_string(x=input$attsel1,fill=input$attsel1))
        q=p+geom_bar(stat = "count")
      }
    }
    
    if (input$plotk ==2){
      p3<-eval(parse(text=input$attsel1))
      a<-table(p3)
      b<-data.frame(a)
      c<-c(b$p3)
      d<-c(b$Freq)
      label=rep(c,d)
      f<-which(!duplicated(label))
      f<-c(f,length(label))
      g<-NULL
      for(i in 1:(length(f)-1)){
        g<-c(g,f[i+1]-f[i])
      }
      g<-g/2+f[-length(f)]
      g<-round(g,0)
      f<-which(!duplicated(label))
      label[g]<-c(paste0(100*round(d/sum(d),3),"%"))
      label[-g]<-""
      val<-rep(1,length(p3))
      value<-p3
      pie <- ggplot(NULL, aes_string(x="1" ,fill=input$attsel1))+geom_bar(width = 3)+ coord_polar("y")+theme(axis.ticks=element_line(size = 0),axis.text=element_blank())+xlab(NULL)+ylab(NULL)
      
      q=pie+geom_text(aes(y=(val/2 + c(0, cumsum(val)[-length(val)])),label=label))
      
    }
    
    if (input$plotk==3){
      if (input$seconddata2 ==T){
        p=ggplot(data=NULL,aes_string(x=input$attsel4,fill=input$attsel5))
        q=p+geom_histogram(binwidth=input$widt,position = "stack")}
      else {
        p=ggplot(data=NULL,aes_string(x=input$attsel4))
        q=p+geom_histogram(binwidth=input$widt)
      }
    }
    
    if (input$plotk==4){
      if (input$seconddata2 ==T){
        p=ggplot(data=NULL,aes_string(x=input$attsel5,y=input$attsel4,colour=input$attsel5))+theme(legend.position='none')
        q=p+geom_boxplot()+geom_jitter(aes_string(y=input$attsel4),size=0.1)}
      
      else {
        p=ggplot(data=NULL,aes_string(x=factor(1),y=input$attsel4,colour=3))+theme(legend.position='none',axis.ticks.x=element_line(size=0),axis.text.x=element_blank())+xlab(NULL)
        q= p+geom_boxplot(width = 0.5)+geom_jitter(size=0.1,width = 0.5)
      }
    }
    q
  })
  
  output$table2<-renderPrint({
    if(input$tablek==1){
      p4<-eval(parse(text=input$attsel8))
      if (input$seconddata4==F){
        CrossTable(p4,prop.r=F, prop.c=F,prop.t=F,prop.chisq=F,dnn=input$attsel8,max.width = 5)}
      else{
        p5<-eval(parse(text=input$attsel9))
        CrossTable(p4,p5,prop.r=F,prop.c=F,prop.t=F,prop.chisq=F,dnn=c(input$attsel8,input$attsel9),max.width = 5)
      }}
    if(input$tablek==2){
      p6<-eval(parse(text=input$attsel8))
      if (input$seconddata4==F){
        newda<-data.frame(aggregate(student[30:33],by=list(p6),FUN=mean))
        colnames(newda)<-c(input$attsel8,names(student)[30:33])}
      else{
        p7<-eval(parse(text=input$attsel9))      
        newda<-data.frame(aggregate(student[30:33],by=list(p6,p7),FUN=mean))
        colnames(newda)<-c(input$attsel8,input$attsel9,names(student)[30:33])
        newda<-newda[order(newda[,1]),]
      }
      print(newda)
    }
  })
})
