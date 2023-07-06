var_d_calc <- function(d, n_t, n_c) {
  
  ust_var_d <- ((n_t + n_c) / (n_t * n_c)) +
                  ((d^2) / (2 * (n_t + n_c)))
  
  hedge_g <- 1 - (3 / (4*(n_t + n_c -2 ) - 1))
  
  return(round((hedge_g^2) * ust_var_d, digits = 3))
}
