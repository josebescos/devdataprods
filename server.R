library(shiny)
library(googleVis)
library(WDI)

##data is taken from the World Bank Statistics package (WDI)
data <- WDI(country = c("AT", "BE", "BG", "HR", "CY", "CZ", "DK", "EE", "FI", "FR", "DE", "GR", "HU", "IE", "IT", "LV", "LT", "LU", "MT", "NL", "PL", "PT", "RO", "SK", "SI", "ES", "SE", "GB"), indicator =  "NY.GDP.MKTP.KD.ZG",
             start = 1990, end = 2013)
names(data)[3] = "GDPgrowth"
data[ ,3] = round(data[ ,3], 2)

##build a function to plot a Googlevis geochart and to find difference between country with highest gdp growth and country with lowest gdp growth
shinyServer(function(input, output) {
  
  output$diff <- renderPrint({max(subset(data, data$year == input$year)[3]) - min(subset(data, data$year == input$year)[3])})
  output$gvis <- renderGvis({
  
    gvisGeoChart(subset(data, data$year == input$year),
               locationvar="country", colorvar="GDPgrowth",
               options=list(region="150", 
                            
                            width=500, height=400,
                            colorAxis="{colors:['#FF0000', '#0000FF']}"
               ))     


  })
})