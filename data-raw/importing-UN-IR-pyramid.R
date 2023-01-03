library(tidyverse)

IR_pyramid <- Iran_UN_Prospects_2022 %>%
  pivot_longer(names_to = 'age', values_to = 'value', cols = `40`:`100`) %>%
  mutate(year=Year) %>%
  mutate(sex="both") %>%
  select(`ISO3 Alpha-code`, sex, year, age, value)

write_csv(IR_pyramid, "./data-raw/UN_IR_pyramid_2022.csv")
