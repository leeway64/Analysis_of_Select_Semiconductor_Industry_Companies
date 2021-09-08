# Visualizes several statistics of TSMC, Intel, Samsung Electronics, and SMIC.

library(here)
library(rio)
library(purrr)
library(dplyr)
library(ggplot2)


# Imports a data file from the "data" folder
read_data <- function(data_file){
    data <- import_list(here("data", data_file))  # Import all sheets in an Excel spreadsheet
    return(data)
}


# Plots the closing stock price for each week for each company
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
    revenue_data <- read_data("revenue/revenue.xlsx")
    Intel <- revenue_data$Intel
    # Convert millions of USD to thousands of USD
    millions_to_thousands <- Intel$Revenue %>% (function (x) x * 1000)
    dim(millions_to_thousands) <- c(length(Intel$Revenue), 1)
    Intel$Revenue <- unlist(millions_to_thousands)
    
    TSMC <- revenue_data$TSMC
    # Convert millions of New Taiwan dollars to thousands of US dollars
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
            labs(title='Revenue vs. date', x='Date', y='Revenue (USD, \'000)'))
}


# Plots the gross profit of the companies
plot_profit <- function(){
    profit_data <- read_data("profit/profit.xlsx")
    
    Intel <- profit_data$Intel
    # Convert millions of USD to thousands of USD
    millions_to_thousands <- Intel$Gross_profit %>% (function (x) x * 1000)
    dim(millions_to_thousands) <- c(length(Intel$Gross_profit), 1)
    Intel$Gross_profit <- unlist(millions_to_thousands)
    
    TSMC <- profit_data$TSMC
    # Convert millions of New Taiwan dollars to thousands of US dollars
    NTD_to_USD <- Map({function (x) x*0.036*1000}, TSMC$Gross_profit)
    dim(NTD_to_USD) <- c(length(TSMC$Gross_profit), 1)
    NTD_to_USD <- unlist(NTD_to_USD)
    TSMC$Gross_profit <- NTD_to_USD
    
    Samsung <- profit_data$Samsung
    SMIC <- profit_data$SMIC
    
    dev.new()
    print(ggplot()+
              geom_line(aes(x=Intel$Year, y=Intel$Gross_profit, color='Intel'))+
              geom_line(aes(x=TSMC$Year, y=TSMC$Gross_profit, color='TSMC'))+
              geom_line(aes(x=Samsung$Year, y=Samsung$Gross_profit, color='Samsung'))+
              geom_line(aes(x=SMIC$Year, y=SMIC$Gross_profit, color='SMIC'))+
              labs(title='Gross profit vs. date', x='Date', y='Gross profit (USD, \'000)'))
}


# Plots R & D spending of the 4 companies
plot_RD_spending <- function(){
    RD_spending_data <- read_data()
}


plot_capital_expenditures <- function(){
    
}


main <- function(){
    plot_stock_price()
    plot_revenue()
    plot_profit()
    plot_RD_spending()
    plot_capital_expenditures()
}


main()
