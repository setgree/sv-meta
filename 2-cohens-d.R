#' ---
#' title: Cohen's D calculations for SA meta-analysis
#' author: Seth Green
#' output:
#'  pdf_document
#' ---

rm(list =  ls())
library(dplyr, warn.conflicts = FALSE)

dat <- readRDS('./data/sa_meta_data_cleaned.rds')
source('./functions/d_calc.R')
source('./functions/var_d_calc.R')

# n_t_groups and n_c_groups, if both conditions are over 5, we go about our bizniz
# if study_design == 'rct' & cluster = T & n_t_groups >= 5 & n_c_groups >= 5; then
# replace n_t and n_c with above params. It's the split-apply-merge. or case-when
# case when should be first approach

# note: if this fails for you, check that the inputs are of the right type
# e.g. eff_type != 'd_i_p.'
dat_clean <- dat %>%
  mutate(d = case_when(
    !is.na(n_t_group) ~ mapply(
      FUN = d_calc,
      stat_type = eff_type,
      stat =  u_s_d,
      sample_sd = ctrl_sd,
      n_t = n_t_group,
      n_c = n_c_group
    ),
    is.na(n_t_group) ~ mapply(
      FUN = d_calc,
      stat_type = eff_type,
      stat =  u_s_d,
      sample_sd = ctrl_sd,
      n_t = n_t_post,
      n_c = n_c_post
    )
  )) %>%
  mutate(d = abs(d) * anticipated_direction) %>%
  mutate(var_d = mapply(
    FUN = var_d_calc,
    d = d,
    n_t = n_t_post,
    n_c = n_c_post
  )) %>%
  mutate(se_d = sqrt(var_d))
# 12 warnings; warnings()
# it's just one study (Taylor 2016), half of whose values are negative odds ratios
# (not a thing) and that are duplicative of the regression results so I pinklined them
# remove impossible values: basically take the inverse of these changes
dat_cleaned <- dat_clean %>%
  filter(d != -Inf) %>% # these are because of log negative numbers
  filter(!is.na(d)) %>% # these need to be looked at
  filter(!is.na(var_d)) %>% # these also need to be looked at
  filter(d < 5 & d > -5) %>% # these also need to be looked at
  filter(var_d != 0) # this is to address a warning from metafor;

# (the dataset that's just the stuff removed above): look at it
studies_to_check <- dplyr::setdiff(dat_clean, dat_cleaned) %>%
  select(author, year, paper_title, eff_type, d, var_d, 
         n_t_post, n_c_post, unique_paper_id, intervention_name)

# in total, 27 rows removed -- need to check these!! *after Roni has chcked studies
sum(dat_cleaned$var_d == 0) # 0

sum(dat_cleaned$var_d > 10) # 0 now

saveRDS(object = dat_cleaned, file = './data/sa_meta_data_for_analysis.rds')


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
#' not doing clusters
#' I think I fixed this with the pragmatic RCT designation

#' ah well onto the analysis
