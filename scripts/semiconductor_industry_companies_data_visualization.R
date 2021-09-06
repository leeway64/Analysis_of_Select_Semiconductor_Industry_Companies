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
    # Convert Korean Republic won to US dollars
    KRW_to_USD <- Map({function (x) x*0.00086}, Samsung$Close)
    dim(KRW_to_USD) <- c(length(Samsung$Close), 1)
    KRW_to_USD <- unlist(KRW_to_USD)
    Samsung$Close <- KRW_to_USD
    
    SMIC <- read_data(paste(path, "0981.HK.xlsx", sep=""))$"0981.HK"
    # Convert Hong Kong dollars to US dollars
    HKD_to_USD <- Map({function (x) x*0.13}, SMIC$Close)
    dim(HKD_to_USD) <- c(length(SMIC$Close), 1)
    SMIC$Close <- unlist(HKD_to_USD)

    dev.new()
    print(ggplot()+
              geom_line(aes(x=Intel$Date, y=Intel$Close, color="Intel"))+
              geom_line(aes(x=TSMC$Date, y=TSMC$Close, color="TSMC"))+
              geom_line(aes(x=Samsung$Date, y=Samsung$Close, color="Samsung"))+
              geom_line(aes(x=SMIC$Date, y=SMIC$Close, color="SMIC"))+
              labs(title='Stock price vs. date', x='Date', y='Stock price (USD)'))
}


plot_revenue <- function(){
    revenue_data = read_data("revenue/revenue.xlsx")
    Intel <- revenue_data$Intel
    # Convert millions of USD to thousands of USD
    millions_to_thousands <- Intel$Revenue %>% (function (x) x * 1000)
    dim(millions_to_thousands) <- c(length(Intel$Revenue), 1)
    Intel$Revenue <- unlist(millions_to_thousands)
    
    TSMC <- revenue_data$TSMC
    # Convert New Taiwan dollars to US dollars
    # TSMC's revenue was originally in millions of NTD, need to convert that to thousands of USD
    NTD_to_USD <- Map({function (x) x*0.036*1000}, TSMC$Revenue)
    dim(NTD_to_USD) <- c(length(TSMC$Revenue), 1)
    NTD_to_USD <- unlist(NTD_to_USD)
    TSMC$Revenue <- NTD_to_USD

    Samsung <- revenue_data$Samsung
    SMIC <- revenue_data$SMIC
    
    dev.new()
    print(ggplot()+
            geom_line(aes(x=Intel$Year, y=Intel$Revenue, color='Intel'))+
            geom_line(aes(x=TSMC$Year, y=TSMC$Revenue, color='TSMC'))+
            geom_line(aes(x=Samsung$Year, y=Samsung$Revenue, color='Samsung'))+
            geom_line(aes(x=SMIC$Year, y=SMIC$Revenue, color='SMIC'))+
            labs(title='Revenue vs. date', x='Date', y='Revenue (USD)'))
}


plot_revenue()
plot_stock_price()
