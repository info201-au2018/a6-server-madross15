### This is the stump script to read the data and plot the maps
### You have to write the code suggested here.
### Feel free to follow the ideas in a different manner/in a different file.
### However, you have to submit your main code file.
###
### The file must be executable on the server!
### I.e. someone else must be able to just run it with 'Rscript maps.R'
### /on server/ and get the correct output.
## install.packages("dplyr")
## install.packages("ggplot2")
library(dplyr)
library(ggplot2)
## read the data
temp_data <- data.table::fread('temp_prec_middle_encrypted.csv.bz2', stringsAsFactors = FALSE)
temp_data <- decrypt::decryptData(temp_data)
## temp_tiny <- read.csv("temp_prec_tiny.csv.bz2", sep = "", stringsAsFactors = FALSE)
## hint1: figure out the correct format and use the correct function.
##
## hint2: read.table and friends are slow (about 6 min to read data).
## You may use data.table::fread instead (a few seconds)
## data.frame(head(temp_data))

## filter out North American observations
north_america_data <- filter(temp_data, longitude >= 100, latitude <=100)

## delete the original (large data) from R workspace
## this is necessary to conserve memory.
rm(temp_data)

## -------------------- do the following for 1960, 1987, 2014 and temp/precipitation --------------------

## select jpg graphics device

## select the correct year - plot longitude-latitude and color according to the temp/prec variable
## I recommend to use ggplot() but you can use something else too.
## 
## Note: if using ggplot, you may want to add "+ coord_map()" at the end of the plot.  This
## makes the map scale to look better.  You can also pick a particular map projection, look
## the documentation.  (You need 'mapproj' library).
## Warning: map projections may be slow (several minutes per plot).

## close the device
## 1960
data_1960 <- filter(north_america_data, time == "1960-06-01")
jpeg(filename = "map1960_precipitation.jpg", width = 1000, height = 1000)
ggplot(data_1960) + geom_point(mapping = aes(x = longitude, y = latitude, col = precipitation, size = 4)) + labs(title = "Precipiation in June 1960") + coord_map()
dev.off()
jpeg(filename = "map1960_airtemp.jpg", width = 1000, height = 1000)
ggplot(data_1960) + geom_point(mapping = aes(x = longitude, y = latitude, col = airtemp, size = 4)) + labs(title = "Air Temperature in June 1960") + coord_map()
dev.off()

## 1986
data_1986 <- filter(north_america_data, time == "1986-06-01")
jpeg(filename = "map1986_precipitation.jpg", width = 1000, height = 1000)
ggplot(data_1986) + geom_point(mapping = aes(x = longitude, y = latitude, col = precipitation, size = 4)) + labs(title = "Precipitation in June 1986") + coord_map() 
dev.off()
jpeg(filename = "map1986_airtemp.jpg", width = 1000, height = 1000)
ggplot(data_1986) + geom_point(mapping = aes(x = longitude, y = latitude, col = airtemp, size = 4)) + labs(title = "Air Temperature in June 1986") + coord_map()
dev.off()

## 2014
data_2014 <- filter(north_america_data, time == "2014-06-01")
jpeg(filename = "map2014_precipitation.jpg", width = 1000, height = 1000)
ggplot(data_2014) + geom_point(mapping = aes(x = longitude, y = latitude, col = precipitation, size = 4)) + labs(title = "Precipitation in June 2014") + coord_map() 
dev.off()
jpeg(filename = "map2014_airtemp.jpg", width = 1000, height = 1000)
ggplot(data_2014) + geom_point(mapping = aes(x = longitude, y = latitude, col = airtemp, size = 4)) + labs(title = "Air Temperature in June 2014") + coord_map() 
dev.off()
## -------------------- you are done.  congrats :-) --------------------
