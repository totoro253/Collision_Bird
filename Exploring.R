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

ggplot(bird_collisions,aes(x=bird_collisions$date))+
  geom_density(aes(fill=factor(bird_collisions$flight_call)),alpha=0.5)+
  labs(title="Flight call based on date",
       x="date",
       fill="flightcall")


ggplot(bird_collisions,aes(bird_collisions$date,y=bird_collisions$habitat,color=bird_collisions$species))+
  geom_point()+facet_wrap(~bird_collisions$flight_call)
