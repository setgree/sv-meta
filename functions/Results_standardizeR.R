stand_result <- function(eff_type , raw_effect_size , ctrl_sd , n_t, n_c, no_sd_given = FALSE){
  if (no_sd_given == TRUE) ctrl_sd <- 1
  # Paper on no sd given (Seth comment):
  # https://bmcmedresmethodol.biomedcentral.com/articles/10.1186/s12874-018-0483-0
  ## All calculations taken from Cooper, Hedges, and Valentine (2009)
  
  # difference in differences
  if (eff_type == "d_i_d"){ 
    d <- round(raw_effect_size / ctrl_sd, digits = 3)
  }
  # difference in means
  else if (eff_type == "d_i_m"){
    d <- round(raw_effect_size / ctrl_sd, digits = 3)
  }
  # reporting of change of SDs in text:
  else if(eff_type == "d"){
    d <- raw_effect_size
  }
  
  # regression coefficient
  else if (eff_type == "reg_coef"){
    d <- round(raw_effect_size / ctrl_sd, digits = 3)
  }
  
  # t test
  else if (eff_type == "t_test"){
    d <- round(raw_effect_size * sqrt( (n_t + n_c ) / (n_t * n_c) ) , digits = 3)
  }
  # f.test
  else if (eff_type == "f_test"){
    d <- round(sqrt( ( raw_effect_size * (n_t + n_c) ) / (n_t * n_c) ), digits = 3)
  }
  
  # odds ratio
  else if (eff_type == "odds_ratio"){
    # https://www.meta-analysis.com/downloads/Meta-analysis%20Converting%20among%20effect%20sizes.pdf
    # # Also in Cooper Hedges & Valentine p. 233
    d <- log(raw_effect_size) * sqrt(3) / pi
  }
  
  # log odds ratio
  else if (eff_type == "log_odds_ratio"){
    d <- raw_effect_size * sqrt(3) / pi 
  }
  
  
  # compute variance of the estimated effect size
  
  ust_var_d <- (((n_t + n_c)
                 / (n_t * n_c))
                +
                  ((d^2) / (2 * (n_t + n_c)) )
  )
  # Apply hedge's g correction
  hedge_g <- 1 - (3
                  /
                    (4*(n_t + n_c -2 ) -1))
  
  var.d <- round((hedge_g^2) * ust_var_d, digits = 3)
  
  # standard error is the square root of variance
  st.err.g <- round(sqrt(var.d), digits = 3)
  
  # print everything out
  results <- c(d, var.d, st.err.g)
  
  col.names <- c("Standardized Effect (Cohen's D)" , 
                 "Variance of D" , "Standard Error of D")
  
  results.table <-tibble::tribble(~d, ~var_d, ~st_err_g,
                         d, var.d, st.err.g)
  
  #print(results.table)
  return(results.table)
  
}

# CI converter

CI_converter <- function(upper, lower, n, interval = 95) {
  # https://handbook-5-1.cochrane.org/chapter_7/7_7_3_2_obtaining_standard_deviations_from_standard_errors_and.htm
  if (interval == 95){
    sd <- (sqrt(n) * (upper - lower)) / 3.92
    print(sd)
    return( (sqrt(n) * (upper - lower)) / 3.92)
  }
  else if(interval == 90){
    sd <- (sqrt(n) * (upper -lower)) / 3.29
    print(sd)
    return(sd)
  }
}  

# D.I.D function

did_calculator <- function(mean_treatment_post, # sd left for legacy reasons
                           mean_treatment_pre, 
                           mean_control_post, 
                           mean_control_pre,
                           sd = 1){
  
  treatment <-  mean_treatment_post - mean_treatment_pre
  control <- mean_control_post - mean_control_pre
  did <-treatment - control
  
  print(did)
  print(glue::glue("The treatment group changed ", round((treatment/abs(mean_treatment_pre))*100, 2), "%"))
  print(glue::glue("The control group changed ", round((control/abs(mean_control_pre))*100, 2), "%"))
  did
} 

# SE 2 SD

se_2_sd <- function(se, n){
  (se * sqrt(n))
} ## parentheses 'auto-print' but it seems fine without it. whatevs

se_2_sd(3.4, 50)
# SD pooled

sd_pooled <- function(sd, n){
  #taken from Hedges, 1981:110
  if (length(sd) != length(n)){
    stop("Length of sd and length of n need to be the same")
  }
  
  k <- length(sd)
  sd2 <- sd^2
  df <- n - 1
  
  num <- sum(sd2*df)
  dem <- sum(n) - k
  
  sd_pooled <- sqrt(num/dem)
  print(sd_pooled)
  sd_pooled
  
}
sd_pooled(sd = c(7.28, 7.32), n = c(22, 15))

#DIM function

dim_calculator <- function (mean_control, mean_treatment){
  dim <- mean_control - mean_treatment
  print(dim)
  return(dim)
}

# LogOdds ratio
log_odds_ratio <- function(n_control, n_treatment, 
                           percent_control, percent_treatment){
  # https://www.medcalc.org/calc/odds_ratio.php                       
  if (percent_control > 1 || percent_treatment > 1){ # percent_control_pre > 1 || percent_control_post > 1 ||
    stop("Insert percentage as decimal")
  }
  
  a <- n_treatment * percent_treatment
  b <- n_treatment * (1 - percent_treatment)
  c <- n_control * percent_control
  d <- n_control * (1 - percent_control)
  
  odds <- log((a/b)/(c/d))
  odds
}


odds_ratio <- function(n_control, n_treatment, 
                       percent_control, percent_treatment){
  # https://www.medcalc.org/calc/odds_ratio.php                       
  if (percent_control > 1 || percent_treatment > 1){ # percent_control_pre > 1 || percent_control_post > 1 ||
    stop("Insert percentage as decimal")
  }
  
  a <- n_treatment * percent_treatment
  b <- n_treatment * (1 - percent_treatment)
  c <- n_control * percent_control
  d <- n_control * (1 - percent_control)
  
  odds <- (a/b)/(c/d)
  odds
}
# Chi-Squared to D
# taken from Conversion of Common Test Statistics to r and d Values in methods folder
# also see https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2850938/
chisq_2_d <- function(chisq, df, n){
  r <- sqrt(chisq / n)
  d <- r_2_d(r)
  return(d)
  # if (df == 1){
  #   d <- 2*sqrt(chisq /( n - chisq))
  # } else {
  #   d <- 2*sqrt(chisq / n)
  # }
  # d
}


# R to D
# taken from Conversion of Common Test Statistics to r and d Values in methods folder
r_2_d <- function(r){
  d <- (2 * r) / sqrt(1 - r^2)
  d
}

weighted_average <- function(men_average, n_men, women_average, n_women){
  weighted_men <- men_average*n_men
  weighted_women <- women_average*n_women
  
  real_average <- (weighted_women + weighted_men)/(n_women + n_men)
  return(real_average)
}

# weighted_sd <- function(ns, sds, means){
#   # https://en.wikipedia.org/wiki/Pooled_variance#Aggregation_of_standard_deviation_data
#   # methods for samples
#   if (length(ns) != length(sds)){
#     stop("ns and sds need to be the same length")
#   }
#   
#   ns_minus_1 <- ns - 1
#   var <- sds^2
#   means_sq <- means^2
#   total_n <- sum(ns)
#   overal_mean_sq <- weighted.mean(means, ns)^2
#   total <- overal_mean_sq * total_n
#   
#   sd <- sqrt((sum(ns_minus_1 * var) + sum(ns * means_sq) - total) / (total_n - 1))
#   return(sd)
# }


ci_2_sd <- function(lower, upper, n, conf_level = .95) {
  # https://handbook-5-1.cochrane.org/chapter_7/7_7_3_2_obtaining_standard_deviations_from_standard_errors_and.htm
  if (conf_level == .95){
    sd_return <- (sqrt(n) * (upper - lower)) / 3.92
    print(sd_return)
    return(sd_return)
  }
  else if(conf_level == .90){
    sd_return <- (sqrt(n) * (upper - lower)) / 3.29
    print(sd_return)
    return(sd_return)
  } else {
    stop("conf_level is not equal to .90 or .95")
  }
}


t_inverse <- function (p, n){
  qt(1 - p/2, n - 2)
}


s_pooled <- function(reg_coef, total_n, outcome_sd, n_treatment, n_control){
  # https://stats.stackexchange.com/questions/348502/cohens-d-from-a-linear-regression-model
  sqrt(((outcome_sd^2)*(total_n - 1) - (reg_coef^2)*((n_treatment*n_control)/(total_n))) / (total_n - 2))
}

# weighted_sd <- function(men_sd, n_men, women_sd, n_women){ 
#   # https://en.wikipedia.org/wiki/Pooled_variance
#   df <- n_men + n_women - 2
#   num <- ((n_men - 1) * men_sd^2) + ((n_women - 1) * women_sd^2)
#   new_sd <- sqrt(num/df)
#   return(new_sd)  
#   }


#### jh n studies counter
# library(tidyverse)
# jh <- readxl::read_excel('~/Dropbox/research/sa-meta/Porat_Gantman_Paluck_Green_meta_analysis/#jh_coding.xlsx')
# jh %>% 
#   group_by(name, year) %>% 
#   n_groups()

