library(dplyr)
library(tidyverse)
library(tidytext)
library(readr)
library(rvest)
webpage <- read_html("https://www.serebii.net/pokemon/gen1pokemon.shtml") #Read from source
tbls <- html_nodes(webpage,"table") #Assign nodes for tables in html
tbls1 <- tbls %>% html_table(fill = TRUE) #Convert nodes to tables
pokedex <- na.omit(tbls1 [[1]])  #Choose correct table
pokedex <- subset(pokedex,select=-c(X2,X3,X5)) #Remove empty columns
names(pokedex) <- c("No.","Name","Abilities","HP","Att","Def","S.Att","S.Def","Spd") #Correct column names
pokedex[4:8] <- sapply(pokedex[4:8],as.numeric) #Convert character to numeric
glimpse(pokedex)

head(pokedex[order(pokedex$HP,decreasing=TRUE),],1) #Pokemon with highest HP

pokedex <- mutate(pokedex,Agg=rowSums(pokedex[4:9]))
head(pokedex[order(pokedex$Agg,decreasing=TRUE),],1) #Pokemon with highest Agg