#' Convert Odds Ratio to Cohen's D
#' 
#' This function is utilized in the appendix to contrast the conventional method
#' of calculating Cohen's D from a reported odds ratio against our preferred method,
#' using the Difference in Proportions estimator discussed elsewhere.
#'
#' @param p1 Numerator for the odds ratio.
#' @param p2 Denominator for the odds ratio.
#' @return Cohen's D value.
#'
odds_ratio_to_d <- function(p1, p2) {
  # Calculate odds for each probability
  odds1 <- p1 / (1 - p1)
  odds2 <- p2 / (1 - p2)
  
  # Calculate odds ratio
  odds_ratio <- odds1 / odds2
  
  # Convert odds ratio to Cohen's d
  d <- log(odds_ratio) * sqrt(3) / pi
  return(d)
}
