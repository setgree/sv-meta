#' Difference in Proportion Calculator

#' this function estimates Glass's $\Delta$ based on two proportions, e.g.
#' the number of perpetrators in the treatment and control groups divided by
#' the respective samples sizes. 
#' For each study where we use this estimator, our dataset includes `p1-p2` (or 
#' 'diff') in the u_s_d column ('unstandardized d') and the results of 
#' `sqrt(p2 * (1 - p2))` in the ctrl_sd column ('control group standard deviation').
#' 
#' We use this function in `3-appendixes.Rmd` to illustrate how it differs from 
#' using an odds ratio for calculating d\$\Delta$.

dip_calc <- function(p1, p2){
  diff <- p1 - p2
  sd <- sqrt(p2 * (1 - p2))
  d <- round(diff/sd, digits = 3)
  d
}
