#' Count the Number of Studies in a Dataset or Subset
#' 
#' This function simplifies the process of counting the number of studies in a dataset
#' or a subset by avoiding repetitive use of `summarise('N (studies)' = n_distinct(unique_study_id))`.
#' 
#' @param dat The dataset or subset.
#' @param counting_var The variable to count unique observations (default: "unique_study_id").
#' @return A tibble with the count of distinct observations.
#' @importFrom dplyr summarise n_distinct
#' @note The use of `.data` is part of dplyr's non-standard evaluation (NSE) and allows explicit referencing of columns within the dataset `dat`.

study_count <- function(dat) {
  result <- dat |>
    summarise('N (studies)' = n_distinct(unique_study_id))
  
  return(result)
}
