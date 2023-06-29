study_count <- function(dat) {
  dat %>%
    summarise('N (studies)' = n_distinct(unique_study_id))
  }

# maybe better version of this that takes in group_var (arbitrary #) as well?