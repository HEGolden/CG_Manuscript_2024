# This R script loads the necessary libraries to run iButtons_CG_TankTemps_Analysis.Rmd

library(lubridate)
library(dplyr)
library(ggplot2)
library(gdata)
library(scales) # for setting x-axis by dates
library(cowplot) # for plotting 2 graphs side by side
source("00_scripts/data_summary.R")