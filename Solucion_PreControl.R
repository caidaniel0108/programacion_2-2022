#Nombre: Daniela Ponce

library(readr)
library(dplyr)
df<- read_csv("~/Downloads/owid-covid-data.csv")

#Pregunta 1: 

df1 <- df %>%
  filter((location == 'Chile' |location == 'Brazil' | location == 'United States') &
                (date >= '2019-05-30'))

#Pregunta 2:
df2 <- df1 %>% select(location, date, new_cases, total_cases_per_million)

#Pregunta 3:

df2 %>% group_by(location) %>% 
  summarise(max_new_cases = max(new_cases), 
            max_tota_cases_per_million = max(total_cases_per_million), 
            mean_new_cases = mean(new_cases), 
            mean_total_cases_per_million = mean(total_cases_per_million))
