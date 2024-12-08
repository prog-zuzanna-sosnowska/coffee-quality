# pakiet gamlss.dist zawiera rozkład Sinh-arcsinh
if (!require(gamlss.dist)) {
  install.packages("gamlss.dist")
  library(gamlss.dist)
}
# pakiet do budowy interfejsu
if (!require(shiny)) {
  install.packages("shiny")
  library(shiny)
}
# interfejs użytkownika
ui <- fluidPage(
  titlePanel("Sinh-Arcsinh"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("mu",
                   "mu",
                   min = -6,
                   max = 6,
                   value = 0,
                   step = 0.01),
      sliderInput("sigma",
                   "sigma",
                   min = 0.01,
                   max = 6,
                   value = 1,
                   step = 0.01),
      sliderInput("nu",
                   "nu",
                   min = -6,
                   max = 6,
                   value = 0,
                   step = 0.01),
      sliderInput("tau",
                   "tau",
                   min = 0.01,
                   max = 6,
                   value = 1,
                   step = 0.01)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
7
# kod rysujący wykres
server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- seq(-6, 6, length.out = 1000)
    # dSHASHo2 to gęstość rozkładu Sinh-arcsinh
    y <- dSHASHo2(x, mu = input$mu, sigma = input$sigma,
                  nu = input$nu, tau = input$tau)
    y2 <- dnorm(x, mean=input$mu, sd=input$sigma)
    plot(x, y, type="l", lwd=2)
    lines(x, y2, lwd=2, col="red")
  })
}
# uruchomienie aplikacji
shinyApp(ui = ui, server = server)

