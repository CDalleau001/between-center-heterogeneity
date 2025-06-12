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
## Real datasets imported from data-sharing platforms (DSPs)                ##
##############################################################################

# Packages 
library(readxl) #to import data 
library(reshape2) #to modulate data set
library(tidyverse) #to transform and visualize data

# Data import


## Variance values with a shared frailty model (SFM)
ggplot(data_SFM, aes(x=value, y=as.factor(trial_id))) + 
  geom_point(size=6, aes(colour = variable, shape = variable), alpha = 0.3)  +
  #geom_smooth() + 
  theme_bw() +
  theme(legend.position = "bottom")+
  scale_color_manual(values = c("#5E5752FF", "#E8CFABFF"), 
                     name = "R package", 
                     labels = c("Frailtypack (gamma)", "Coxme (log-normal)")) +
  scale_shape_manual(values = c(18, 16), 
                     name = "R package", 
                     labels = c("Frailtypack (gamma)", "Coxme (log-normal)")) +
  xlab("Variance of frailty, shared frailty model")+
  ylab("Dataset ID")

## Variance values with an additive frailty model (AddFM)
plot <-ggplot(data_AddFM, aes(x=value, y=as.factor(trial_id))) + 
  geom_point(size=7, aes(colour = package, shape = package), alpha = 0.4)  +
  theme_bw() +
  theme(legend.position = "bottom")+
  scale_color_manual(values = c("#5E5752FF", "#E8CFABFF"), 
                     name = "R package", 
                     labels = c("Frailtypack", "Coxme")) +
  scale_shape_manual(values = c(18, 16), 
                     name = "R package", 
                     labels = c("Frailtypack", "Coxme")) +
  xlab("Variance of frailties, additive frailty model")+
  ylab("Dataset ID")
plot +facet_grid(. ~variance)

##############################################################################