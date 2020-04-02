library(tidyverse)
library(ggplot2)
library(dplyr)
#library(tidycensus)
# Open the file
data_path <- '~/workspaces/nytimes_covid/covid-19-data/'
# Read into the dataframe
covid_data <- read.csv(paste(data_path,'us-states.csv', sep='',collapse = NULL))
# Get all the Virginia data

va_data <- covid_data %>% filter(state == 'Virginia') %>% mutate (new_cases = cases- lag(cases,n=1,0,order_by = date))
va_data
va_data %>%  ggplot(aes(date,new_cases)) +
  geom_bar( stat = 'identity',position = 'dodge') 