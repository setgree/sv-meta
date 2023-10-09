#' convert an odds ratio to Cohen's D
#' 
#' This function is used in the appendix to contrast the conventional method
#' for calculating Cohen's D from a reported odds ratio vs. our preferred method
#' of using the Difference in Proportions estimator discussed elsewhere/

odds_ratio_to_d <- function(p1, p2){
  odds_ratio <- p1 / p2
  d <- log(odds_ratio) * sqrt(3) / pi
  d
}
