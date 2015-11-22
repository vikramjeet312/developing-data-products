library(shiny)
library(dplyr)
library(ggplot2)
shinyServer(function(input,output){
  whos<- read.csv("data/whoScored2014.csv")
  whos2014<- arrange(whos,Position)
  whosN<- whos2014[,-1]
    output$histPlot<- renderPlot({
      #qplot(whosN[c(1:as.numeric(input$teams)),c(as.numeric(input$column))] , border='white',xlab =names(whosN)[c(as.numeric(input$column))],breaks = as.numeric(input$teams) ,main = "Histogram of top teams' stats")
      #qplot(whos[c(1:as.numeric(input$teams)),c(as.numeric(input$colum))])
#       qplot(whos2014[c(1:input$teams),as.numeric(input$column)+1], fill= whos2014[c(1:input$teams), 1], binwidth=2, xlab=names(whosN)[as.numeric(input$column)],)
      ggplot(data = whos2014[1:as.numeric(input$teams),], aes_string(names(whosN)[as.numeric(input$column)] , fill="Team"))+geom_histogram(binwidth=2)
      
      
      
    })
#     output$vsPlot<- renderPlot({
#       plot(whosN[c(1:as.numeric(input$teams)), c(as.numeric(input$column))], whosN[c(1:as.numeric(input$teams))]$Position,ylab =names(whosN)[c(as.numeric(input$column))], xlab="Position", axes = F)
#       axis(side = 1, at = c(1:as.numeric(input$teams)))
#       axis(side = 2, at = seq(from = min(whosN[c(1:as.numeric(input$teams)), c(as.numeric(input$column))]),to = max(whosN[c(1:as.numeric(input$teams)), c(as.numeric(input$column))]),length.out = length(c(1:as.numeric(input$teams)))))
#       text(whosN[c(1:as.numeric(input$teams))-10, c(as.numeric(input$column))], whosN[c(1:as.numeric(input$teams))]$Position, whos2014[c(1:as.numeric(input$teams)),]$Team, ylab =names(whosN)[c(as.numeric(input$column))], xlab="Position")
#     })
#       output$vsPlot<- renderPlot({
#         g<-ggplot(whos2014[c(1:input$teams),], aes(Position, names(whos2014)[as.numeric(input$column)]))+geom_point()+geom_text(data = whos2014[c(1:input$teams),],aes(Position, names(whos2014)[as.numeric(input$column)], label= whos2014[c(1:input$teams),1]), )+geom_smooth()+geom_vline(xintercept=5)
#         g
#       })

      output$vsPlot<- renderPlot({
        ggplot(whos2014[1:as.numeric(input$teams),], aes_string("Position",names(whos2014)[as.numeric(input$column)+1], label=whos2014[1:as.numeric(input$teams),1] ))+geom_point()+geom_text(label=whos2014[1:as.numeric(input$teams),1], vjust=rep(jitter(1),times = as.numeric(input$teams)))+geom_smooth()+geom_vline(xintercept=as.numeric(input$teams)+1)
      })
})