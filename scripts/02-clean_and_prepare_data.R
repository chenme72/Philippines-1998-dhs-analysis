# data cleaning
raw_data <- read_csv("raw_data.csv")

df <- raw_data[-1,]
df <- df[-14,]
df <- df[-16,]
clean <- df %>% mutate(character = case_when(background == '6-9' ~ 'age',
                                             background == '10-14' ~ 'age',
                                             background == '15-19' ~ 'age',
                                             background == '20-24' ~ 'age',
                                             background == '25-29' ~ 'age',
                                             background == '30-34' ~ 'age',
                                             background == '35-39' ~ 'age',
                                             background == '40-44' ~ 'age',
                                             background == '45-49' ~ 'age',
                                             background == '50-54' ~ 'age',
                                             background == '55-59' ~ 'age',
                                             background == '60-64' ~ 'age',
                                             background == '65+' ~ 'age',
                                             background == 'Urban' ~ 'residence',
                                             background == 'Rural' ~ 'residence',
                                             background == 'Metro_Manila' ~ 'region',
                                             background == 'Cordillera_Admin' ~ 'region',
                                             background == 'linens' ~ 'region',
                                             background == 'Cagayan_Valley' ~ 'region',
                                             background == 'C_Luzon' ~ 'region',
                                             background == 'S_Tagalog' ~ 'region',
                                             background == 'Bicol' ~ 'region',
                                             background == 'W_Visayas' ~ 'region',
                                             background == 'C_Visayas' ~ 'region',
                                             background == 'E_Visayas' ~ 'region',
                                             background == 'W_Mindanao' ~ 'region',
                                             background == 'N_Mindanao' ~ 'region',
                                             background == 'S_Mindanao' ~ 'region',
                                             background == 'C_Mindanao' ~ 'region',
                                             background == 'ARMM' ~ 'region',
                                             background == 'Caraga' ~ 'region',
                                             background == 'Total' ~ 'total number')) 


# By removing #, you are able to see the results of pointblank. 

write_csv(clean, 'outputs/data/cleaned_data.csv')

# install.packages("pointblank")
library(pointblank)

agent <-
  create_agent(tbl = clean) %>%
  col_is_character(columns = vars(background, character)) %>%
  col_is_numeric(columns = vars(none, elementary, high_school, college_or_higher, dont_know_or_missing, total, number_of_females,median_number_of_years_of_schooling)) %>% interrogate()

agent

