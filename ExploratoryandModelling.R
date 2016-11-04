## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = F,message = F, warning = F)
library(tidyverse)
library(readr)
library(magrittr)
library(ggplot2)
library(gamlss)

## ------------------------------------------------------------------------
Lukemia <- read.table('./Data/leukemia(1).dat',header = T)
#AG is binary
#wbc is continuous
#converting AG to factor
Lukemia <- Lukemia %>% mutate(AG=factor(AG))
#Scatter Plots between both groups
Lukemia %>% ggplot(aes(x=WBC,y=Survtime,colour=AG)) + geom_point()
#right skewness observed, outliers in WBC and SURVTime present
#Patients with AG==1 has higer SURVtime than those with AG==0

#histograms to drive the skewness home (Still a little marginal cos WBC is not
#in the picture but the skewness presents itself in the scatter plot already)
Lukemia %>% ggplot(aes(Survtime)) + geom_histogram(bins=10) + facet_grid(.~AG)

#########if you are interested in baseR and not ggplot2#############
# Lukemia %>% with(plot(WBC,Survtime,type="n",main='Relationship Between WBC and
#                                          SurvTime'))
# Lukemia %>% dplyr::filter(AG==1) %>% with(points(WBC,Survtime,pch=19,col=2))
# Lukemia %>% dplyr::filter(AG==0) %>% with(points(WBC,Survtime,pch=19,col=3))
##Candidate Distributions include generally positively skewed distributions
#I will suggest exponential, weibull, lognormal
#
#
#

