#robst_meta function
library(metafor)
library(dplyr)

robust_meta <-
  function(dataset = dat,
           effs = d,
           var_effs = var_d,
           cluster_var = unique_study_id) {
    dataset <- enexprs(dataset)
    effs <-  enexprs(effs)
    var_effs <- enexprs(var_effs)
    cluster_var <- enquo(cluster_var)
    robust(x = rma(yi = effs, vi = var_effs, data = dataset),
           cluster = dataset$cluster_var)
  }
robust(x = rma(yi = d, vi = var_d, data = dat),
       cluster = dat$unique_study_id)

robust_meta(dataset = dat, effs = d, var_effs = var_d, 
            cluster_var = unique_study_id)

robust(x = rma(yi = d, vi = var_d, data = dat),
       cluster = dat$unique_study_id)
