library(tidyverse)
library(gt)
library(janitor)

orig <- read_csv(file = "https://pollofpolls.eu/get/polls/ES-parliament/format/csv") %>% 
  clean_names()

orig %>% 
  
  #filter(date < as.Date("2018-03-12")) %>% 
  
  group_by(firm) %>% 
  
  summarize(numbers = n()) %>% 
  
  ungroup() %>% 
  
  filter(Sys.Date() - date < 365, !is.na(firm), numbers >= 40) %>% 
  
  ggplot(aes(date)) + 
  geom_smooth(aes(y = psoe, colour = "Ekre")) + 
  geom_smooth(aes(y = BNG, colour = "Green")) +
  geom_smooth(aes(y = cc, colour = "I")) + 
  geom_smooth(aes(y = erc, colour = "Centew")) +
  geom_smooth(aes(y = pnveaj, colour = "Reform")) 
  #geom_smooth(aes(y = sde, colour = "SDE")) +
  #geom_smooth(aes(y = eva, colour = "Free")) + 
  #geom_smooth(aes(y = e200, colour = "E200"))

