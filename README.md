# Between-center-heterogeneity: Quantification of center variances from frailty models in oncology studies
Cynthia Dalleau

[![DOI](https://zenodo.org/badge/1000848838.svg)](https://doi.org/10.5281/zenodo.15649523)

**Download Instructions**: Click on the File you wish to view and select "View Raw" to start the download.

This project contain the code used for the quantification of center variances obtained from frailty models in oncology studies. 

# Requirements
These codes requires R (v. > 3.4.0) to run. 
Required R libraries are : 
* readxl
* reshape2
* tidyverse
* spatstat
* Hmisc
* frailtypack
* coxme
  
# Structure
Datasets used in this study are available in data-sharing platforms. 
The steps to prepare each dataset were:
- Data import
- Selection of data with OS as endpoint and center as interest of variance
- Creation of two datasets with stratification for each frailty model

## Code
- Estimation of mean and median empiracal and weighted variances (.R) 
- Graphical visualisations of variances
