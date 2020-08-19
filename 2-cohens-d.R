#' ---
#' title: Cohen's D calculations for SA meta-analysis
#' author: Seth Green
#' output:
#'  pdf_document
#' ---

rm(list =  ls())
library(purrr)
library(dplyr)
library(tidyr)

dat <- readRDS('./data/sa_meta_data_cleaned.rds')
source('./functions/Results_standardizeR.R')

#' This line prevents duplicate calculations (and the inclusion of duplicate columns)
if('var_d' %in% colnames(dat)) dat <- dat %>% select(-d, -var_d, -st_err_d)

dat_clean <- dat %>%
  nest(data = c(eff_type, u_s_d, ctrl_sd, n_t_post,
                 n_t_group, n_c_post, n_c_group)) %>%
  mutate(standardized_d = 
           purrr::map_if(.x = data,
                         .p = (is.na(dat$n_t_group)),
                         .f =  ~stand_result(eff_type = .x$eff_type, 
                                             n_t = .x$n_t_post, 
                                             n_c = .x$n_c_post,
                                             ctrl_sd = .x$ctrl_sd,
                                             raw_effect_size =.x$u_s_d), 
                         .else = ~stand_result(eff_type = .x$eff_type,
                                               n_t = as.numeric(
                                                 as.character(.x$n_t_group)),
                                               n_c = as.numeric(
                                                 as.character(.x$n_c_group)),
                                               ctrl_sd = .x$ctrl_sd,
                                               raw_effect_size = .x$u_s_d))) %>% 
  unnest(data) %>%
  unnest(standardized_d) %>%
  mutate(d = abs(d) * anticipated_direction)

#' all right so we have a lot of stuff to look at 
#' anything where D is greater than 4.7 or less than 4.7
#' certainly anything where D is inf :) or missing or whatever
#' Anything where Var D is missing 

dat_clean <- dat_clean %>%
  filter(d != -Inf) %>%
  filter(!is.na(d)) %>%
  filter(!is.na(var_d)) %>%
  filter(d < 5 & d > -5)

#' NOTE for future reference: we have some weird values because of 
#' studies with 1 or 2 units assigned to treatment or control
sum(dat_clean$var_d == 0 | dat_clean$var_d > 10, ma.rm = T) # 41 yikes!!
#' ah well onto the analysis
saveRDS(object = dat_clean, file = './data/sa_meta_data_for_analysis.rds')
