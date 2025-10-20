library(tidyverse)

file1 <- read_csv("/Users/cmdb/qb25-answers/week4 /aau1043_dnm.csv")
pages <- read_csv("/Users/cmdb/qb25-answers/week4 /aau1043_parental_age.csv")


file1_counts <- file1 %>%
  filter(!is.na(Phase_combined)) %>% 
  group_by(Proband_id, Phase_combined) %>%
  summarise(count = n(), .groups = "drop") %>%
  pivot_wider(names_from = Phase_combined, 
              values_from = count, 
              values_fill= 0)
print(file1_counts)


mergedata <- left_join(file1_counts, pages, by = "Proband_id")
print(mergedata)

library(ggplot2)

ggplot(mergedata, aes(x = Mother_age, y = mother)) +
  geom_point(alpha = 0.6) +
  labs(
    x = "Maternal_age",
    y = "Maternal" 
  ) 
  
ggplot(mergedata, aes(x = Father_age, y = father)) +
  geom_point(alpha = 0.6) +
  labs(
    x = "Father_age",
    y = "father" 
  ) 

vs <- lm(mother ~ Mother_age, data=mergedata)
summary(vs)


vsf <- lm(father ~ Father_age, data=mergedata)
summary(vsf)

ggplot(mergedata) +
  geom_histogram(aes(x = father, fill = "father"), bins = 30)+
  geom_histogram(aes(x = mother, fill = "mother"), bins = 30)+
  labs(
    x = "DMNs" ,
    y= "frequency"
  )

t_test<- t.test(mergedata$mother, mergedata$father, paired = TRUE)
print(t_test)




#### Load packages -------------------------------------------------------------
install.packages("tidytuesdayR")
library(haven)
library(tidyverse)
library(fs)

tuesdata <- tidytuesdayR::tt_load('2025-04-22')
car_crash <- read.csv("daily_accidents.csv")
summary(tuesdata)
glimpse(tuesdata)


kills <- tuesdata$daily_accidents
library(ggplot2)

colnames(kills)
avg_killed_by_day <- kills %>%
  group_by(date) %>%
  summarise(fatalities_count = mean(n_killed, na.rm =TRUE))
ggplot(kills, aes(x= date, y= fatalities_count))+
  geom_col(fill= "red") +
  labs(
    x = "Day of the week",
    y= "Average people killed"
    
  )


kill<- lm(fatalities_count ~ date, data = kills)
summary(kill)

                   
