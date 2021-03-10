library(dplyr)
library(tidyverse)
library(tidytext)
library(readr)
library(rvest)
webpage <- read_html("https://en.wikipedia.org/wiki/List_of_Pok%C3%A9mon")
tbls <- html_nodes(webpage,"table")
tbls1 <- tbls %>% html_table(fill = TRUE)
pokedex <- tbls1[[3]]
pokedex <- pokedex[-1,]
pokedex1 <- paste(pokedex$`Generation I`,pokedex$`Generation II`)

