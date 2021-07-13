library(janitor)
library(dplyr)
library(tidyverse)
library(psych)

bird_collisions <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-30/bird_collisions.csv")
mp_light <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-30/mp_light.csv")

bird_collisions <- bird_collisions %>% janitor::clean_names()
mp_light<- mp_light %>% janitor::clean_names()

names(bird_collisions)
names(mp_light)

genus <- bird_collisions$genus
species <- bird_collisions$species
dates <- bird_collisions$date
locality <- bird_collisions$locality
familyb <- bird_collisions$family
flight_call <- bird_collisions$flight_call
habitat <- bird_collisions$habitat
stratum <- bird_collisions$stratum

describe(bird_collisions[1:8])
describe(mp_light[1:2])