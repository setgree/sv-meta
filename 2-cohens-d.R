#' ---
#' title: Cohen's D calculations for SA meta-analysis
#' author: Seth Green
#' output:
#'  pdf_document
#' ---

rm(list =  ls())
library(dplyr)

dat <- readRDS('./data/sa_meta_data_cleaned.rds')
source('./functions/d_calc.R')
source('./functions/var_d_calc.R')  

dat_clean <- dat %>%
  mutate(d = mapply(FUN = d_calc, stat_type = eff_type, 
                    stat = u_s_d, sample_sd = ctrl_sd, 
                    n_t = n_t_post, n_c = n_c_post)) %>%
  mutate(d = abs(d) * anticipated_direction) %>%
  mutate(var_d = mapply(FUN = var_d_calc, d = d, 
                        n_t = n_t_post, n_c = n_c_post)) %>%
  mutate(se_d = sqrt(var_d))

# remove impossible values: basically take the inverse of these changes
# (the dataset that's just the stuff removed here) and look at it
dat_clean <- dat_clean %>%
  filter(d != -Inf) %>% # these are because of log negative numbers
  filter(!is.na(d)) %>% # these need to be looked at
  filter(!is.na(var_d)) %>% # these also need to be looked at
  filter(d < 5 & d > -5) # these also need to be looked at
# in total,35 rows removed
sum(dat_clean$var_d == 0) # 1, now that we're not doing clusters
sum(dat_clean$var_d > 10) # 0 now

#' all right so we have a lot of stuff to look at 
#' anything where D is greater than 4.7 or less than 4.7
#' certainly anything where D is inf :) or missing or whatever
#' Anything where Var D is missing 
#' We need to figure out what we're doing about these because our extant 
#' methods are going to be really weird with the low cluster studies being 
#' considered quasi-experimental. But, luckily, I think with the above code,
#' and its generally much simpler syntax, we can add some case_when conditions 
#' and avoid purrr and tidyr, and the whole thing just makes a lot more sense 
#' to me


#' NOTE for future reference: we have some weird values because of 
#' studies with 1 or 2 units assigned to treatment or control
# not doing clusters 
#' ah well onto the analysis
saveRDS(object = dat_clean, file = './data/sa_meta_data_for_analysis.rds')
