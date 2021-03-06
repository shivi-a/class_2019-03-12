library(tidyverse)
library(gt)
library(janitor)

orig <- read_csv(file = "https://pollofpolls.eu/get/polls/ES-parliament/format/csv") %>% 
  clean_names() %>% 
  gather(pp, psoe, bng, cc, erc, pnveaj, cs, vox, podemos, eh_bildu, pacma, p_de_cat, key = "party", value = "vote")

good_firms <- orig %>% 
  group_by(firm) %>% 
  summarize(number = n()) %>% 
  filter(number >= 40) %>% 
  pull(firm)

orig %>%
  filter(Sys.Date() - date < 365) %>% 
  filter(firm %in% good_firms) %>% 
  ggplot(aes(x = date, y = vote, color = party)) + 
  geom_smooth()