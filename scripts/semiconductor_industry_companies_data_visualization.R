# Visualizes several statistics of TSMC, Intel, Samsung Electronics, and SMIC.

library(here)
library(rio)
library(dplyr)
library(ggplot2)


read_data <- function(data_file){
    data <- import_list(here("data", data_file))
    return(data)
}


plot_stock_price <- function(){
    
}


plot_revenue <- function(){
    revenue_data = read_data("revenue/revenue.xlsx")
    Intel <- revenue_data$Intel
    TSMC <- revenue_data$TSMC
    Samsung <- revenue_data$Samsung
    SMIC <- revenue_data$SMIC
    
    dev.new()
    print(ggplot()+
        geom_line(aes(x=Intel$Year, y=Intel$Revenue), color='blue')+
            geom_line(aes(x=TSMC$Year, y=TSMC$Revenue), color='red')+
            geom_line(aes(x=Samsung$Year, y=Samsung$Revenue), color='grey')+
            geom_line(aes(x=SMIC$Year, y=SMIC$Revenue), color='yellow')+
            labs(title='Revenue vs. date', x='Date', y='Revenue (USD)'))
}

plot_revenue()
