library(tidyverse)
library(gt)
library(janitor)

orig <- read_csv(file = "polls_EE-parliament_2019-03-12.csv") %>% 
  clean_names()

orig %>% 
  ggplot(aes(date)) + 
  geom_smooth(aes(y = ekre, colour = "Ekre")) + 
  geom_smooth(aes(y = green, colour = "Green")) +
  geom_smooth(aes(y = irl, colour = "I")) + 
  geom_smooth(aes(y = kesk, colour = "Centew")) +
  geom_smooth(aes(y = ref, colour = "Reform")) + 
  geom_smooth(aes(y = sde, colour = "SDE")) +
  geom_smooth(aes(y = eva, colour = "???")) + 
  geom_smooth(aes(y = e200, colour = "E200"))
