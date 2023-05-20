odds_ratio_to_d <- function(p1, p2){
  odds_ratio <- p1 / p2
  d <- log(odds_ratio) * sqrt(3) / pi
  d
}
