getwd()
#install the necessary packages
install.packages(c("tidyverse", "viridis","gridExtra","modelr","broom", "ggrepel"))
library(tidyverse)
library(viridis)
library(gridExtra)
library(modelr)
library(broom)
library(ggrepel)
library(dplyr)

#read the necessary datas
#Read all the historical match data ranging from 1872 to 2018
allmatches <- read.csv("results.csv") %>% mutate(Year = as.character(allmatches$date, format = "%Y"))
allmatches$Year <- substring(allmatches$Year, 1,4) #only getting the year

#Read the FIFA 2018 World Cup Match Schedule
fifa2018 <- read.csv("fifa-world-cup-2018-TurkeyStandardTime.csv")

#Data Preparation

#Create another dataset from fifa2018 that will predict the outcome
fifa2018Prediction <- fifa2018 
fifa2018Prediction$Date <- as.Date(fifa2018Prediction$Date, format = "%d/%m/%Y %H:%M")
str(fifa2018Prediction)
