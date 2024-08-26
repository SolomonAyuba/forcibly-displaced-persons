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


#Assigning the 8 datasets in the refugees package to 8 variables:
population_df <- refugees::population
idmc_df <- refugees::idmc
asylum_apps_df <- refugees::asylum_applications
asylum_dec_df <- refugees::asylum_decisions
demographics_df <- refugees::demographics
solutions_df <- refugees::solutions
unrwa_df <- refugees::unrwa
flows_df <- refugees::flows

#View the content of each Datasets using this codes
View(population_df)
View(idmc_df)
View(asylum_apps_df)
View(asylum_dec_df)
View(demographics_df)
View(solutions_df)
View(unrwa_df)
View(flows_df)

#WORKING ON THE POPULATION DATAFRAME
#Explore the dataframe briefly to understand its structure

#Get the first few rows of the dataset
head(population_df)

#View the structure of the dataset
str(population_df)

#Get the summary/descriptive statistics of the dataset
summary(population_df)

#Check the shape/dimension(rows, columns) of the dataframe
dim(population_df)


#Data Cleaning

#Check for missing values in the dataframe
colSums(is.na(population_df))

#The oip column has 126,286 missing values out of 126,402 (about 99% missing values). It's best to drop the column.
population_df <- subset(population_df, select = -oip)

#Check for missing values again
colSums(is.na(population_df))

# Cornelius Demonstation video
head(population_df)

#Creating a smaller dataframe to see the total number of refugees based on the country of origin name(coo_name)
#Summarize the population dataframe using dplyr package
origin_by_refugees <- population_df %>% group_by(coo_name) %>% 
                      summarize(total_refugees = sum(refugees))
#Checking the origin_by_refugees dataframe
origin_by_refugees

#Since there are about 204 different countries of origin, let's visualize the top 10
#The code below selects the top 10 countries based on the total number of refugees
top_10_origin <- origin_by_refugees[order(-origin_by_refugees$total_refugees), ][1:10, ]
top_10_origin

#Visualizing the top_10_origin
pop_bar <-barplot(top_10_origin$total_refugees, names.arg = top_10_origin$coo_name, col = "blue",
              main = "Top 10 countries where refugees originated from", xlab = "Categories", 
              ylab = "Total Refugees", horiz=FALSE)

