
# This was all formerly in 1-tidy-data.R but we don't need to share it
rm(list = ls())
library(dplyr)
library(googledrive)
library(openxlsx)
library(readxl)
library(tidyr)

## download sheet from google -----------------------------------
googledrive::drive_auth(email = T)
googledrive::drive_download("Code Checking Sheet: RA & PI",
                            path = "../data/prejudice_meta.xlsx",
                            overwrite = T)

## drop non coder sheets, and combine worksheets -----------------------------------
(sheet_to_keep <- getSheetNames("../data/prejudice_meta.xlsx")[1:2])

sheet_list <- lapply(sheet_to_keep,
                     read_xlsx,
                     path = "../data/prejudice_meta.xlsx",
                     col_names = FALSE,
                     col_types = "text")


dat <- bind_rows(sheet_list)
if(sum(pull(select(dat, 54)) %in% c("Loading...", "#NAME?"), na.rm = T) != 0) stop("Color Cell should not say Loading -- please try again (sometimes the mistake just goes away)")
## basic dat cleaning -----------------------------------
dat <- dat %>% 
  rename(checker = 1,
         done = 2,
         checking_comments = 3,
         starred_questions = 4,
         title = 5,
         author = 6,
         year = 7,
         publication_title = 8,
         abstract = 9,
         doi = 10,
         url = 11,
         source = 12,
         coder_name = 13,
         preregister = 14,
         type_of_control = 15,
         publication_type = 16,
         study_num = 17,
         mean_age = 18,
         setting = 19,
         country = 20,
         intervention_type = 21,
         prejudice_type = 22,
         intervention_approach = 23,
         intervention_length = 24,
         intervention_span = 25,
         light_touch = 26,
         open_data = 27,
         condition_name = 28,
         control_name = 29,
         outcome_type = 30,
         measure_name = 31,
         scale_direction = 32,
         time_measurement = 33,
         delay = 34,
         n_treatment = 35,
         n_treatment_clusters = 36,
         n_control = 37,
         n_control_clusters = 38,
         effect_type = 39,
         test_statistic = 40,
         effect_direction = 41,
         adjusted = 42,
         sd_control = 43,
         result_page = 44,
         heterogenous = 45,
         provide_all_stats = 46,
         contact_authors = 47,
         comment = 48,
         comment_to_pi = 49,
         synergy = 50,
         personalization = 51,
         policy_attitude_measure = 52,
         pi_note = 53,
         cell_color = 54)


dat <- dat %>%  drop_na(coder_name) %>% 
  fill(title) %>% 
  filter(!cell_color %in% c("#ff0000", "#ea4335"), # drop red studies; some people use different red 
         !pi_note %in% "PI note") %>%   # drop codersheet original titles
  group_by(title) %>% 
  fill(synergy, personalization, policy_attitude_measure) %>% 
  mutate(first_line = row_number() == 1) %>% 
  ungroup() %>% 
  mutate(unique_paper_id = cumsum(first_line))

## remove team-internal notes
dat <- dat %>%
  select(-checker, -pi_note, -done, -checking_comments,
         -starred_questions, -coder_name, -contact_authors,
         -comment, -comment_to_pi, -cell_color, -first_line)


nrow(dat %>% distinct(title)) # 309 titles
# write.csv(x = dat, file = '../data/raw-data.csv')
# remove xlsx file
system('rm ../data/prejudice_meta.xlsx')


## No longer needed I think
## if titles filled correctly should match have same numbers of papers as
## main method when group_by author
# meth_2 <- 
#   dat %>% 
#   select(title = 1,
#          author = 2,
#          coder_name = 13) %>% 
#   drop_na(coder_name) %>%
#   group_by(author) %>% ## if authors all match title will fill correctly
#   fill(title) %>% 
#   filter(!cell_color %in% c("#ff0000", "#ea4335"), # drop red studies; some people use different red 
#          !pi_note %in% "PI note") %>%   # drop codersheet original titles
#   group_by(title) %>%
#   mutate(first_line = row_number() == 1) %>% 
#   ungroup() %>% 
#   mutate(unique_paper_id = cumsum(first_line)) %>% 
#   select(title, unique_paper_id)

## appendix ----------------------------------------------------------------------
## robustness check that two titles don't have same id
# should = 0

# (same_id <- 
#     dat %>%
#     group_by(unique_paper_id) %>% 
#     distinct(title) %>%
#     mutate(n_rows = n()) %>% 
#     filter(n_rows != 1))

