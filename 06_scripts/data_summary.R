# Introduction
# This file contains some useful functions for summarizing and plotting 
# data for the 2017 Common Garden Manuscript.


# Data Summary:
# The following function creates summary statistics that can be used in 
# tables and plots.  The summary statistic functions can be changed to within 
# this code to whatever summary statistics are desired for the analysis 
# (i.e., median instead of mean, etc.)

# This data_summary function produces mean, min, max, n, variance, and standard error
# for a data column grouped by different variable names. 

# Example:
# daily.sum <- data_summary(Data, varname="temp.C", 
#                          groupnames=c("iButton.site.year", "Date"))

# The function requires the R package 'dplyr'
# Install dplyr in needed using...
#install.packages("dplyr")

# This script loads the library for you.

library(dplyr)

data_summary <- function(data, varname, groupnames){
  require(plyr)
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      minimum = min(x[[col]], na.rm=TRUE),
      maximum = max(x[[col]], na.rm=TRUE),
      n = length(x[[col]]),
      v = var(x[[col]], na.rm = TRUE),
      se = sd(x[[col]])/sqrt(length(x[[col]])), na.rm=TRUE)
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}

