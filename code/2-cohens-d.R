#' ---
#' title: Cohen's D calculations for SA meta-analysis
#' author: Seth Green
#' output:
#'  pdf_document
#' ---

rm(list =  ls())
library(dplyr, warn.conflicts = FALSE)

dat <- readRDS('./data/sa_meta_data_cleaned.rds')
source('./code/functions/d_calc.R')
source('./code/functions/var_d_calc.R')

dat_clean <- dat %>%
  mutate(d = case_when( # calculate d
    !is.na(n_t_group) & study_design %in% c('rct') ~ 
      mapply(
        FUN = d_calc,
        stat_type = eff_type,
        stat =  u_s_d,
        sample_sd = ctrl_sd,
        n_t = n_t_group,
        n_c = n_c_group),
     TRUE ~ mapply(
      FUN = d_calc,
      stat_type = eff_type,
      stat =  u_s_d,
      sample_sd = ctrl_sd,
      n_t = n_t_post,
      n_c = n_c_post))) %>%
  mutate(d = abs(d) * anticipated_direction) %>%
  mutate(var_d = case_when( # calculate variance
    !is.na(n_t_group) & study_design %in% c('rct') ~
      mapply(
        FUN = var_d_calc,
        d = d,
        n_c = n_c_group,
        n_t = n_t_group),
   TRUE  ~ 
      mapply(
        FUN = var_d_calc,
        d = d,
        n_t = n_t_post,
        n_c = n_c_post)
    )
    ) %>%
  mutate(se_d = sqrt(var_d))

saveRDS(object = dat_clean, file = './data/sa_meta_data_for_analysis.rds')
