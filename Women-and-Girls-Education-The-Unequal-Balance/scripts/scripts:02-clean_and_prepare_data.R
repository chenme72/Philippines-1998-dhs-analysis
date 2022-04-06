data_with_age <- just_page_i_no_header_no_footer[2:14]
data_with_residence <- just_page_i_no_header_no_footer[16:17]
data_with_region <- just_page_i_no_header_no_footer[19:35]


demography_data_age <- tibble(all = data_with_age) %>% 
  mutate(all = str_replace(all, "1120.0", "100.0")) %>%
  mutate(all = str_squish(all)) %>% separate(col = all,
                                             into = c("background", "none", "elementary", "high_school", "college", "missing", "total", "females","med_yrs"),
                                             sep = " ", 
                                             remove = TRUE,
                                             fill = "right",
                                             extra = "drop") 

demography_data_residence <- tibble(all = data_with_residence) %>% 
  mutate(all = str_squish(all)) %>% separate(col = all,
                                             into = c("background",
                                                                "none", "elementary", 
                                                                "high_school", "college",
                                                                "missing", "total", "females",
                                                                "med_yrs"),
                                             sep = " ", remove = TRUE,fill = "right",extra = "drop")

demography_data_region <- tibble(all = data_with_region) %>% 
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
  mutate(all = str_squish(all)) %>% separate(col = all,
                                             into = c("background", "none", "elementary", "high_school", "college", "missing", "total", "females","med_yrs"),
                                             sep = " ", 
                                             remove = TRUE,
                                             fill = "right",
                                             extra = "drop") 

# data cleaning
demography_data_age<- demography_data_age %>%
  filter(!is.na(background) & !is.na( none) & !is.na( high_school) & !is.na(college) & !is.na(missing)& !is.na(total)  & !is.na( females) & !is.na(med_yrs)) %>% 
  mutate_all(~str_remove_all(.,",")) %>% 
  mutate(char = "age") %>%
  select("background", "none", "elementary", "high_school", "college", "missing", "total", "females","med_yrs","char") 


demography_data_residence <- demography_data_residence %>%
  filter(!is.na(background) & !is.na( none)  & !is.na( high_school) & !is.na(college) & !is.na(missing)& !is.na(total)  & !is.na( females) & !is.na(med_yrs)) %>% 
  mutate_all(~str_remove_all(.,",")) %>%
  mutate(char = "residence") %>%
  select("background", "none", "elementary", "high_school", "college", "missing", "total", "females","med_yrs","char") 


demography_data_region <- demography_data_region %>%
  filter(!is.na(background) & !is.na( none)  & !is.na( high_school) & !is.na(college) & !is.na(missing)& !is.na(total)  & !is.na( females) & !is.na(med_yrs)) %>% 
  mutate_all(~str_remove_all(.,",")) %>% 
  mutate(char = "region") %>%
  select("background", "none", "elementary", "high_school", "college", "missing", "total", "females","med_yrs","char") 

clean <-rbind(demography_data_age,demography_data_residence,demography_data_region)


agent <-
  create_agent(tbl = clean) %>%
  col_is_character(columns = vars(background, character)) %>%
  col_is_numeric(columns = vars(none, elementary, high_school, college, missing, total, females,med_yrs)) %>% interrogate()

#agent
# By removing #, you are able to see the results of pointblank. 

write_csv(clean, "cleaned_data.csv")

