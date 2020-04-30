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

# Define UI for application that shows a table
shinyUI(fluidPage(

    # Application title
    titlePanel("Baby girl names"),

        # Sidebar panel for input initial
        sidebarPanel(
            
            # Input: Selector for choosing initial
            selectInput("Initial",
                        label = "Choose an initial:",
                        choices = LETTERS)
            ),

        # Main panel for displaying outputs
        mainPanel(
            
            # Output: HTML table with requested number of observations
            dataTableOutput("table")
    )
))
