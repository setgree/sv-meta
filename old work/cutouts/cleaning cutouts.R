# March 2022 cutouts from download and clean script
# raw_dat$eff_type <- gsub(pattern = 'reg.coef (B)', replacement = 'reg_coef', x = raw_dat$eff_type)
# raw_dat$eff_type <- gsub(pattern = '', replacement = NA, x = raw_dat$eff_type)


## cleaning cutouts 

# all the below got removed because we're using lab_field rather than lab_or_field
# check the 26 things for which lab_or_field is missing
 # sum(is.na(raw_dat$lab_or_field)) # nice
 # unique(raw_dat$lab_or_field) # better
 # table(raw_dat$lab_or_field, useNA = "ifany")
 # sum(is.na(raw_dat$lab_field))
 # raw_dat$lab_or_field <- gsub(pattern = 'lab', replacement = 0,  x = raw_dat$lab_or_field)
 # raw_dat$lab_or_field <- gsub(pattern = 'field', replacement = 1,  x = raw_dat$lab_or_field)
 # raw_dat$lab_or_field <- gsub(pattern = "^$|^ $", replacement = NA,  x = raw_dat$lab_or_field)
 # raw_dat$lab_or_field <- as.numeric(raw_dat$lab_or_field) 
 # sum(is.na(raw_dat$lab_or_field)) # I fixed these manually
 # # lab_data_missing <- raw_dat %>% 
 # #   filter(is.na(lab_or_field)) %>% 
 # select(author, year, intervention_name, lab_or_field, lab_field)
 
 # that didn't quite do it, FWIW -- let's check these:
 # discrepancy_data <- raw_dat %>% 
 # #   filter((lab_field == 'lab' & lab_or_field == 1) | (lab_field == 'field' & lab_or_field == 0)) %>%
 #   select(author, year, intervention_name, lab_or_field, lab_field)
 # write.csv(x = discrepancy_data, file =  '~/Desktop/discrepancies.csv')
 # make study design a factor

The following doesn't work yet but it's an idea
```{r incomplete behavior_type_atitude_cor_tests, eval = F}
# THIS DOES NOT WORK 
# pivot wider is hard
# by outcome type
has_both_behavior_types <- dat %>% 
        filter(attitudes_behaviors == 0) %>%
        group_by(unique_study_id, scale_type, behavior_type) %>%
        mutate(mean_d = mean(d), 
               mean_var_d = mean(var_d), 
               mean_se_d = mean(se_d)) %>%
        select(author, year, paper_title, unique_study_id, intervention_name,
               study_design, mean_d, mean_var_d, mean_se_d,
               ra, labels, scale_type, behavior_type) %>%  
        slice(1) %>% 
        pivot_wider(
                id_cols = c(author, year, paper_title, unique_study_id,
                            intervention_name,
                            unique_study_id, study_design, ra, labels),
                names_from = c(scale_type, , behavior_type), 
                values_from = c(mean_d, mean_var_d, mean_se_d)) # %>%
#  select(-behavior_type_attitudes) %>% 
# rename(behavior_type = behavior_type_behavior)

has_both %>% 
        split(.$behavior_type) %>%
        map(~cor.test(.$mean_d_attitudes, .$mean_d_behavior))
```

 