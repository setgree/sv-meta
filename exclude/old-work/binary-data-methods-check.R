#' binary data methods test
#' we're looking at Lobo 2004 tables 9 (p. 74) and 10 (p. 78).
#' We have the raw data and the logit coefficient. I want to recalculate the 
#' logic cefficient and to also calculate log odds and try to back out Cohen's D 
#' from them, using established methods, and compare them to the difference in 
#' proportions estimator Don provided
#' 
#' We are comparing Control and Experimental groups at 3 month followup

control_n <- 125 + 17 + 5 + 0 + 2
control_none <- 125
control_perp <- 17 + 5 + 0 + 2

treatment_n <- 121 + 10 + 1 + 4 + 1
treatment_none <- 121
treatment_perp <- 10 + 1 + 4 + 1

#' note right here: I look at this data and I see regression to the mean and
#' large imbalance between groups in terms of baseline assault rates

