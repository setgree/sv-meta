# Count the studies in a dataset (or subset)

#' 
#' This function helps us avoid writing
#' `summarise('N (studies)' = n_distinct(unique_study_id))`
#' over and over.
#' Example usage: `dat |> group_by(some_var) |> study_count`

study_count <- function(dat) {
  dat %>%
    summarise('N (studies)' = n_distinct(unique_study_id))
  }

