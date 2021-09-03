# Visualizes several statistics of TSMC, Intel, Samsung Electronics, and SMIC.

library(here)
library(rio)
library(dplyr)
library(ggplot2)


read_data <- function(data_file){
    data <- import(here("data", data_file))
    return(data)
}


plot_stock_price <- function(){
    
}

plot_revenue <- function(){
    
}
