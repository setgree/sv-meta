# WIP
sa_meta <- function(data = dat, dv = d, iv = var_d, condense = T, ){
 # fill in stuff about  
}

print(summary(lm(formula = d ~ se_d, data = dat)))

sum_lm <- function(dataset, dv, iv) {
  print(summary(lm(formula = dv ~ iv, data = dataset)))
}
sum_lm(dataset = dat, dv = d, iv = se_d)
# there's something interesting about why this doesn't work

print(summary(lm(formula = d ~ se_d, data = dat))) # doesn't work
print(summary(lm(formula = dat$d ~ dat$se_d, data = dat)))


dat %>% filter(study_design == 'rct') %>% sum_lm()
