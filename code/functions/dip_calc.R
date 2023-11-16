#' Calculate Glass's Delta based on Difference in Proportions
#'
#' This function estimates Glass's $\Delta$ based on two proportions, calculating
#' the difference between the proportions and using the square root of the control
#' group's product of proportion and complement of the proportion.
#'
#' @param p1 Proportion in the treatment group.
#' @param p2 Proportion in the control group.
#'
#' @return Glass's $\Delta$ value.
#'
difference_in_proportion_calc <- function(p1, p2) {
  # Calculate the difference between the proportions
  diff <- p1 - p2
  
  # Calculate the standard deviation-like value using control group proportion
  sd <- sqrt(p2 * (1 - p2))
  
  # Calculate Glass's Delta
  d <- round(diff / sd, digits = 3)
  
  return(d)
}
