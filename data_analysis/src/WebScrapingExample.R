#install.packages("rvest")
library(rvest)
#specify URL
packages <- read_html("http://jhudatascience.org/stable_website/webscrape.html")
packages %>% 
  html_nodes ("strong") %>% 
  html_text()
