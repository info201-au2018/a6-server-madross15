#!/bin/bash
# --------------------------------------------------------------------------------
# document here the main bash commands you are using for the server access.  The file contains
# two parts: the first one for the commands you run on your laptop, and the second one for the
# commands on the remote server.
# 
# The question lists give your some guidance what to do and report but you are free to do it
# in a different way.  If you use a graphical frontend instead of scp for copying files,
# just say which one in the appropriate place.
#
# Note: this file does not to be runnable
#
# -------------------- local commands --------------------
# 1. create a directory for this project.
mkdir graphs 
# 2. log onto the server
ssh mross15@info201.ischool.uw.edu
# 3. copy the small data subset from the server to your local machine
scp /opt/data/temp_prec_middle_encrypted.csv.bz2 mross15@info201.ischool.uw.edu:
# 4. copy your R-script to the server
scp maps.R mross15@info201.ischool.uw.edu
# 5. (after succesfully running the script remotely): copy the output files back to your computer
map1960_airtemp.jpg
map1960_precipitation.jpg
map1986_airtemp.jpg
map1986_precipitation.jpg
map2014_airtemp.jpg
map2014_precipitation.jpg
# 6. inspect that the copy was successful
ls 

# -------------------- remote commands --------------------
# 1. explore the data directory '/opt/data'.  How do you find out the size of the files?
temp_prec_middle_encrypted.csv.bz2 
# 2. explore the first few lines of the small sample data
temp_data <- data.table::fread('temp_prec_middle_encrypted.csv.bz2', stringsAsFactors = FALSE)
# 3. create a directory for this project
mkdir assignment6
# 4. (after copying your code from the laptop): inspect the files in the project directory
ls - l
# 5. run your script
Rscript maps.R
# 6. How do you install missing R packages?
install.packages("utils")
# 7. (after running the script): inspect the folder for output files
ls