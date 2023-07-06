library(dplyr, warn.conflicts = FALSE)
dat <- readRDS('./data/sa_meta_data_for_analysis.rds')

to_fill_in <- dat %>% 
  filter(is.na(participant_sex) |
           participant_sex == "3, 4" |
           is.na(publication_type) |
           is.na(stage_in_life) |
           cluster_type == 'n groups' && n_t_group > 0) %>%
  select(author, year, paper_title, unique_paper_id, intervention_name,
         participant_sex, robust_quasi_check, cluster_type,
         publication_type, stage_in_life)

write.csv(x = to_fill_in, file = './data/studies_to_check.csv')

# TODO (if time really permits): go back to raw_dat (./data/sa_meta_data.csv) &
# double check everything where delay is NA. I assumed it was zero in every case 
# but we could check

dat %>%
  group_by(unique_study_id) %>%
  summarise(
    men = sum(condition_gender == "men", na.rm = TRUE),
    women = sum(condition_gender == "women", na.rm = TRUE),
    both = sum(condition_gender == "both", na.rm = TRUE)
  )
