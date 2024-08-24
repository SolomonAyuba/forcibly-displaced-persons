## This is a backup of the r.file incase anything goes south.

# Initiated Fri 23 August, 2024
# data from UNHCR on forcibly displaced persons
# https://www.unhcr.org/refugee-statistics/insights/explainers/refugees-r-package.html

#______________________________________________________________________________
## installing the Packages needed for this project

# importing custom rmd templates from 'rticles' from CRAN
install.packages('rticles')
library(rticles)

# more rmd templates from rticles GitHub - development version
install.packages("pak")
pak::pak("rstudio/rticles")
library(pak)

# UNHCR branded templates for R Markdown
# https://github.com/unhcr-dataviz/unhcrdown
pak::pkg_install("unhcr-dataviz/unhcrdown")


# installing the UNHCR refugees package from CRAN
install.packages("refugees", repos = "http://cran.us.r-project.org" )
library(refugees)

# Alternatively, the development version of the package can also be installed 
# from Github using the pak package.
## pak::pkg_install("PopulationStatistics/refugees")

#______________________________________________________________________________

# UNHCR branded theme for ggplot2 and data visualization colour palettes
# link: https://github.com/unhcr-dataviz/unhcrthemes
# The uchxrethemes package allows the creation of charts in R according to the 
# UNHCR data visualization guidelnes: https://shorturl.at/QsXkP

install.packages("unhcrthemes")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")

library(unhcrthemes)
library(ggplot2)
library(dplyr)
library(tidyr)

# DATASETS
# The refugees package includes 8 datasets:
# population: Data on forcibly displaced and stateless persons by year, 
# including refugees, asylum-seekers, internally displaced people (IDPs) and 
# stateless people. Detailed definitions of the different population groups 
# can be found on the methodology page of the Refugee Data Finder.
# idmc: Data from the Internal Displacement Monitoring Centre on the total 
# number of IDPs displaced due to conflict and violence.
# asylum_applications: Data on asylum applications including the procedure type
# and application type.
# asylum_decisions: Data on asylum decisions, including recognitions, 
# rejections, and administrative closures.
# demographics: Demographic and sub-national data, where available, including 
# disaggregation by age and sex.
# solutions: Data on durable solutions for refugees and IDPs.
# unrwa: Data on registered Palestine refugees under UNRWA’s mandate.
# flows: Numbers of the people forced to flee during each of the years since 
# 1962. For more information, see the explanation of the forced displacement
# flow dataset.

# Link: https://cran.r-project.org/web/packages/refugees/refugees.pdf
#______________________________________________________________________________
help("refugees")

glimpse(refugees::population)
glimpse(refugees::demographics)

