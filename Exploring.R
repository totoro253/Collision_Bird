library(janitor)
library(dplyr)
library(tidyverse)
library(psych)
library(jmv)
library(heatmaply)
library(inspectdf)
library(tibble)

bird_collisions <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-30/bird_collisions.csv")
mp_light <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-30/mp_light.csv")

glimpse(bird_collisions)

ggplot(bird_collisions,aes(bird_collisions$locality,fill=bird_collisions$species))+
  theme_bw()+
  geom_bar()+
  labs(x="Locality",
       y="Species",
       title="Species based on locality")