##########################################
##                                      ##
##  Explore baby girl names             ##
##  Author: gaskyk                      ##
##  Date: 30-Apr-20                     ##
##                                      ##
##########################################

# Required packages
library(shiny)
library(tidyverse)

# Define server logic required to show a table
shinyServer(function(input, output) {
    
    # Read in baby girl name data
    # 2018 data currently used
    # Source: https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/livebirths/datasets/babynamesenglandandwalesbabynamesstatisticsgirls
    names <- readr::read_csv("babygirlnames2018.csv")
    
    # Create column for initial
    names <- names %>%
        mutate(Initial = stringr::str_extract(Name, "^.{1}"))
    
    # Keep only top 100 names per initial
    # Often more than 100 are kept if these all have the same count
    top_names <- names %>%
        group_by(Initial) %>%
        top_n(n = 100, wt = -Rank) %>%
        ungroup()
    
    # Return the requested dataset
    output$table <- renderDataTable({
        df <- top_names %>%
            filter(Initial == input$Initial) %>%
            select(Name, Rank, Count)
    })

})
