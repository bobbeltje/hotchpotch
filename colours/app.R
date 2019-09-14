
library(shiny)

f <- function(x){
  x <- as.hexmode(x)
  if (nchar(x) == 1){
    x <- paste0('0', x)
  }
  return(x)
}

ui <- fluidPage(
  column(
    width=3L,
    htmlOutput('c1_out'),
    sliderInput('c1_r', 'red', min=0, max=255, value=0, ticks=F),
    sliderInput('c1_g', 'green', min=0, max=255, value=0, ticks=F),
    sliderInput('c1_b', 'blue', min=0, max=255, value=0, ticks=F),
    sliderInput('c1_a', 'alpha', min=0, max=255, value=255, ticks=F)
  ),
  column(
    width=9L,
    plotOutput('myplot', width=1000, height=1000)
  )
)

server <- function(input, output){
  
  output$c1_out <- renderUI({
    HTML(paste0(
      '<h1>',
      paste0('#', f(input$c1_r), f(input$c1_g), f(input$c1_b), f(input$c1_a)), 
      '</h1>'
    ))
  })
  
  output$myplot <- renderPlot({
    col <- paste0('#', f(input$c1_r), f(input$c1_g), f(input$c1_b), f(input$c1_a))
    pie(1, col=col)
  })
}

shinyApp(ui, server)
