library(cluster)
library(datasets)
library(devtools)
library(dplyr)
library(FSelector)
library(ggplot2)
library(knitr)
library(lubridate)
library(magrittr)
library(methods)
library(mice)
library(plyr)
library(randomForest)
library(rattle)
library(reshape)
library(RWeka)
library(stats)
library(tibble)
library(tidyr)
library(tidyverse)

CHD <- "Chicago_collision_data"
LL <- "Light_levels_dryad"

CHD.Species <- Chicago_collision_data$Species
CHD.Genus <- Chicago_collision_data$Genus
CHD.Date <- Chicago_collision_data$Date
CHD.Location <- Chicago_collision_data$Locality

LL.LS <- Light_levels_dryad$Light_Score
LL.Date <- Light_levels_dryad$Light_Score

CHD <- get(CHD)
LL <- get(LL)

dim(CHD) %>% comcat()
nrow(CHD) %>% comcat()
ncol(CHD) %>% comcat()

dim(LL) %>% comcat()
nrow(LL) %>% comcat()
ncol(LL) %>% comcat()

tibble::glimpse(CHD)
tibble::glimpse(LL)

options(tibble.print_min = 2)
CHD
select(CHD,Genus)
#later than 2000
filter(CHD,Date > 2000)

glimpse(CHD)
glimpse(LL)

head(CHD)
tail(CHD)

head(LL)
tail(LL)

dplyr::sample_n(CHD, size = 7)
dplyr::sample_n(LL, size =7)

CHD$Genus %>%
  unique() %>%
  length()

CHD$Species %>%
  unique() %>%
  length()

CHD$Date %>%
  unique() %>%
  length()

CHD$Locality%>%
  unique() %>%
  length()

LL$Date %>%
  unique() %>%
  length()

LL$Light_Score %>%
  unique() %>%
  length()

CHD$Genus %>% as.factor()
CHD$Species %>% as.factor()
CHD$Date %>% as.factor()
CHD$Locality %>% as.factor()

LL$Date %>% as.factor()
LL$Light_Score %>% as.factor()

