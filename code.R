library("dplyr")

overview <- read.csv("data/overview.csv", header = TRUE, sep = ";", dec = ",")

overview <- overview %>% as_tibble() 

overview %>% select(name, wkn, country, sector)

overview %>% select(name, dy, cydi, month)
