library(shiny)

shinyUI(pageWithSidebar(
  
  ##application title
  headerPanel("GDP Growth (%), current members of the EU"),
  
  ##sidebar with controls to select a year
  sidebarPanel(
    h5('Select year in the slider to see countries colored by gdp growth. Go over each country to see the gdp growth number for that year.'),
    sliderInput("year", "Year", min = 1990, max = 2013, value = 2013),
    h2("............................................"),
    h5('The difference between the countries with the highest and lowest growth was'),
    verbatimTextOutput("diff"),
    h5('Source: World Bank Statistics (WDI R package)'),
    h5('View code at https://github.com/josebescos/devdataprods')),
   
  ##plot a geochart with the countries coloured according to their gdp growth
  mainPanel(
    h3(textOutput("year")), 
    htmlOutput("gvis")

  )
))