dip_calc <- function(p1, p2){
  diff <- p1 - p2
  sd <- sqrt(p2 * (1 - p2))
  d <- round(diff/sd, digits = 3)
  d
}
