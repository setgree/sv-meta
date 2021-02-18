# WIP
sa_meta <- function(data = dat, dv = d, iv = var_d, condense = T, ){
 # fill in stuff about robust
# use JH's code as a base
}

sum_lm <- function(dataset, y = d, x = se_d) {
  y <- dplyr::enexpr(y)
  x <- dplyr::enexpr(x)
  print(summary(lm(formula = as.formula(paste(y, '~', x)), data = dataset)))
}

dat %>%
  sum_lm()

?# there's something interesting about why this doesn't work

print(summary(lm(formula = d ~ se_d, data = dat))) # doesn't work
print(summary(lm(formula = dat$d ~ dat$se_d, data = dat)))


dat %>% filter(study_design == 'rct') %>% sum_lm()
