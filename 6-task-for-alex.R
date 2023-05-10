library(dplyr, warn.conflicts = FALSE)
dat <- readRDS('./data/sa_meta_data_for_analysis.rds')

to_fill_in <- dat %>% 
  filter(is.na(participant_sex) |
           participant_sex == "3, 4" |
           is.na(publication_type) |
           is.na(stage_in_life) |
           robust_quasi_check) %>%
  select(author, year, paper_title, unique_paper_id, intervention_name,
         participant_sex, robust_quasi_check, publication_type, stage_in_life)

# TODO (if time really permits): go back to raw_dat (./data/sa_meta_data.csv) &
# double check everything where delay is NA. I assumed it was zero in every case 
# but we could check