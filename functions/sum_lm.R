library(dplyr, warn.conflicts = F)
sum_lm <- function(dataset = dat, y = d, x = se_d, coefs_only = T) {
  y <- dplyr::enexpr(y)
  x <- dplyr::enexpr(x)
  print_obj <- summary(lm(formula = as.formula(paste(y, '~', x)), 
                          data = dataset))
  
  if(coefs_only) print_obj$coefficients
  else print_obj
  # TODO: why is ifelse(coefs, print_obj$coefficients, print_obj) 
  # not equivalent to this
  }
