#install.packages("googledrive")
# load package
library("googledrive")
library(here)
# Files can be found based on file name words like this:
folders <- drive_find(type = "folder" )
# Files that have specific types of visibility can be found like this:
files <- drive_find(q = c("visibility = 'anyoneWithLink'"))
#upload files
drive_upload(here::here("data_analysis/src/SqlLiteDemo.R"))
drive_upload(here::here("data_analysis/data/healthcare-spending.csv"))
#download the csv
drive_download("healthcare-spending.csv", type="csv")
#read in the file
healthcare_spending <- readr::read_csv("healthcare-spending.csv")
drive_trash("healthcare-spending.csv")
drive_empty_trash()