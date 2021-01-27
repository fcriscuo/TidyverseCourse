library(httr)
library(dplyr)
library(readr)

#Example 1
# username on github for demo
username <- 'janeeverydaydoe/'

#base github endpoint
url_git <- "https://api.github.com/"

#API request
api_response <- GET(url = paste0(url_git,'users/',username, 'repos'))
names(api_response)
# status code for request
api_response$status_code
#extract the content
repo_content <- content(api_response)

# get the URL for each repo
lapply(repo_content, function(x) {
  df <- tibble(repo = x$name,
                   address =x$html_url)
}) %>% 
  bind_rows()

#Example #2  Obtaining a CSV from the Web
# get a CSV file from: https://raw.githubusercontent.com/fivethirtyeight/data/master/steak-survey/steak-risk-survey.csv 
api_response <- GET(url ="https://raw.githubusercontent.com/fivethirtyeight/data/master/steak-survey/steak-risk-survey.csv ")
df_steak <-  content(api_response, type = "text/csv")

# Read the CSV data directly from a URL
df <-  read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/steak-survey/steak-risk-survey.csv ")