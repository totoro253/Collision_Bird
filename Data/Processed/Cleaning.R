library(janitor)
library(dplyr)
library(tidyverse)
library(psych)
library(jmv)
library(heatmaply)

bird_collisions <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-30/bird_collisions.csv")
mp_light <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-30/mp_light.csv")

bird_collisions <- bird_collisions %>% janitor::clean_names()
mp_light<- mp_light %>% janitor::clean_names()

names(bird_collisions)
names(mp_light)

genus <- table (bird_collisions$genus)
species <-table (bird_collisions$species)
dates <- table (bird_collisions$date)
locality <- table (bird_collisions$locality)
familyb <- table (bird_collisions$family)
flight_call <- table ( bird_collisions$flight_call)
habitat <-table  (bird_collisions$habitat)
stratum <- table (bird_collisions$stratum)

barplot(genus)
barplot(species)
barplot()


describe(bird_collisions[1:8])
describe(mp_light[1:2])

skim(genus)         #summary data
table(genus)        #table of all genus

bird_collisions %>% count(bird_collisions$flight_call)  #overview count birds do use flight call
bird_collisions %>% count(bird_collisions$genus)
bird_collisions %>% count(bird_collisions$species)

skim(bird_collisions)
colSums(is.na(bird_collisions))  #checking NA'S

df_flightSpecies <- data.frame(flight_call,species)