# Visualizes several statistics of TSMC, Intel, Samsung Electronics, and SMIC.

library(here)
library(rio)
library(purrr)
library(dplyr)
library(ggplot2)


read_data <- function(data_file){
    data <- import_list(here("data", data_file))  # Import all sheets in an Excel spreadsheet
    return(data)
}


plot_stock_price <- function(){
    path <- "stock_price/"
    Intel <- read_data(paste(path, "INTC.xlsx", sep=""))$INTC
    TSMC <- read_data(paste(path, "TSM.xlsx", sep=""))$TSM
    
    Samsung <- read_data(paste(path, "005930.KS.xlsx", sep=""))$"005930.KS"
    
    
    SMIC <- read_data(paste(path, "0981.HK.xlsx", sep=""))$"0981.HK"
    
    dev.new()
    print(ggplot()+
              geom_line(aes(x=Intel$Date, y=Intel$Close), color="blue")+
              geom_line(aes(x=TSMC$Date, y=TSMC$Close), color="red")+
              geom_line(aes(x=Samsung$Date, y=Samsung$Close), color="orange")+
              geom_line(aes(x=SMIC$Date, y=SMIC$Close), color="yellow")+
              labs(title='Stock price vs. date', x='Date', y='Stock price (USD)'))
}


plot_revenue <- function(){
    revenue_data = read_data("revenue/revenue.xlsx")
    Intel <- revenue_data$Intel
    
    TSMC <- revenue_data$TSMC
    # Convert New Taiwan dollars to US dollars
    NTD_to_USD <- Map({function (x) x*0.036*1000000/1000}, TSMC$Revenue)
    dim(NTD_to_USD) <- c(length(TSMC$Revenue), 1)
    NTD_to_USD <- unlist(NTD_to_USD)
    TSMC$Revenue <- NTD_to_USD

    Samsung <- revenue_data$Samsung
    SMIC <- revenue_data$SMIC
    
    dev.new()
    print(ggplot()+
            geom_line(aes(x=Intel$Year, y=Intel$Revenue), color='blue')+
            geom_line(aes(x=TSMC$Year, y=TSMC$Revenue), color='red')+
            geom_line(aes(x=Samsung$Year, y=Samsung$Revenue), color='orange')+
            geom_line(aes(x=SMIC$Year, y=SMIC$Revenue), color='yellow')+
            labs(title='Revenue vs. date', x='Date', y='Revenue (USD)'))
}

plot_revenue()
plot_stock_price()
