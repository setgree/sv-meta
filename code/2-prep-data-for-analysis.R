#' ---
#' title: Prepare data for analysis
#' author: Seth Green
#' output:
#'  pdf_document
#' ---

rm(list =  ls())
library(dplyr, warn.conflicts = FALSE)
library(stringr)

dat <- readRDS('../data/sa_meta_data_cleaned.rds')
source('./functions/d_calc.R')
source('./functions/var_d_calc.R')

# Add Glass's Delta, Var_d, and Se_D
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


# add in other useful variables
dat_to_save <- dat_clean %>%
  mutate(decade = as.factor(case_when(
    year <= 1989 ~ "1980s",
    year >= 1990 & year <= 1999 ~ "1990s",
    year >= 2000 & year <= 2009 ~ "2000s",
    year >= 2010 ~ "2010s",
    TRUE ~ "Other")),
    total_n = n_t_post + n_c_post,
    quantile_var = case_when(
      total_n < quantile(total_n, 0.2) ~ 1,
      total_n < quantile(total_n, 0.4) ~ 2,
      total_n < quantile(total_n, 0.6) ~ 3,
      total_n < quantile(total_n, 0.8) ~ 4,
      TRUE ~ 5),
    labels = paste(tools::toTitleCase(word(author)), year),
    ra = ifelse(study_design == 'rct', TRUE, FALSE),
    yes_delay = as.factor(delay > 0),
    published_unpublished = 
      case_when(publication_type == 'published' ~ 'published',
                NA ~ 'unpublished', 
                TRUE ~ 'unpublished')) %>% 
  group_by(unique_study_id) %>% 
  mutate(has_both = case_when(all(c('attitudes', 'behavior') %in% scale_type) ~ 'both',
                              scale_type == 'attitudes' ~ 'attitudes',
                              scale_type == 'behavior' ~ 'behavior')) %>%
  ungroup() %>%
  mutate(study_design = case_when(study_design == "pre-post" ~ "Observational",
                                  study_design == "rct" ~ "Randomized Control Trial",
                                  study_design == "quasi-experimental" ~ "Quasi-Experimental"),
         study_design = factor(study_design, levels = c("Randomized Control Trial", 
                                                        "Quasi-Experimental", 
                                                        "Observational")),
         behavior_type = str_to_title(behavior_type))


saveRDS(object = dat_to_save, file = '../data/sa_meta_data_for_analysis.rds')
 