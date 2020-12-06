# 4-attitudes-and-behaviors.R

rm(list = ls())
library(dplyr, warn.conflicts = FALSE)
library(ggplot2)
library(metafor)

dat <- readRDS(file = './data/sa_meta_data_for_analysis.rds')

# in words: look at the studies that have both and calculate correlation between them

has_both <- dat %>% 
  filter(attitudes_behaviors == 0) %>%
  group_by(unique_study_id, scale_type) %>%
  mutate(mean_d = mean(d), mean_var_d = mean(var_d), mean_se_d = mean(se_d)) %>%
  select(author, year, paper_title, unique_study_id, 
         mean_d, mean_var_d, mean_se_d, everything()) %>%  
  slice(1)

cor.test(x = has_both$mean_d[has_both$scale_type == 'attitudes'], 
         y = has_both$mean_d[has_both$scale_type == 'behavior'])

# RCTs?
has_both_rcts <- has_both %>% filter(study_design == 'rct')
cor.test(x = has_both_rcts$mean_d[has_both$scale_type == 'attitudes'], 
         y = has_both_rcts$mean_d[has_both$scale_type == 'behavior'])
