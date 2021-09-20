library(dplyr, warn.conflicts = F)
sum_lm <- function(dataset = dat, y = d, x = se_d, coefs_only = T, dgts = 5) {
  y <- dplyr::enexpr(y)
  x <- dplyr::enexpr(x)
  print_obj <- summary(lm(formula = as.formula(paste(y, '~', x)), 
                          data = dataset))
  if(coefs_only) round(print_obj$coefficients, digits = dgts)
  
  else round(print_obj, digits = dgts)
}
