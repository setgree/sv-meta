
map_robust <- function(x) {
  result <- robust(x = rma(yi = x$d, vi = x$var_d), cluster = x$unique_study_id)
  data.frame(beta = round(result$beta, 3),
             se = round(result$se, 3),
             pval = ifelse(result$pval < 0.0001, "< 0.0001", 
                           round(result$pval, digits = 4))) %>% 
    as_tibble()
}
