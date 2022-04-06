# Women-and-Girls-Education-The-Unequal-Balance

## Education Levels of Girls and Women in Philippines 1998

  - Authors: Dingding Wang, Xueru Ma, and Meixuan Chen
  - Date: April 5th, 2022
  - Email: esther.wang@mail.utoronto.ca, xueru.ma@mail.utoronto.ca, and meixuan.chen@mail.utoronto.ca

## Overview of the paper

This repository discusses poverty and its implications for girl's education in Philippines using data gathered from the 1998 National Demographic and Health Survey (NDHS).

## Repo structure

- 'scripts' includes all the code necessary to simulate data, gather the data and cleaning the data.
- 'inputs' contains the datasheet pdf which gives some information on how the dataset was created, the rmd file used to produce the pdf and the bib file for the references used.
- 'outputs' contains the data folder which includes both the raw and clean dataset obtained.
- 'outputs' also contains the files necessary to reproduce the paper. We have the pdf copy of the paper on 'Women and Girls Education: The Unequal Balance' as well as the rmd file in order to reproduce it and a reference bib file containing the references used for the paper.


## Obtaining data

The 1998 NDHS is publicly available at https://dhsprogram.com/pubs/pdf/FR103/FR103.pdf
  - We gathered data from a table on page 38 in the pdf.
  - The r script '01-gather_data.R' located under the 'scripts' folder contains the code necessary to obtain the data used.
  
## Preprocessing and Cleaning

After obtaining the 'raw data', some cleaning was done. The code used to obtain the clean dataset is located at 'scripts/02-clean_and_prepare_data.R'

Geographics and other aspects such as education are used to predict child care preference. We found that families living in Greater Accra are more likely to send their children to school and the majority of working mothers look after their children by themselves. The analysis of the child care and working mothers data provides insight into current trends and has significant implications for public policy and program decisions."
output:
  bookdown::pdf_document2
  
