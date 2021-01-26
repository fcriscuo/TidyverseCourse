# install.packages("RSQLite)
library(RSQLite)
library(dbplyr)
library(dplyr)


## Specify the drive for SQLite
sqlite <- dbDriver("SQLite")
db <- dbConnect(sqlite, "./data/company.db")

#List tables in database
dbListTables(db)

#Get two tables
albums <-  tbl(db,"albums")
artists <- tbl(db, "artists")

#Inner join on artist id
inner <- inner_join(artists, albums, by = "ArtistId")
as_tibble(inner)

# Left join by artist id 
# artists without albumns will be included
left <- left_join(artists, albums, by ="ArtistId")
as_tibble(left)

# Right join
right <- right_join(artists, albums, by ="ArtistId")
as_tibble(right)

# semi_join(x,y) keeps all obcervations in x with a match in y
semi <- semi_join(artists, albums)

# anti_join keeps observations in x that do NOT have a match in y
anti <- anti_join(artists, albums)

# Example code to connect to a remote mySql database
# Not valid
## This code is an example only
con <- DBI::dbConnect(RMySQL::MySQL(), 
                      host = "database.host.com",
                      user = "janeeverydaydoe",
                      password = rstudioapi::askForPassword("database_password")
)
