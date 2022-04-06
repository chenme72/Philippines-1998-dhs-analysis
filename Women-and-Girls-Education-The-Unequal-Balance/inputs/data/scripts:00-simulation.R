n <- 25796
set.seed(03)
x_age_group <- sample(1:13 ,size = n,replace = TRUE, prob = c(1/13,1/13,1/13,1/13,1/13,1/13,1/13,1/13,1/13,1/13,1/13,1/13,1/13))

n <-  25796
set.seed(03)
x_residence <- sample(1:2,size = n,replace = TRUE, prob = c(1/2,1/2))

a <- data.frame(x_residence) %>%
  mutate(x_residence = case_when(
    x_residence == 1 ~ "Urban",
    x_residence == 2 ~ "Rural"
  ))


n <-  25796
set.seed(03)
x_region <- sample(1:16,size = n,replace = TRUE, prob = c(1/16,1/16,1/16,1/16,1/16,1/16,1/16,1/16,1/16,1/16,1/16,1/16,1/16,1/16,1/16,1/16))


n <-  25796
set.seed(03)
x_education_level <- sample(1:5,size = n,replace = TRUE, prob = c(0.25,0.25,0.25,0.25,0))

#generate the dataset for the simulation data 
df_simulation <- data.frame(Education = x_education_level, Age_group = x_age_group, Residence = x_residence, Region = x_region)
#clean the simulation dataset
#clean the education level variable
df_simulation_clean <- df_simulation
df_simulation_clean$Education[df_simulation$Education == '1'] <- 'None'
df_simulation_clean$Education[df_simulation$Education == '2'] <- 'Elementary'
df_simulation_clean$Education[df_simulation$Education == '3'] <- 'High School'
df_simulation_clean$Education[df_simulation$Education == '4'] <- 'College/higher'
df_simulation_clean$Education[df_simulation$Education == '5'] <- 'Missing'

#clean the age group variable
df_simulation_clean$Age_group[df_simulation$Age_group == '1'] <- '6-9'
df_simulation_clean$Age_group[df_simulation$Age_group == '2'] <- '10-14'
df_simulation_clean$Age_group[df_simulation$Age_group == '3'] <- '15-19'
df_simulation_clean$Age_group[df_simulation$Age_group == '4'] <- '20-24'
df_simulation_clean$Age_group[df_simulation$Age_group == '5'] <- '25-29'
df_simulation_clean$Age_group[df_simulation$Age_group == '6'] <- '30-34'
df_simulation_clean$Age_group[df_simulation$Age_group == '7'] <- '35-39'
df_simulation_clean$Age_group[df_simulation$Age_group == '8'] <- '40-44'
df_simulation_clean$Age_group[df_simulation$Age_group == '9'] <- '45-49'
df_simulation_clean$Age_group[df_simulation$Age_group == '10'] <- '50-54'
df_simulation_clean$Age_group[df_simulation$Age_group == '11'] <- '55-59'
df_simulation_clean$Age_group[df_simulation$Age_group == '12'] <- '60-64'
df_simulation_clean$Age_group[df_simulation$Age_group == '13'] <- '65+'

#clean the residence variable
df_simulation_clean$Residence[df_simulation$Residence == '1'] <- 'Urban'
df_simulation_clean$Residence[df_simulation$Residence == '2'] <- 'Rural'

#clean the region variable
df_simulation_clean$Region[df_simulation$Region == '1'] <- 'MM'
df_simulation_clean$Region[df_simulation$Region == '2'] <- 'CA'
df_simulation_clean$Region[df_simulation$Region == '3'] <- 'Ilocos'
df_simulation_clean$Region[df_simulation$Region == '4'] <- 'CV'
df_simulation_clean$Region[df_simulation$Region == '5'] <- 'CL'
df_simulation_clean$Region[df_simulation$Region == '6'] <- 'ST'
df_simulation_clean$Region[df_simulation$Region == '7'] <- 'Bicol'
df_simulation_clean$Region[df_simulation$Region == '8'] <- 'WV'
df_simulation_clean$Region[df_simulation$Region == '9'] <- 'CV'
df_simulation_clean$Region[df_simulation$Region == '10'] <- 'EV'
df_simulation_clean$Region[df_simulation$Region == '11'] <- 'WM'
df_simulation_clean$Region[df_simulation$Region == '12'] <- 'NM'
df_simulation_clean$Region[df_simulation$Region == '13'] <- 'SM'
df_simulation_clean$Region[df_simulation$Region == '14'] <- 'CM'
df_simulation_clean$Region[df_simulation$Region == '15'] <- 'ARMM'
df_simulation_clean$Region[df_simulation$Region == '16'] <- 'Caraga'

