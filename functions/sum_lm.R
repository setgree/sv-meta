library(dplyr, warn.conflicts = F)
sum_lm <- function(dataset, y = d, x = se_d) {
  y <- dplyr::enexpr(y)
  x <- dplyr::enexpr(x)
  print(summary(lm(formula = as.formula(paste(y, '~', x)), data = dataset)))
}