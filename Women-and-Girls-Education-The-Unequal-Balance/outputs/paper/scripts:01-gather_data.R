library(janitor)
library(pdftools)
library(purrr)
library(tidyverse)
library(stringi)
library(ggplot2)
library(ggpubr)
library(pointblank)

library(leaflet)
library(tidyverse)
library(ggmap)
library(leaflet.extras)
library(htmltools)
library(maps)
library(mapproj)
library(mapdata)

setwd("/Users/meixuanchen/Desktop")
all_content <- pdf_text("FR103.pdf")
just_page_i <- stri_split_lines(all_content[[38]])[[1]]

just_page_i <- just_page_i[just_page_i != ""]  # Here we delete the empty lines

just_page_i_no_header <- just_page_i[9:length(just_page_i)]
just_page_i_no_header_no_footer <- just_page_i_no_header[1:35]

data <- tibble(all = just_page_i_no_header_no_footer)
data <- data %>% 
  mutate(all = str_squish(all)) %>% 
  mutate(all = str_replace(all, "Age1", "Age")) %>%
  mutate(all = str_replace(all, "1120.0", "100.0")) %>%
  mutate(all = str_replace(all, "Metro Manila", "Metro_Manila")) %>%
  mutate(all = str_replace(all, "Cordillera Admin", "Cordillera_Admin")) %>%
  mutate(all = str_replace(all, "Cagayan Valley", "Cagayan_Valley")) %>%
  mutate(all = str_replace(all, "C. Luzon", "C_Luzon")) %>%
  mutate(all = str_replace(all, "S. Tagalog", "S_Tagalog")) %>%
  mutate(all = str_replace(all, "W. Visayas", "W_Visayas")) %>%
  mutate(all = str_replace(all, "C. Visayas", "C_Visayas")) %>%
  mutate(all = str_replace(all, "E. Visayas", "E_Visayas")) %>%
  mutate(all = str_replace(all, "W. Mindanao", "W_Mindanao")) %>%
  mutate(all = str_replace(all, "N. Mindanao", "N_Mindanao")) %>%
  mutate(all = str_replace(all, "S. Mindanao", "S_Mindanao")) %>% 
  mutate(all = str_replace(all, "C. Miedanan", "C_Mindanao")) %>%
  mutate(all = str_replace(all, "25r796", "25,796")) %>%
  mutate(all = str_replace(all, "4,5", "4.5")) %>%
  mutate(all = str_replace(all, "54,1", "54.1")) %>%
  mutate(all = str_replace(all, "23,9", "23.9")) %>%
  mutate(all = str_replace(all, "17,4", "17.4")) %>%
  mutate(all = str_replace(all, "0,1", "0.1")) %>%
  mutate(all = str_replace(all, "100,0", "100.0")) %>%
  mutate(all = str_replace(all, "5,6", "5.6")) %>%
  separate(col = all,
           into = c("background", "none", "elementary", "high_school", "college", "missing", "total", "females","med_yrs"),
           sep = " ", 
           remove = TRUE,
           fill = "right",
           extra = "drop")

write_csv(data, 'outputs/data/raw_data.csv') 


