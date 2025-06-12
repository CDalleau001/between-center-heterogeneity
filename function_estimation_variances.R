##############################################################################
## Project: Quantifying heterogeneity in cancer multicenter RCTs            ##
##                                                                          ##   
## Script purpose: Illustrate the variance of random effects                ##
## of frailty models obtained from a comprehensive literature review and    ##
## real datasets from data-sharing platforms                                ##
##                                                                          ##                  
## Date: 01/12/2024                                                         ##                  
##                                                                          ##                
## Author: C. Dalleau                                                       ##                
##                                                                          ##            
##############################################################################


##############################################################################
## Estimation of empirical mean, weighted mean and weighted median          ##
##############################################################################

# Packages 
library(tidyverse) #to transform and visualize data
library(spatstat) #to estimate weighted median 
library(Hmisc)  # for weighted.median

# Function to estimate the weighted statistics
f_weighted_statistic <- function(value, weights, is_events) {
  non_na_indices <- which(!is.na(weights))
  weighted_mean <- weighted.mean(value[non_na_indices], weights[non_na_indices])
  weighted_median <- weighted.median(value[non_na_indices], weights[non_na_indices])
  list(weighted_mean = weighted_mean, weighted_median = weighted_median)
}

# Empirical mean and median
lapply(variance_values, function(val) list(mean = mean(val), median = median(val))) 

# Weighted mean and median by events
weighted_stats_events_SFM <- lapply(data$variance, f_weighted_statistic, weights = events_weights, is_events = TRUE)

# Weighted mean and median by centers
weighted_stats_events_SFM <- lapply(data$variance, f_weighted_statistic, weights = center_weights, is_events = TRUE)

##############################################################################