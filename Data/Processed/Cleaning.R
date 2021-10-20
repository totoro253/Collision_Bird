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

readr::spec(bird_collisions)
readr::spec(mp_light)


bird_collisions <- bird_collisions %>% janitor::clean_names()
mp_light<- mp_light %>% janitor::clean_names()

summary(bird_collisions)
summary(mp_light)

bird_collisions %>% inspectdf::inspect_na()
mp_light %>% inspectdf::inspect_na()

bird_collisions %>% inspectdf::inspect_cat()

names(bird_collisions)
names(mp_light)

genus <-  (bird_collisions$genus)
species <- (bird_collisions$species)
dates <-  (bird_collisions$date)
locality <-  (bird_collisions$locality)
familyb <-  (bird_collisions$family)
flight_call <-  ( bird_collisions$flight_call)
habitat <-  (bird_collisions$habitat)
stratum <-  (bird_collisions$stratum)

describe(bird_collisions[1:8])
describe(mp_light[1:2])

skim(genus)         #summary data
table(genus)        #table of all genus

bird_collisions %>% count(bird_collisions$flight_call)  #overview count birds do use flight call
bird_collisions %>% count(bird_collisions$genus)
bird_collisions %>% count(bird_collisions$species)


skim(bird_collisions)
colSums(is.na(bird_collisions))  #checking NA'S

#Use table to  barplot
t_stratum <- table  (bird_collisions$stratum)
t_speciesFlight <- table (bird_collisions$species,bird_collisions$flight_call)



df_speciesFlight <- data.frame(species,flight_call)
cat_speciesFlight <- df_speciesFlight %>% inspectdf::inspect_cat()
cat_speciesFlight$levels$Var1

#Exploring which species using flight calls
t_speciesFlight <- table (bird_collisions$species,bird_collisions$flight_call)
barplot(t_speciesFlight)
heatmap(t_speciesFlight)
heatmap(t_speciesFlight)

specflight <- data.matrix(t_speciesFlight, rownames.force = TRUE)
heatmap(specflight, col=blues9,main = "Species and flight calls behaviour" )

ggplot(mp_light, aes(x=mp_light$date,color=mp_light$light_score)) + geom_density() #Density of light score compared to date
ggplot(bird_collisions, aes(x=bird_collisions$date,color=bird_collisions$flight_call)) + geom_density() # Density flight call compared to date

#Plot used to get a closer look comparing species with date
date_species <- ggplot(bird_collisions, aes(x=dates, y=species)) + geom_point(shape=2)
date_species

date_species_line <- ggplot(bird_collisions, aes(x=dates, y=species)) + geom_line(shape=1)
date_species_line


#ERROR -inf/NaN
describe(bird_collisions[1:8])
describe(mp_light[1:2])




