# ggplot forest plot

library(dplyr, warn.conflicts = F)
library(ggplot2, warn.conflicts = F)
library(stringr)
dat <- readRDS(file = './data/sa_meta_data_for_analysis.rds') %>%
  select(unique_study_id, scale_type, everything()) %>%
  mutate(labels = paste(tools::toTitleCase(word(author)), year)) %>%
  group_by(unique_study_id) %>%
  mutate(
    attitudes_behaviors = case_when(
      all(c('attitudes', 'behavior') %in% scale_type) ~ 0,
      scale_type == 'attitudes' ~ 1,
      scale_type == 'behavior' ~ 2
    )
  ) %>%
  ungroup()

