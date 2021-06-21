

# n_t_groups and n_c_groups, if both conditions are over 5, we go about our bizniz
# if study_design == 'rct' & cluster = T & n_t_groups >= 5 & n_c_groups >= 5; then
# replace n_t and n_c with above params. It's the split-apply-merge. or case-when
# case when should be first approach

# note: if this fails for you, check that the inputs are of the right type
# e.g. eff_type != 'd_i_p.'
which(is.na(dat$eff_type)) # TODO: remove this once we fix the redline thing
# it's there because sometimes redline studies aren't marked that way in "is_red"


# 06/19 no more warnings!
# warnings were mostly one study (Taylor 2016),
# half of whose values are negative odds ratios (not a thing) and that are 
# duplicative of the regression results so I pinklined them


# remove impossible values: basically take the inverse of these changes
dat_cleaned <- dat_clean %>%
  filter(d != -Inf) %>% # these are because of log negative numbers
  filter(!is.na(d)) %>% # these need to be looked at
  filter(!is.na(var_d)) %>% # these also need to be looked at
  filter(d < 5 & d > -5) %>% # these also need to be looked at
  filter(var_d != 0) # this is to address a warning from metafor;

# (the dataset that's just the stuff removed above): look at it
studies_to_check <- dplyr::setdiff(dat_clean, dat_cleaned) %>%
  select(author, year, paper_title, eff_type, d, var_d, u_s_d, ctrl_sd,
         n_t_post, n_c_post, n_t_group, n_c_group,
         unique_paper_id, intervention_name,
         study_design, scale_name, delay)

# As of 06/21 I think all of these should have been addressed
sum(dat_cleaned$var_d == 0) # 0
sum(between(dat_cleaned$d, -4.7, 4.7)) 
# 507 which means that all our effect sizes fall within 
# our predefined 'reasonable' range

sum(dat_cleaned$var_d > 10) # 0 now
