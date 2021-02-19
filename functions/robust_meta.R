#robst_meta function
library(metafor)
library(dplyr)

robst_meta <- function(dataset = dat, effs = d, )
  robust(x = rma(yi = effs, vi = var_effs), 
         cluster = dataset$cluster_var)