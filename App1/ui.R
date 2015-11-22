library(shiny)

shinyUI(fluidPage(
  titlePanel(title = "EPL Stats Season: 2014"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("teams", "Top n-teams", 2,20,1,pre = "Top ", post=" teams"),
      selectInput("column", "Choose a Statistic", choices = c("Shots Per Game"=1,"Possession %"=2, "Pass Success"="", "Aerials Won"=4, "Shots On Target"=5, "Dribbles"=6, "Fouled Per Game"=7, "Shots Conceded"=8, "Tackles"=9, "Interceptions"=10, "Fouls Per Game"=11, "Offsides"=12))
      ),
    mainPanel(plotOutput("histPlot"), plotOutput("vsPlot"))
    )
  
  ))