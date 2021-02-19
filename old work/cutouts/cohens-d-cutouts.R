# cohens d cutouts

# dat_clean <- dat %>%
#   nest(data = c(eff_type, u_s_d, ctrl_sd, n_t_post,
#                 n_t_group, n_c_post, n_c_group)) %>%
#   mutate(d = map_if(.p = (is.na(dat$n_t_group)),
#                     .f =  ~stand_result(stat_type = .x$eff_type, 
#                                         n_t = .x$n_t_post, 
#                                         n_c = .x$n_c_post,
#                                         sample_sd = .x$ctrl_sd,
#                                         stat =.x$u_s_d), 
#                     .else = ~(stat_type = .x$eff_type,
#                               n_t = as.numeric(
#                                 as.character(.x$n_t_group)),
#                               n_c = as.numeric(
#                                 as.character(.x$n_c_group)),
#                               sample_sd = .x$ctrl_sd,
#                               stat = .x$u_s_d))) %>% 
#   unnest(data) %>%
#   unnest(standardized_d) %>%
#   mutate(d = abs(d) * anticipated_direction)
# mutate(d = map(.x = dat, stat_type = eff_type, 
#                stat = u_s_d, 
#                sample_sd = ctrl_sd, 
#                n_t = n_t_post, 
#                n_c = n_c_post)))
#' This line prevents duplicate calculations (and the inclusion of duplicate columns)
# if('var_d' %in% colnames(dat)) dat <- dat %>% select(-d, -var_d, -st_err_d)
