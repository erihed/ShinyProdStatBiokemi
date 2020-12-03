library(tidyverse)
library(here)
library(ggplot2)
library(dplyr)
library(plotly)
library(lubridate)
library(purrr)
library(extrafont)
library(zoo)
library(forcats)
library(RColorBrewer)
library(readr)
library(shiny)

Biokemi_tot <- read_delim("Data/SQL_BIO_TOT.csv", 
                          ";", escape_double = FALSE, trim_ws = TRUE)

# Create column month to hold labelled months
Biokemi <- Biokemi_tot
Biokemi$ym <- as.yearmon(Biokemi$Godkännandedatum, label = TRUE)

Biokemi$år <- year(Biokemi$Godkännandedatum)

Biokemi$månad <- month(Biokemi$Godkännandedatum)

# ggplot theme
my_theme <- theme(plot.title = element_text(hjust = 0.5),
                  axis.title.x = element_blank(),
                  axis.title.y = element_blank(),
                  plot.subtitle = element_text(hjust = 0.5),
                  text = element_text(size = 12),
                  axis.text.x = element_text(angle = 90))
