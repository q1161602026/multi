library(gmodels)
path<-getwd()
student=read.csv("student.csv",header=TRUE,stringsAsFactors=T,colClasses ="factor")
student=student[-1]
student$absences<-as.numeric(student$absences)
student$G1<-as.numeric(student$G1)
student$G2<-as.numeric(student$G2)
student$G3<-as.numeric(student$G3)
