d_calc <- function(stat_type , stat, sample_sd , n_t, n_c){
  # difference in differences
  if (stat_type == "d_i_d") { 
    d <- round(stat / sample_sd, digits = 3)
  }
  # difference in means
  else if (stat_type == "d_i_m") {
    d <- round(stat / sample_sd, digits = 3)
  }
  # difference in proportions
  else if (stat_type == "d_i_p") {
    d <- round(stat / sample_sd, digits = 3)
  }
  # reporting of change of SDs in text:
  else if (stat_type == "d") {
    d <- stat
  }
  
  # unspecified null
  else if (stat_type == "unspecified null") {
    d <- 0
  }
  
  # regression coefficient
  else if (stat_type == "reg_coef") {
    d <- round(stat / sample_sd, digits = 3)
  }
  
  # t test
  else if (stat_type == "t_test") {
    d <- round(stat * sqrt( (n_t + n_c ) / (n_t * n_c) ) , digits = 3)
  }
  # f.test
  else if (stat_type == "f_test") {
    d <- round(sqrt((stat * (n_t + n_c) ) / (n_t * n_c) ), digits = 3)
  }
  
  # odds ratio
  else if (stat_type == "odds_ratio") {
    # https://www.meta-analysis.com/downloads/Meta-analysis%20Converting%20among%20effect%20sizes.pdf
    # # Also in Cooper Hedges & Valentine p. 233
    d <- log(stat) * sqrt(3) / pi
  }
  
  # log odds ratio
  else if (stat_type == "log_odds_ratio") {
    d <- stat * sqrt(3) / pi
  }
  
  
  return(d)
}
