sum_lm <- function(dataset = dat, y = d, x = se_d, coefs_only = T, dgts = 5) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    message("Install dplyr before you run this function.")
    return(invisible())
  }
  y <- dplyr::enexpr(y)
  x <- dplyr::enexpr(x)
  print_obj <- summary(lm(formula = as.formula(paste(y, '~', x)), 
                          data = dataset))
  if (coefs_only) round(print_obj$coefficients, digits = dgts)
  
  else round(print_obj, digits = dgts)
}
