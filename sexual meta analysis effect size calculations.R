#testing
library(tidyverse)
rm(list=ls())
source("Results_standardizeR.R")

# 2018  =================================
weighted_average(men_average = 10, women_average = 27, n_men = 21, n_women = 59)
## Abebe a -----------------------------------
### great paper, no results

## Abebe b -----------------------------------
### great paper, no results

## Banyard -----------------------------------
### no outcomes we use; also same as Cares?

## Burns -----------------------------------
burns_dim <- dim_calculator(mean_control = 39.95, mean_treatment = 41.12)
stand_result(eff_type = "d_i_m", ctrl_sd = 6.92, n_t = 750, n_c = 750, raw_effect_size = burns_dim)

# Del Rey et al., 2018 -----------------------------------
DelRey_did <- did_calculator(mean_treatment_post = 13.3,mean_treatment_pre =  13.6,mean_control_post =  6.5,mean_control_pre =  5.1) # sd = 5.244
stand_result(eff_type = "d_i_d", raw_effect_size = DelRey_did, ctrl_sd = 5.244,n_t =  5,n_c =  2)

### Devine -----------------------------------
### not relevant outcomes

### Gordon -----------------------------------
### this study has "two" conditions but they only report the aggregate
gordan_dim <- dim_calculator(mean_treatment = 4.28, mean_control = 4.15)
stand_result(eff_type = "d_i_m", raw_effect_size = gordan_dim, ctrl_sd = .6, n_t = 100, n_c = 100)

### Jemmott -----------------------------------
### aids reduce intervention with sexual violence outcome

## McMahon -----------------------------------
### observational

## Mennicke -----------------------------------
## not control or pre

## Muck -----------------------------------
### general knowledge
### higher is good
pp_gk_post <- did_calculator(mean_control_pre = 7.01, sd = 2.51, mean_treatment_pre = 7.14, mean_control_post = 7.34, mean_treatment_post = 9.92) # pp post
stand_result(eff_type = "d_i_d", ctrl_sd = 2.51, n_c = 9, raw_effect_size = pp_gk_post, n_t = 8)

pp_gk_6mo <- did_calculator(mean_control_pre = 7.01, sd = 2.51, mean_treatment_pre = 7.14, mean_treatment_post = 9.92, mean_control_post = 7.74) ## 6 mo
stand_result(eff_type = "d_i_d", ctrl_sd = 2.51, n_c = 9, raw_effect_size = pp_gk_6mo, n_t = 8)

spp_gk_post <- did_calculator(mean_control_pre = 7.01, sd = 2.51, mean_treatment_pre = 6.59, mean_control_post = 7.34, mean_treatment_post = 12.1) # spp post
stand_result(eff_type = "d_i_d", ctrl_sd = 2.51, n_c = 9, raw_effect_size = spp_gk_post, n_t = 10)

spp_gk_6mo <- did_calculator(mean_control_pre = 7.01, sd = 2.51, mean_treatment_pre = 6.59, mean_treatment_post = 9.81, mean_control_post = 7.74) ## 6 mo
stand_result(eff_type = "d_i_d", ctrl_sd = 2.51, n_c = 9, raw_effect_size = spp_gk_6mo, n_t = 10)

### behavior vict & perp
### lower is good
vict_pre <- mean(c(.15, .37))
vict_post <- mean(c(.37, .49))
perp_pre <- mean(c(.01, .1))
perp_post <- mean(c(.14, .14))
vict_sd <- weighted_sd(sds = c(.5, .64), means = c(.15, .37), ns = c(157, 157))
perp_sd <- weighted_sd(sds = c(.11, .3), means = c(.01, .1), ns = c(157, 157))

spp_vict_pre <- mean(c(.23, .33))
spp_vict_post <- mean(c(.28, .4))
spp_perp_pre <- mean(c(.03, .06))
spp_perp_post <- mean(c(.13, .16))

pp_vict_pre <- mean(c(.4, .51))
pp_vict_post <- mean(c(.34, .46))
pp_perp_pre <- mean(c(.11, .14))
pp_perp_post <- mean(c(.09, .12))

pp_vict <- did_calculator(mean_control_pre = vict_pre, mean_control_post = vict_post, sd = vict_sd, mean_treatment_pre = pp_vict_pre, mean_treatment_post = pp_vict_post)
stand_result(eff_type = "d_i_d", ctrl_sd = vict_sd, raw_effect_size = pp_vict, n_t = 8, n_c = 9)

spp_vict <- did_calculator(mean_control_pre = vict_pre, mean_control_post = vict_post, sd = vict_sd, mean_treatment_pre = spp_vict_pre, mean_treatment_post = spp_vict_post)
stand_result(eff_type = "d_i_d", ctrl_sd = vict_sd, raw_effect_size = spp_vict, n_t = 10, n_c = 9)


pp_perp <- did_calculator(mean_control_pre = perp_pre, mean_control_post = perp_post, sd = perp_sd, mean_treatment_pre = pp_perp_pre, mean_treatment_post = pp_perp_post)
stand_result(eff_type = "d_i_d", ctrl_sd = perp_sd, raw_effect_size = pp_perp, n_t = 8, n_c = 9)

spp_perp <- did_calculator(mean_control_pre = perp_pre, mean_control_post = perp_post, sd = perp_sd, mean_treatment_pre = spp_perp_pre, mean_treatment_post = spp_perp_post)
stand_result(eff_type = "d_i_d", ctrl_sd = perp_sd, raw_effect_size = spp_perp, n_t = 10, n_c = 9)

## Orchowski -----------------------------------
stand_result(eff_type = "t_test", raw_effect_size = 2.1, n_t = 20, n_c = 20)

## Peterson -----------------------------------
# ### IRMA
# te_irma_post <- dim_calculator(mean_control = 2.4, mean_treatment = 2.1) # post
# stand_result(eff_type = "d_i_m", raw_effect_size = te_irma_post, n_t = 14, n_c = 5, ctrl_sd = .6)
# 
# be_irma_post <- dim_calculator(mean_control = 2.5, mean_treatment = 1.9) # post
# stand_result(eff_type = "d_i_m", raw_effect_size = be_irma_post, n_t = 14, n_c = 5, ctrl_sd = .6)
# 
# # post
# te_irma_2 <- did_calculator(mean_control_pre = 2.4, mean_control_post = 2.5, sd = .5, mean_treatment_pre = 2.4, mean_treatment_post = 2.2) # 2 mo
# stand_result(eff_type = "d_i_d", raw_effect_size = te_irma_2, n_t = 14, n_c = 5, ctrl_sd = .5)
# 
# 
# be_irma_2 <- did_calculator(mean_control_pre = 2.4, mean_control_post = 2.5, sd = .5, mean_treatment_pre = 2.5, mean_treatment_post = 2.1) # 2 mo
# stand_result(eff_type = "d_i_d", raw_effect_size = be_irma_2, n_t = 14, n_c = 5, ctrl_sd = .5)
# 
# ### bystander behavior
# te_bb_2 <- did_calculator(mean_control_pre = 4.9, mean_control_post = 3.7, mean_treatment_pre = 4.7, mean_treatment_post = 4.9, sd = 4.3) # 2 mo
# stand_result(eff_type = "d_i_d", raw_effect_size = te_bb_2, n_t = 14, n_c = 5, ctrl_sd = 4.3)
# 
# be_bb_2 <- did_calculator(mean_control_pre = 4.9, mean_control_post = 3.7, mean_treatment_pre = 4.6, mean_treatment_post = 7, sd = 4.3) # 2 mo
# stand_result(eff_type = "d_i_d", raw_effect_size = be_bb_2, n_t = 14, n_c = 5, ctrl_sd = 4.3)


## Sanchez-Jimenez -----------------------------------
### myths about romantic love
### lower is better
sanchez_sd <- weighted_sd(ns = c(800, 801, 801, 801), sds = c(1.18, 1.01, .98, .96), means = c(1.6, 2.14, 2.7, 2.83))
sanchez_rl <- did_calculator(mean_control_post = mean(c(1.38, 1.98, 2.59, 2.77)), mean_treatment_post = mean(c(.94, 1.42, 1.84, 1.92)), mean_control_pre = mean(c(1.6, 2.14, 2.7, 2.83)), mean_treatment_pre = mean(c(1.56, 2.14, 2.48, 2.64)), sd = sanchez_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = sanchez_rl, n_t = 4, n_c = 3, ctrl_sd = sanchez_sd)

### physical violence
#### perp
san_perp <- did_calculator(mean_control_pre = .06, mean_treatment_pre = .06, mean_control_post = .05,  mean_treatment_post = .04, sd = .18)
stand_result(eff_type = "d_i_d", n_t = 4, n_c = 3, ctrl_sd = .18, raw_effect_size = san_perp)

#### vict
san_vict <- did_calculator(mean_control_pre = .06,  mean_treatment_pre = .07, mean_control_post = .06, mean_treatment_post = .05, sd = .23)
stand_result(eff_type = "d_i_d", n_t = 4, n_c = 3, ctrl_sd = .23, raw_effect_size = san_vict)

## Spike -----------------------------------
spike_female <- dim_calculator(mean_treatment = 2.67, mean_control = 2.36)
stand_result(eff_type = "d_i_m", raw_effect_size = spike_female, n_t = 23, n_c = 22, ctrl_sd = 1.31)

spike_male <- dim_calculator(mean_treatment = 2.27, mean_control = 2.36)
stand_result(eff_type = "d_i_m", raw_effect_size = spike_male, n_t = 26, n_c = 22, ctrl_sd = 1.31)

## Zapp -----------------------------------
zapp_1 <- mean(c(.863, .911, .791))
zapp_2 <- mean(c(.869, .905, .816))
zapp_odds <- log_odds_ratio(percent_control = zapp_1, percent_treatment = zapp_2, 167424, 167424)

stand_result(eff_type = "log.odds_ratio", raw_effect_size = zapp_odds, n_t = 80, n_c = 80)


## Zhura Khatoon -----------------------------------
zhuta_rma_did <- mean(c(18.1, 20.2, 4, -1.1, 8.4)) * -1
stand_result(eff_type = "d_i_d", raw_effect_size = zhuta_rma_did, no_sd_given = T, n_t = 25, n_c = 25) # pg 18; 1 item 

zhuta_behavior_p_2012 <- mean(c(8.3, 9.9, 6.6, 5.4, 2.1, 2.3, 1.7))
zhuta_behavior_c_2012 <- mean(c(9, 4.3, 6, 2.7, 2.3, 1.9, .5))
zhuta_behavior_p_2016 <- mean(c(.7, 2.1, .6, .8, .2, .8, 0))
zhuta_behavior_c_2016 <- mean(c(3, 3.3, 2.1, 2.3, 1.2, 1))
b_n_t <- mean(c(7,21,6,8,2,8,0))
b_n_c <- mean(c(30,33,21,23,23,12,10))
zhura_behavior <- did_calculator(mean_control_pre = zhuta_behavior_c_2012, mean_treatment_pre = zhuta_behavior_p_2012, mean_control_post = zhuta_behavior_c_2016, mean_treatment_post = zhuta_behavior_p_2016)
stand_result(eff_type = "d_i_d", no_sd_given = T, n_t = 25, n_c = 25, raw_effect_size = zhura_behavior) # 40; 7 items

## zinzow -----------------------------------
rma_post <- dim_calculator(mean_control = 2.34, mean_treatment = 2.11) # post
stand.result(eff.type = "d.i.m", ctrl.sd = .89, n.c = 2767, n.t = 2749, u.s.d = rma_post)

rma_follow <- dim_calculator(mean_control = 2.34, mean_treatment = 1.99) # 4 mo
stand.result(eff.type = "d.i.m", ctrl.sd = .89, n.c = 2767, n.t = 995, u.s.d = rma_follow)

# 2017 =================================
## Baiochi -----------------------------------
baiochi_beh <- blpl::t_inverse(p = .03, n = 3147)
stand_result(eff_type = "t_test", raw_effect_size = baiochi_beh, n_t = 14, n_c = 14)

## Bannon -----------------------------------
### no outcomes

## bonar -----------------------------------
#### not enough info

## brickman -----------------------------------
### i don't think we should code b/c both groups get green dot

# Coker et al., 2017 -----------------------------------

cocker2017_sd <- CI_converter(upper = 262,lower =  160,n =  12)
cocker2017_did <- did_calculator(mean_treatment_post = 157,mean_treatment_pre =  300,mean_control_post =  245, mean_control_pre = 211, sd = cocker2017_sd)
stand_result(eff_type = "d_i_d",raw_effect_size =  cocker2017_did, ctrl_sd = cocker2017_sd,n_t =  12, n_c = 12)

## Cornelis -----------------------------------
### not relevant outcomes

## Crane -----------------------------------
### knowledge (higher is better)
crane_face <- did_calculator(mean_control_pre = 7.6, mean_control_post = 7.7, sd = 1, mean_treatment_pre = 7, mean_treatment_post = 7.6) # face
stand_result(eff_type = "d_i_d", raw_effect_size = crane_face, ctrl_sd = 1, n_t = 35, n_c = 30)

crane_sve <- did_calculator(mean_control_pre = 7.6, mean_control_post = 7.7, sd = 1, mean_treatment_pre = 7.3, mean_treatment_post = 7.6) # SVE
stand_result(eff_type = "d_i_d", raw_effect_size = crane_sve, ctrl_sd = 1, n_t = 27, n_c = 30)

### vict
face_vict_log <- log_odds_ratio(percent_treatment = .343, percent_control = .16, n_control = 30, n_treatment = 35) # face
stand_result(eff_type = "log.odds_ratio", n_t = 35, n_c = 30, raw_effect_size = face_vict_log)

sve_vict_log <- log_odds_ratio(percent_treatment = .24, percent_control = .16, n_control = 30, n_treatment = 27) # sve
stand_result(eff_type = "log.odds_ratio", n_t = 27, n_c = 30, raw_effect_size = sve_vict_log)

### perp
face_perp_log <- odds_ratio(percent_control = 1-0, percent_treatment = 1-.031, n_control = 30, n_treatment = 35) # face
stand_result(eff_type = "odds_ratio", n_t = 35, n_c = 30, raw_effect_size = face_perp_log + 1)

sve_perp_log <- odds_ratio(percent_treatment = 1-.12, percent_control = 1-0, n_control = 30,  n_treatment = 27) # sve
stand_result(eff_type = "odds_ratio", n_t = 27, n_c = 30, raw_effect_size = sve_perp_log + 1)

## Draper -----------------------------------
rma_pre_vec <- c(4.24, 4.34, 4.1, 3.96, 3.28, 3.33, 3.56, 2.98, 4.23, 4.39, 4.7, 4.28, 4.62)
rma_pre <- mean(rma_pre_vec)
rma_post <- mean(c(4.5, 4.51, 4.39, 4.37, 3.57, 3.49, 3.65, 3.25, 4.37, 4.56, 4.67, 4.59, 4.68))
draper_sd <- weighted_sd(means = rma_pre_vec, ns = rep(2444, length(rma_pre_vec)), sds = c(1.01, .93, .97, 1.08, 1.21, 1.1, 1.17, 1.17, .94, .84, .59, .92, .66))

draper_dim <- dim_calculator(mean_control = rma_pre, mean_treatment = rma_post)
stand_result(eff_type = "d_i_m", raw_effect_size = draper_dim, ctrl_sd = draper_sd, n_t = 2444, n_c = 2444)

## Dschaak -----------------------------------
### not our outcomes

## Exner-Cortens -----------------------------------
stand_result(eff_type = "d", raw_effect_size = .053, n_t = 35, n_c = 39) # t1
stand_result(eff_type = "d", raw_effect_size = -.12, n_t = 25, n_c = 33) # t2

## Feldwisch -----------------------------------
feldwisch_irma_did <- did_calculator(mean_control_pre = 75.83, mean_control_post = 91.81, mean_treatment_pre = 77.62, mean_treatment_post = 93.96)
stand_result(eff_type = "d_i_d", n_t = 30, n_c = 18, raw_effect_size = feldwisch_irma_did, ctrl_sd = 8.32)


#Hahn et al., 2017 -----------------------------------
## rma
stand_result(eff_type = "t_test",raw_effect_size = -2.71, n_t = 4, n_c = 4)

## bystander behavior
hahn_bb_dim <- dim_calculator(mean_treatment = 5.13, mean_control = 8.57)
stand_result(eff_type = "d_i_m",raw_effect_size = hahn_bb_dim, ctrl_sd = 5.24, n_t = 4, n_c = 4)


## Hines -----------------------------------
### in person
hines_ip_post <- dim_calculator(mean_control = 4.06, mean_treatment = 4.24) # post
stand_result(eff_type = "d_i_m", n_t = 12, n_c = 12, ctrl_sd = .55, raw_effect_size = hines_ip_post)

hines_ip_6mo <- dim_calculator(mean_control = 4.06, mean_treatment = 4.23)# in 6 month
stand_result(eff_type = "d_i_m", n_t = 12, n_c = 12, ctrl_sd = .55, raw_effect_size = hines_ip_6mo)

### e-intervention
hines_eint_post <- dim_calculator(mean_control = 4.06, mean_treatment = 4.26) # post
stand_result(eff_type = "d_i_m", n_t = 232, n_c = 232, ctrl_sd = .59, raw_effect_size = hines_eint_post)

hines_eint_6mo <- dim_calculator(mean_control = 4.06, mean_treatment = 4.23) # 6 mo
stand_result(eff_type = "d_i_m", n_t = 107, n_c = 232, ctrl_sd = .59, raw_effect_size = hines_eint_6mo)


#Hines 2017 -----------------------------------
# #in person intervention (bringing in the bystander)
# hines_inperson_dim <- dim_calculator(4.06, 4.24)
# stand_result("d_i_m", raw_effect_size = hines_inperson_dim, .55, 325, 330)
# #6 months later:
# hines_inperson_dim_6 <- dim_calculator(4.06, 4.23)
# stand_result("d_i_m", raw_effect_size = hines_inperson_dim_6, 0.55, 128, 330)
#
# #e-intervention (agent of change)
# hines_eint_dim <- dim_calculator(4.06, 4.26)
# stand_result("d_i_m", raw_effect_size = hines_eint_dim, 0.59, 232, 232)
# #6 months later:
# hines_eint_dim_6 <- dim_calculator(4.06, 4.23)
# stand_result("d_i_m", raw_effect_size = hines_eint_dim_6, 0.59, 232, 107)

#Hust 2017 -----------------------------------
## behavior social cognitive theory condition:
hust1_behavior_did <- did_calculator(mean_treatment_post = 2.66,mean_treatment_pre =  2.04,mean_control_post =  2.45,mean_control_pre =  2.23,sd =  1.41)
stand_result("d_i_d", raw_effect_size = hust1_behavior_did, ctrl_sd = 1.41, n_t =  31, n_c = 31)

#social norms theory magazine:
hust2_behavior_did <- did_calculator(mean_treatment_post = 2.54,mean_treatment_pre =  1.88,mean_control_post =  2.45, mean_control_pre = 2.23,sd =  1.41)
stand_result("d_i_d", raw_effect_size = hust2_behavior_did,ctrl_sd =  1.41, n_t = 38, n_c = 38)

#combined treatment group:
hust3_behavior_did <- did_calculator(mean_treatment_post = 3.2,mean_treatment_pre = 1.89, mean_control_post = 2.45, mean_control_pre = 2.23, sd = 1.41)
stand_result("d_i_d", raw_effect_size = hust3_behavior_did, ctrl_sd = 1.41, n_t =  40, n_c = 40)


## Jaffe et al., 2017 -----------------------------------

#not sure if codable - determine at the next team meeting.

## Jouriles, 2017 -----------------------------------
### lab bystander (high is good)
lab_did <- did_calculator(mean_control_pre = 24.8, mean_control_post = 21.23, mean_treatment_pre = 25.8, mean_treatment_post = 24.89)
stand_result(eff_type = "d_i_d", ctrl_sd = 18.71, n_c = 183, n_t = 180, raw_effect_size = lab_did)

### own bystander
own_did <- did_calculator(mean_control_pre = 24.8, mean_control_post = 21.23, mean_treatment_pre = 28.3, mean_treatment_post = 27.48)
stand_result(eff_type = "d_i_d", ctrl_sd = 18.71, n_c = 183, n_t = 168, raw_effect_size = own_did)

# ### in lab knowledge (high is good)
# knowledge_lab <- did_calculator(mean_control_pre = .83, mean_control_post = .83, mean_treatment_pre = .83, mean_treatment_post = .92)
# stand_result(eff_type = "d_i_d", n_t = 188, n_c = 192, raw_effect_size = knowledge_lab, ctrl_sd = )
stand_result(eff_type = "f_test", n_t = 188, n_c = 188, raw_effect_size = 37.15)


# ### on their own knowledge
# knowledge_own <- did_calculator(mean_control_pre = .83, mean_control_post = .83, mean_treatment_pre = .83, mean_treatment_post = .9)
# stand_result(eff_type = "d_i_d", n_t = 177, n_c = 192, raw_effect_size = knowledge_lab, ctrl_sd = )
stand_result(eff_type = "f_test", n_t = 177, n_c = 177, raw_effect_size = 23.03)

## Lazarevich eet al., 2017 -----------------------------------
lazarevich_did <- did_calculator(mean_treatment_pre = 13.27, mean_treatment_post = 16.16, mean_control_pre = 13.95, mean_control_post = 14.16, sd = 1.26)
stand_result("d_i_d", raw_effect_size = lazarevich_did, ctrl_sd = 1.26, n_t = 111, n_c = 102)

## Leone et al., 2017 -----------------------------------

### not an intervention



#Lemay et al. 2017 -----------------------------------
## i don't think this is an intervention
#high injunctive norms, no descriptive norms vs. no injunctive norms, no descritive norms
# lemay_dim1 <- dim_calculator(7.56, 7.88)
# stand_result("d_i_m", lemay_dim1, 0.86, 62, 62)
#
# #high descriptive norms, no injunctive norms vs. no injunctive norms, no descriptive norms
# lemay_dim2 <- dim_calculator(7.56, 8.18)
# stand_result("d_i_m", lemay_dim2, 0.86, 62, 62)
#
# #high injunctive norms, high descriptive norms vs. no injunctive norms no descriptive norms
# lemay_dim3 <- dim_calculator(7.56, 7.82)
# stand_result("d_i_m", lemay_dim3, 0.86, 62, 62)

## Leonard  -----------------------------------
stand_result(eff_type = "d", raw_effect_size = .35, n_t = 76, n_c = 76, ctrl_sd = 11.6)

#Rominski et al., 2017 -----------------------------------
## males sig better women sig nothing
stand_result(eff_type = "d", raw_effect_size = 0, n_t = 71, n_c = 71)

## Rowley -----------------------------------
## we don't use these outcomes


#Sargent et al., 2016 -----------------------------------
sargent_did <- did_calculator(4.81, 4.43, 4.35, 4.25, 3.71)
stand_result("d_i_d", raw_effect_size = sargent_did, 3.71, 29, 28)

#Senn et al., 2017 -----------------------------------
### completed rape
senn_post <- log_odds_ratio(n_control = 442, n_treatment = 451, percent_control = .014, percent_treatment = .011) # 1 week post
stand_result(eff_type = "log_odds_ratio", raw_effect_size = senn_post, n_t = 451, n_c = 442)

senn_6mo <- log_odds_ratio(n_control = 434, n_treatment = 445, percent_control = .064, percent_treatment = .027) # 6 mo
stand_result(eff_type = "log_odds_ratio", raw_effect_size = senn_6mo, n_t = 445, n_c = 434)

senn_12mo <- log_odds_ratio(n_control = 427, n_treatment = 439, percent_control = .098, percent_treatment = .052) # 12 mo
stand_result(eff_type = "log_odds_ratio", raw_effect_size = senn_12mo, n_t = 439, n_c = 427)

senn_18mo <- log_odds_ratio(n_control = 412, n_treatment = 424, percent_control = .109, percent_treatment = .072) # 18 mo
stand_result(eff_type = "log_odds_ratio", raw_effect_size = senn_18mo, n_t = 424, n_c = 412)

senn_24mo <- log_odds_ratio(n_control = 185, n_treatment = 185, percent_control = .118, percent_treatment = .081) # 24 mo
stand_result(eff_type = "log_odds_ratio", raw_effect_size = senn_24mo, n_t = 185, n_c = 185)

## rape myth acceptance
senn_rma_sd <- se_2_sd(se = .6, n = 435)
senn_rma_post <- did_calculator(mean_control_pre = 31.9, mean_treatment_pre = 32.1, sd = senn_rma_sd, mean_control_post = 32.2, mean_treatment_post = 23.7) # post
stand_result(eff_type = "d_i_d", ctrl_sd = senn_rma_sd, raw_effect_size = senn_rma_post, n_t = 430, n_c = 421)

senn_rma_6mo <- did_calculator(mean_control_pre = 31.9, mean_treatment_pre = 32.1, sd = senn_rma_sd, mean_control_post = 32, mean_treatment_post = 25.4) # 6 mo
stand_result(eff_type = "d_i_d", ctrl_sd = senn_rma_sd, raw_effect_size = senn_rma_6mo, n_t = 431, n_c = 418)

senn_rma_12mo <- did_calculator(mean_control_pre = 31.9, mean_treatment_pre = 32.1, sd = senn_rma_sd, mean_control_post = 30.8, mean_treatment_post = 25.3) # 12 mo
stand_result(eff_type = "d_i_d", ctrl_sd = senn_rma_sd, raw_effect_size = senn_rma_12mo, n_t = 419, n_c = 411)

senn_rma_18mo <- did_calculator(mean_control_pre = 31.9, mean_treatment_pre = 32.1, sd = senn_rma_sd, mean_control_post = 29.2, mean_treatment_post = 25.1) # 18 mo
stand_result(eff_type = "d_i_d", ctrl_sd = senn_rma_sd, raw_effect_size = senn_rma_18mo, n_t = 408, n_c = 394)

senn_rma_24mo <- did_calculator(mean_control_pre = 31.9, mean_treatment_pre = 32.1, sd = senn_rma_sd, mean_control_post = 29, mean_treatment_post = 24.8) # 24 mo
stand_result(eff_type = "d_i_d", ctrl_sd = senn_rma_sd, raw_effect_size = senn_rma_24mo, n_t = 177, n_c = 181)


## Sosa-Rubi -----------------------------------
### victimization
sosa_vict_ind_female <- mean(c(1.2, 3.52, -.09))
sosa_vict_ind_male <- mean(c(-11.1, -6, -3.38))
(sosa_vict_ind_dim <- weighted.mean(x = c(sosa_vict_ind_female, sosa_vict_ind_male),
                                    w = c(143, 149)))
stand_result(eff_type = "d_i_m", raw_effect_size = sosa_vict_ind_dim, n_t = 143+149, n_c = 143+149, no.sd.given = T)

sosa_vict_school_female <- mean(c(0., .3, 2.96))
sosa_vict_school_male <- mean(c(-9.08, -7.84, -2.45))
(sosa_vict_school_dim <- weighted.mean(x = c(sosa_vict_school_female, sosa_vict_school_male),
                                       w = c(183, 224)))
stand_result(eff_type = "d_i_m", raw_effect_size = sosa_vict_school_dim, n_t = 183 + 224, n_c = 183+224, no.sd.given = T)

### perp
sosa_perp_ind_female <- mean(c(-.15, 2.8, 1.43))
sosa_perp_ind_male <- mean(c(-15.57, -6.71, 5.43))
(sosa_perp_ind_dim <- weighted.mean(x = c(sosa_perp_ind_female, sosa_perp_ind_male), w = c(143, 149)))
stand_result(eff_type = "d_i_m", raw_effect_size = sosa_perp_ind_dim, n_t = 143+149, n_c = 143+149, no.sd.given = T)

sosa_perp_school_female <- mean(c(.58, -.31, -1.06))
sosa_perp_school_male <- mean(c(-8.58, -6.82, 5.67))
(sosa_perp_school_dim <- weighted.mean(x = c(sosa_perp_school_female, sosa_perp_school_male), w = c(183, 224)))
stand_result(eff_type = "d_i_m", raw_effect_size = sosa_perp_school_dim, n_t = 183 + 224, n_c = 183+224, no.sd.given = T)



## Suga -----------------------------------
### not coding b/c domestic violence

#Taylor et al., 2017 -----------------------------------

# 2016 =================================

## Chiriboga -----------------------------------
stand_result(eff_type = "d_i_m", no.sd.given = T, n_t = 34, n_c = 42, raw_effect_size = 1.92)

#de Lijster et al., 2016 -----------------------------------

deLijster_did_vict <- did_calculator(mean_treatment_post = 0.58,mean_treatment_pre =  0.70,mean_control_post =  0.69,mean_control_pre =  0.61,sd =  1.22)
stand_result("d_i_d", deLijster_did_vict, ctrl_sd =  1.22, n_t =  14, n_c =  10)

delijster_did_perp <- did_calculator(mean_treatment_post = .61, mean_treatment_pre = .41, mean_control_post = .84, mean_control_pre = .42, sd = .78)
stand_result(eff_type = "d_i_d", raw_effect_size = delijster_did_perp, ctrl_sd = .78, n_t = 14, n_c = 10)

# Dupain -----------------------------------
dupain_log_odds <- log_odds_ratio(percent_control = .032, percent_treatment = .028, n_treatment = 1052, n_control = 1052)
stand_result(eff_type = "log.odds_ratio", raw_effect_size = dupain_log_odds, n_t = 1052, n_c = 1052)

#Elias Lambert et al., 2016 -----------------------------------
#IRMAS-SF

## Gage -----------------------------------
### same as gage 2014

## Gedney -----------------------------------
stand_result(eff_type = "d", raw_effect_size = .12, n_t = 25, n_c = 25) # standard
stand_result(eff_type = "d", raw_effect_size = .21, n_t = 26, n_c = 26) # standard + motivational interviewing

## Jaime -----------------------------------
advocate_led <- dim_calculator(mean_control = .16, mean_treatment = .25)
stand_result(eff_type = "d_i_m", raw_effect_size = advocate_led, n_t = 68, n_c = 68, ctrl_sd = .66)

coach_led <- dim_calculator(mean_control = .5, mean_treatment = .47)
stand_result(eff_type = "d_i_m", raw_effect_size = coach_led, ctrl_sd = .95, n_t = 78, n_c = 79)

## Jouriles a -----------------------------------
### study 1 bystander behavior
### higher is better
study1_jouriles <- did_calculator(mean_treatment_pre = 30.83, mean_treatment_post = 28.5, mean_control_pre = 27.95, mean_control_post = 21.35, sd = 19.02)
stand_result(eff_type = "d_i_d", n_t = 109, n_c = 100, ctrl_sd = 19.02, raw_effect_size = study1_jouriles)

### study 2 bystander behavior
study2_jouriles <- did_calculator(mean_control_pre = 34.13, mean_control_post = 33.97, mean_treatment_pre = 31.12, mean_treatment_post = 38.56, sd = 22.36)
stand_result(eff_type = "d_i_d", raw_effect_size = study2_jouriles, n_t = 93, n_c = 87, ctrl_sd = 22.36)

## Jouriles b -----------------------------------
## no causal interference not coding

## Kesley -----------------------------------
### this is a safe sex intervention

## Levesque -----------------------------------
### not primary preventio

## Mabry -----------------------------------
### not relevant outcomes

## Michaels -----------------------------------
### acceptibility a woman can refuse sex
acceptibility <- weighted_average(men_average = 21.9, women_average = 19, n_men = 768, n_women = 599)
n_treatment = 768 + 599
n_control = 634 + 529

stand_result(eff_type = "log_odds_ratio", raw_effect_size = acceptibility, n_t = n_treatment, n_c = n_control)

### behavior 
stand.result(eff.type = "log.odds.ratio", u.s.d = -6, n.t = n_treatment, n.c = n_control)

## Senn -----------------------------------
bystander_baseline_control <- mean(c(6.45, 2.82, .43,.27, 4.3, 2.14, 8.67, 2.26))
bystander_3month_control <- mean(c(5.88, 2.94, .9, 4.14, 4.4, 2.57, 7.53, 2.42))
bystander_baseline_intervention <- mean(c(7.41, 3.18, .75, .37, 4.76, 2.39, 9.15, 2.72))
bystander_3month_intervention <- mean(c(8.38, 4.62, 1.45, 4.46, 7.36, 4.76, 8.16, 3.33))

senn_se <- c(.722, .446, .174, .085, .405, .272, .39, .254)
senn_sds <- se_2_sd(senn_se, 309)
senn_weighted_sd <- weighted_sd(sds = senn_sds, ns = rep(309, length(senn_sds)), means = c(6.45, 2.82, .43,.27, 4.3, 2.14, 8.67, 2.26))

senn_did <- did_calculator(mean_treatment_post = bystander_3month_intervention, mean_treatment_pre = bystander_baseline_intervention, mean_control_post = bystander_3month_control, mean_control_pre = bystander_baseline_control, sd = senn_weighted_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = senn_did, n_t = 518, n_c = 309, ctrl_sd = senn_weighted_sd)

## Shaw -----------------------------------
### same data as banyard 2007

## Taylor -----------------------------------
### victmization
stand_result(eff_type = "odds_ratio", n_c = 3, n_t = 9, raw_effect_size = -.02+1) # 6, 7, 8
stand_result(eff_type = "odds_ratio", n_c = 3, n_t = 3, raw_effect_size = -.04+1) # 6, 7
stand_result(eff_type = "odds_ratio", n_c = 3, n_t = 4, raw_effect_size = .02) # 12 mo
stand_result(eff_type = "odds_ratio", n_c = 3, n_t = 2, raw_effect_size = -.06+1)

### perpetration
stand_result(eff_type = "odds_ratio", n_c = 3, n_t = 9, raw_effect_size = -.07 + 1) # 6, 7, 8
stand_result(eff_type = "odds_ratio", n_c = 3, n_t = 3, raw_effect_size = -.06 + 1) # 6, 7
stand_result(eff_type = "odds_ratio", n_c = 3, n_t = 4, raw_effect_size = -.01 + 1) # 12 mo
stand_result(eff_type = "odds_ratio", n_c = 3, n_t = 2, raw_effect_size = 0 + 1)

## van Lieshout -----------------------------------
### lower is better 
vanlieshout_post <- did_calculator(mean_treatment_pre = 1.81, mean_control_pre = 2.2, mean_control_post = 2.1, mean_treatment_post = 1.79)
stand_result(eff_type = "d_i_d", n_t = 10, n_c = 10, ctrl_sd = 1.39, raw_effect_size = vanlieshout_post)

vanlieshout_6mo <- did_calculator(mean_treatment_pre = 1.81, mean_control_pre = 2.2, mean_control_post = 1.85, mean_treatment_post = 1.75)
stand_result(eff_type = "d_i_d", n_t = 10, n_c = 10, ctrl_sd = 1.39, raw_effect_size = vanlieshout_6mo)


# 2015 =================================
source("Results_standardizeR.R")

## Amar -----------------------------------
amar_did <- did_calculator(mean_treatment_post = 27.43, mean_treatment_pre = 30.73, mean_control_post = 31.82, mean_control_pre = 34.2)
stand_result(eff_type = "d_i_d", raw_effect_size = amar_did, ctrl_sd = 7.67, n_t = 37, n_c = 64)


## Brokenshire -----------------------------------
### low is good, pg 62
exp <- mean(c(2.52, 1.81, 2.33, 1.73))
con <- mean(c(2.26, 1.42, 2, 1.35))
brokenshire_sd <- weighted_sd(ns = rep(65, 4), means = c(2.26, 1.42, 2, 1.35), sds = c(1.24, .71, .98, .65))
brokenshire_dim <- dim_calculator(mean_control = con, mean_treatment = exp)

stand_result(eff_type = "d_i_m", n_t = 63, n_c = 65, raw_effect_size = brokenshire_dim, ctrl_sd = brokenshire_sd)

# Cares -----------------------------------
# post, 2 weeks later
## Rape Myth
### lower is good
cares_rape_myth <- did_calculator(mean_control_post = 1.95, mean_control_pre = 2.15, # program
                                  mean_treatment_post = 1.68, mean_treatment_pre = 2.07, sd = 1.13)
stand_result(eff_type = "d_i_d", raw_effect_size = cares_rape_myth, ctrl_sd = 1.13, n_t = 1, n_c = 1)

# 1 year later
## Rape Myth
### program and smc
cares_rape_myth_1year <- dim_calculator(mean_control = 2.15, mean_treatment = 1.67) # pre post
stand_result(eff_type = "d_i_m", raw_effect_size = cares_rape_myth_1year, ctrl_sd = 1.12, n_t = 1, n_c = 1)

### smc only
cares_rape_myth_1year_smc <- dim_calculator(mean_control = 2.34, mean_treatment = 1.74) # pre post
stand_result(eff_type = "d_i_m", raw_effect_size = cares_rape_myth_1year_smc, ctrl_sd = 1.16, n_t = 1, n_c = 1)

## Coker 2015 -----------------------------------
## vict
stand_result("t_test", raw_effect_size = -2.22, n_t = 1, n_c = 2) # (victimization)
## perp
stand_result("t_test", raw_effect_size = .9, n_t = 1, n_c = 2) # perp


## Connolly -----------------------------------
# This study compares "usual practice" to intervention. So I am using pre post rather than DID
### Youth Lead Program
### this is school program so perhaps need to change n
#### Sexual Harassment victimization (higher score is bad)
## 4 month gap
ylp_sh <- dim_calculator(mean_control = 1.17, mean_treatment = 1.20)
stand_result("d_i_m", ylp_sh, ctrl_sd = .34, n_t = 1, n_c = 1)

#### Dating Aggression Knowledge
con_know <- dim_calculator(mean_control = .66, mean_treatment = .73)
stand_result(eff_type = "d_i_m", raw_effect_size = con_know, ctrl_sd = .16, n_t = 1, n_c = 1)

### Usual Practice Program
#### Sexual Harassment
upp_sh <- dim_calculator(mean_control = 1.18, mean_treatment = 1.21)
stand_result("d_i_m", upp_sh, ctrl_sd = .32, n_c = 1, n_t = 1)

#### Dating Aggression Knowledge
con_know_usual <- dim_calculator(mean_control = .66, mean_treatment = .69)
stand_result(eff_type = "d_i_m", raw_effect_size = con_know_usual, ctrl_sd = .15, n_t = 1, n_c = 1)

## Daigneault -----------------------------------
rma_post <- did_calculator(mean_treatment_pre = 8.23, mean_control_pre = 7.91, mean_treatment_post = 8.99, mean_control_post = 7.7, sd = 1.23)
stand_result(eff_type = "d_i_d",n_t = 1, n_c = 1, ctrl_sd = 1.23, raw_effect_size = rma_post)

rma_follow <- did_calculator(mean_treatment_pre = 8.23, mean_control_pre = 7.91, mean_treatment_post = 8.98, mean_control_post = 7.77, sd = 1.23)
stand_result(eff_type = "d_i_d",n_t = 1, n_c = 1, ctrl_sd = 1.23, raw_effect_size = rma_follow)

###### perp/vict
vict_post <- log_odds_ratio(n_control = 249, n_treatment = 177, percent_control = .04, percent_treatment = .01)
stand_result(eff_type = "log.odds_ratio", n_t = 1, n_c = 1, raw_effect_size = vict_post)

perp_post <- log_odds_ratio(n_control = 257, n_treatment = 183, percent_control = .02, percent_treatment = .01)
stand_result(eff_type = "log.odds_ratio", n_t = 1, n_c = 1, raw_effect_size = perp_post)

vict_follow <- log_odds_ratio(n_control = 206, n_treatment = 152, percent_control = .05, percent_treatment = .03)
stand_result(eff_type = "log.odds_ratio", n_t = 1, n_c = 1, raw_effect_size = vict_follow)

perp_follow <- log_odds_ratio(n_control = 221, n_treatment = 165, percent_control = .01, percent_treatment = .02)
stand_result(eff_type = "log.odds_ratio", n_t = 1, n_c = 1, raw_effect_size = perp_follow)

# Dallager -----------------------------------
## they are adjusted means
stand_result(eff_type = "f_test", raw_effect_size = 7.17, n_t = 97, n_c = 48)


## Espelage -----------------------------------
### there are two other papers the look at sooner time points
### higher score is bad
### sexual harassment direct effects model
espelage_sd <- se_2_sd(.012, n = 1941 + 1710)
stand_result("reg_coef", raw_effect_size = .005, ctrl_sd = espelage_sd, n_t = 18, n_c = 18)


# Gidycz -----------------------------------
## self protective behavior
## 4 month
# gidycz_sd <- se_2_sd(se = 1.3, n = 296)
# gidycz_spb_4month <- did_calculator(mean_control_post = 49.6, mean_control_pre = 50.29, mean_treatment_pre = 48.57, mean_treatment_post = 52.7, sd = gidycz_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = gidycz_spb_4month, ctrl_sd = gidycz_sd, n_t = 207, n_c = 296)
## 7 month
# gidycz_spb_7month <- did_calculator(mean_control_post = 49.64, mean_control_pre = 50.29, mean_treatment_pre = 48.57, mean_treatment_post = 52.31, sd = gidycz_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = gidycz_spb_7month, ctrl_sd = gidycz_sd, n_t = 207, n_c = 296)
# ## rsa
# gidycz_sd <- se_2_sd(se = 1.3, n = 296)
# gidycz_rsa_4month <- did_calculator(mean_control_post = 52.13, mean_control_pre = 53.56, mean_treatment_pre = 54.87, mean_treatment_post = 57.15, sd = gidycz_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = gidycz_rsa_4month, ctrl_sd = gidycz_sd, n_t = 207, n_c = 296)
# ## 7 month
# gidycz_rsa_7month <- did_calculator(mean_control_post = 52.72, mean_control_pre = 53.56, mean_treatment_pre = 54.87, mean_treatment_post = 59.17, sd = gidycz_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = gidycz_rsa_7month, ctrl_sd = gidycz_sd, n_t = 207, n_c = 296)
## rse

gidycz_sd <- se_2_sd(se = .88, n = 296)
gidycz_rse_4month <- did_calculator(mean_control_post = 35.85, mean_control_pre = 37.04, mean_treatment_pre = 38.45, mean_treatment_post = 39.58, sd = gidycz_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = gidycz_rse_4month, ctrl_sd = gidycz_sd, n_t = 207, n_c = 296)
## 7 month
gidycz_rse_7month <- did_calculator(mean_control_post = 38.63, mean_control_pre = 37.04, mean_treatment_pre = 38.45, mean_treatment_post = 38.7, sd = gidycz_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = gidycz_rse_7month, ctrl_sd = gidycz_sd, n_t = 207, n_c = 296)


## Gilmore -----------------------------------
### not an intervention

## Gonzales-Guarda -----------------------------------
cont_vict_1week <- weighted.mean(w = c(15, 26), x = c(.4, .385))
cont_vict_3month <- weighted.mean(w = c(15, 26), x = c(.4, .385))
cont_vict_12month <- weighted.mean(w = c(15, 26), x = c(.4, .385))
cont_perp_1week <- weighted.mean(w = c(15, 26), x = c(.333, .346))
cont_perp_3month <- weighted.mean(w = c(15, 26), x = c(.4, .308))
cont_perp_12month <- weighted.mean(w = c(15, 26), x = c(.4, .462))

tre_vict_1week <- weighted.mean(w = c(21, 20), x = c(.19, .35))
tre_vict_3month <- weighted.mean(w = c(21, 20), x = c(.238, .35))
tre_vict_12month <- weighted.mean(w = c(21, 20), x = c(.286, .55))
tre_perp_1week <- weighted.mean(w = c(21, 20), x = c(.19, .3))
tre_perp_3month <- weighted.mean(w = c(21, 20), x = c(.143, .30))
tre_perp_12month <- weighted.mean(w = c(21, 20), x = c(.286, .45))

vict_1 <- log_odds_ratio(n_control = 41, n_treatment = 41, percent_control = cont_vict_1week, percent_treatment = tre_vict_1week)
stand_result(eff_type = "log.odds_ratio", n_t = 41, n_c = 41, raw_effect_size = vict_1)

vict_3mo <- log_odds_ratio(n_control = 41, n_treatment = 41, percent_control = cont_vict_3month, percent_treatment = tre_vict_3month)
stand_result(eff_type = "log.odds_ratio", n_t = 41, n_c = 41, raw_effect_size = vict_3mo)

vict_12mo <- log_odds_ratio(n_control = 41, n_treatment = 41, percent_control = cont_vict_12month, percent_treatment = tre_vict_12month)
stand_result(eff_type = "log.odds_ratio", n_t = 41, n_c = 41, raw_effect_size = vict_12mo)

perp_1 <- log_odds_ratio(n_control = 41, n_treatment = 41, percent_control = cont_perp_1week, percent_treatment = tre_perp_1week)
stand_result(eff_type = "log.odds_ratio", n_t = 41, n_c = 41, raw_effect_size = perp_1)

perp_3mo <- log_odds_ratio(n_control = 41, n_treatment = 41, percent_control = cont_perp_3month, percent_treatment = tre_perp_3month)
stand_result(eff_type = "log.odds_ratio", n_t = 41, n_c = 41, raw_effect_size = perp_3mo)

perp_12mo <- log_odds_ratio(n_control = 41, n_treatment = 41, percent_control = cont_perp_12month, percent_treatment = tre_perp_12month)
stand_result(eff_type = "log.odds_ratio", n_t = 41, n_c = 41, raw_effect_size = perp_12mo)

## Hines & Reed a -- (study was in 2010) -----------------------------------
### posttest(1 week after)
#### IRMA
hines_irma_post <- dim_calculator(mean_control = 29.2, mean_treatment = 27.17)
stand_result("d_i_m", hines_irma_post, ctrl_sd = 8.25, n_t = 116, n_c = 218)
#### Bystander Behaviors
hines_bb_post <- dim_calculator(mean_control = 9.84, mean_treatment = 10.99)
stand_result("d_i_m", hines_bb_post, ctrl_sd = 5.66, n_t = 116, n_c = 218)

### 6 month follow up
#### IRMA
# higher bad
hines_irma_6month <- dim_calculator(mean_control = 29.2, mean_treatment = 25.73)
stand_result("d_i_m", hines_irma_6month, ctrl_sd = 8.25, n_t = 97, n_c = 218)

#### Bystander Behaviors
# high good
hines_bb_6month <- dim_calculator(mean_control = 9.84, mean_treatment = 10.68)
stand_result("d_i_m", hines_bb_6month, ctrl_sd = 5.66, n_t = 97, n_c = 218)


## Hines & Reed b -- (study was in 2011 ) -----------------------------------
### IRMA post (pg 288)
hinesb_irma_post <- dim_calculator(mean_control = 26.7, mean_treatment = 24.61)
stand_result("d_i_m", hinesb_irma_post, ctrl_sd = 8.88, n_t = 56, n_c = 174)

### IRMA 6 month
hinesb_irma_6month <- dim_calculator(mean_control = 26.7, mean_treatment = 24.5)
stand_result("d_i_m", hinesb_irma_6month, ctrl_sd = 8.88, n_t = 102, n_c = 174)

### Bystand behavior ratio 6 months
hinesb_bb_6month <- dim_calculator(mean_control = .76, mean_treatment = .79)
stand_result("d_i_m", hinesb_bb_6month, ctrl_sd = .28, n_t = 102, n_c = 174)


# Jozkowski -----------------------------------
jozkowski_rma <- dim_calculator(mean_control = 1.8, mean_treatment = 1.73)
stand_result(eff_type = "d_i_m", raw_effect_size = jozkowski_rma, ctrl_sd = .748, n_c = 123, n_t = 123)

## Keller -----------------------------------
stand_result(eff_type = "d", raw_effect_size = 1.61, n_t = 29, n_c = 29) # Your moment of truth
stand_result(eff_type = "d", raw_effect_size = -.23, n_t = 7, n_c = 7) # Standard of Care 

##  Kleinhasser -----------------------------------
### higher is better  
kleinhasser_bystander <- did_calculator(mean_treatment_pre = 8.09, mean_treatment_post = 5.84, mean_control_pre = 6.51, mean_control_post = 4.92)
stand_result(eff_type = "d_i_d", raw_effect_size = kleinhasser_bystander, ctrl_sd = 5.13, n_c = 50, n_t= 45)

# kleinhasser_bystander_friends <- did_calculator(mean_treatment_pre = 1.52, mean_treatment_post = 1.39, mean_control_post = .84, mean_control_pre = 1.31, sd = 1.43)
# stand_result(eff_type = "d_i_d", raw_effect_size = kleinhasser_bystander_friends, ctrl_sd = 5.21, n_c = 50, n_t= 45)

# Love 2015 -----------------------------------
love <- 0

## McMahon  a-----------------------------------
## i am not doing bystander intention or rape myths because they break down their scale too much.
## observational study
# stand_result("f_test", raw_effect_size = 0.019, ctrl_sd = 15.64, n_t = 1636, n_c = 1952)

## McMahon b -----------------------------------
## not doing bystander intention b/c break down too much
# t1 is pre (aug-sep). t2 ~1 month (sep). t3 dec ~ 3 month, t4 feb mar ~5 month, t5 sep ~1 year.
### HELP ####


# Menning -----------------------------------
### behavior
menning_sd <- se_2_sd(4.282, n = 35+171)
stand_result(eff_type = "log_odds_ratio", raw_effect_size = -8.491, ctrl_sd = menning_sd, n_t = 35, n_c = 171)

### attitude post
menning_post <- dim_calculator(mean_control = 3.647, mean_treatment = 3.225)
stand_result(eff_type = "d_i_m", raw_effect_size = menning_post, n_c = 29, n_t = 41, ctrl_sd = 0.774)

### 6 weeks
menning_post_6weeks <- did_calculator(mean_treatment_pre = 3.225, mean_treatment_post = 3.719, mean_control_pre = 3.647, mean_control_post = 3.441, sd = 0.636)
stand_result(eff_type = "d_i_d", raw_effect_size = menning_post_6weeks, n_c = 29, n_t = 41, ctrl_sd = 0.636)


### 6 months
menning_post_6months <- did_calculator(mean_treatment_pre = 3.225, mean_treatment_post = 3.705, mean_control_pre = 3.647, mean_control_post = 3.686, sd = 0.636)
stand_result(eff_type = "d_i_d", raw_effect_size = menning_post_6months, n_c = 171, n_t = 35, ctrl_sd = 0.636)

## Miller -----------------------------------
miller_n <- 1517
miller_sd <- se_2_sd(se = .04, miller_n)
wave1_vict_sd <- se_2_sd(se = .03, miller_n)

stand_result(eff_type = "reg_coef", n_t = 4, n_c = 4, raw_effect_size = .04, ctrl_sd = miller_sd) # perp wave 2
stand_result(eff_type = "reg_coef", n_t = 4, n_c = 4, raw_effect_size = .05, ctrl_sd = wave1_vict_sd) # vict wave 2
stand_result(eff_type = "reg_coef", n_t = 4, n_c = 4, raw_effect_size = -.00, ctrl_sd = miller_sd) # perp wave 4
stand_result(eff_type = "reg_coef", n_t = 4, n_c = 4, raw_effect_size = -.00, ctrl_sd = wave1_vict_sd) # vict wave 4

# Moor (2 high schools) -----------------------------------

## attitudes
stand_result(eff_type = "f_test", raw_effect_size = 0, n_t = 394, n_c = 394)

## behaviors
stand_result(eff_type = "f_test", raw_effect_size = 11.05, n_t = 394, n_c = 394)

# Moynihan -----------------------------------
## control group subjected to social media campaign
## program total friend, total stranger pre
pre_moynihan <- mean(c(.42, .15))
moynihan_sd <- weighted_sd(sds = c(.32, .12), means = c(.42, .15), ns = c(154, 154))

## program total friend, total stranger post
post_moynihan <- mean(c(.37, .08))

moynihan_dim <- dim_calculator(mean_control = pre_moynihan, mean_treatment = post_moynihan)
stand_result(eff_type = "d_i_m", raw_effect_size = moynihan_dim, ctrl_sd = moynihan_sd, n_t = 154, n_c = 154)

## Rosenstein -----------------------------------
# Not code-able because only compares 1 treatment with 2 treatments, not pre-post


## Reed -----------------------------------
## (best judgement for group sizes )
### IRMA
####  pre - post bystander
reed_bystander_irma <- dim_calculator(mean_control = 29.52, mean_treatment = 27.53)
stand_result(eff_type = "d_i_m", raw_effect_size = reed_bystander_irma, ctrl_sd = 8.18, n_t = 89, n_c = 291)

####  pre - post psychoeducation
reed_psycho_irma <- dim_calculator(mean_control =29.36, mean_treatment = 27.78)
stand_result(eff_type = "d_i_m", raw_effect_size = reed_psycho_irma, ctrl_sd = 8.5, n_t = 89, n_c = 291)


####  pre - 6month bystander
reed_bystander_irma_6 <- dim_calculator(mean_control = 29.52, mean_treatment = 27.30)
stand_result(eff_type = "d_i_m", raw_effect_size = reed_bystander_irma, ctrl_sd = 8.18, n_t = 103, n_c = 291)

####  pre - 6month psychoeducation
reed_psycho_irma_6 <- dim_calculator(mean_control =29.36, mean_treatment = 26.99)
stand_result(eff_type = "d_i_m", raw_effect_size = reed_psycho_irma_6, ctrl_sd = 8.5, n_t = 103, n_c = 291)

### Bystander Efficacy
####  pre - post bystander
reed_bystander_bystander <- dim_calculator(mean_control = 138.09, mean_treatment = 132.66)
stand_result(eff_type = "d_i_m", raw_effect_size = reed_bystander_bystander, ctrl_sd = 24.37, n_t = 89, n_c = 291)


####  pre - post psychoeducation
reed_psycho_bystander <- dim_calculator(mean_control = 143.12, mean_treatment = 140.99)
stand_result(eff_type = "d_i_m", raw_effect_size = reed_psycho_bystander, ctrl_sd = 22.46, n_t = 89, n_c = 291)


####  pre - 6month bystander
reed_bystander_bystander_6 <- dim_calculator(mean_control = 138.09, mean_treatment =140.66)
stand_result(eff_type = "d_i_m", raw_effect_size = reed_bystander_bystander_6, ctrl_sd = 24.37, n_t = 103, n_c = 291)

####  pre - 6month psychoeducation
reed_psycho_bystander_6 <- dim_calculator(mean_control = 143.12, mean_treatment = 137.60)
stand_result(eff_type = "d_i_m", raw_effect_size = reed_psycho_bystander_6, ctrl_sd = 22.46, n_t = 103, n_c = 291)

## Senn ----------------------------------- 
### pg 2332 unclear to me that this is different than senn 2017
senn_log <- log_odds_ratio(n_control = 420, n_treatment = 430, percent_control = .098, percent_treatment = .052)
stand.result(eff.type = "log.odds.ratio", u.s.d = senn_log, n.t = 430, n.c = 420)

## Taylor et al -----------------------------------
# these are adjusted odds ratio. i am using the gender subgroup effects model instead of the prior history model
# victimization frequency
# i think this is same as Taylor final report (2011)
# stand_result(eff_type = "odds_ratio", raw_effect_size = .71, n_c = , n_t = ) # building
# stand_result(eff_type = "odds_ratio", raw_effect_size = .98, n_c = , n_t = ) # classroom
# stand_result(eff_type = "odds_ratio", raw_effect_size = .73, n_c = , n_t = ) # both


# Parker -----------------------------------
## not using b/c abused women


## Weisz -----------------------------------
### same as weisz 2001

## Williams ----------------------------------

# 2014 =================================

## Alexander
alexander_factor5 <- dim_calculator(mean_control = 2.14, mean_treatment = 1.98)
stand_result(eff_type = "d_i_m", alexander_factor5,
              ctrl_sd = 1.09, n_t = 483, n_c = 483) # have roni take a look at the n. there are lots of primary objectives ask her about that too



## Anton -----------------------------------
### kesh pg 87
n_female = 79 / 4
n_male = 75 / 4
n_participants = 154 / 4

### expert / strong
es_sd <- weighted_sd(ns = c(n_male, n_female), sds = c(.22, .19), means = c(.23, .26))

es_pre <- weighted_average(n_men = n_male, n_women = n_female, men_average = .23, women_average = .26)
es_post <- weighted_average(n_men = n_male, n_women = n_female,men_average = .59, women_average = .68)

es_dim <- dim_calculator(mean_control = es_pre, mean_treatment = es_post)
stand_result(eff_type = "d_i_m", raw_effect_size = es_dim, n_t = n_participants, n_c = n_participants, ctrl_sd = es_sd)

### expert / weak
ew_sd <- weighted_sd(ns = c(n_male, n_female), sds = c(.24, .17), means = c(.29, .19))
ew_pre <- weighted_average(n_men = n_male, n_women = n_female, men_average = .29, women_average = .19)
ew_post <- weighted_average(n_men = n_male, n_women = n_female, men_average = .66, women_average = .6)

ew_dim <- dim_calculator(mean_control = ew_pre, mean_treatment = ew_post)
stand_result(eff_type = "d_i_m", raw_effect_size = ew_dim, n_t = n_participants, n_c = n_participants, ctrl_sd = ew_sd)

### nonexpert / strong
ns_sd <- weighted_sd(ns = c(n_male, n_female), sds = c(.23, .21), means = c(.27, .23))

ns_pre <- weighted_average(n_men = n_male, n_women = n_female, men_average = .27, women_average = .23)
ns_post <- weighted_average(n_men = n_male, n_women = n_female, men_average = .67, women_average = .63)

ns_dim <- dim_calculator(mean_control = ns_pre, mean_treatment = ns_post)
stand_result(eff_type = "d_i_m", raw_effect_size = ns_dim, n_t = n_participants, n_c = n_participants, ctrl_sd = ns_sd)

### nonexpert weak
nw_sd <- weighted_sd(ns = c(n_male, n_female), sds = c(.2, .2), means = c(.36, .19))
nw_pre <- weighted_average(n_men = n_male, n_women = n_female, men_average = .36, women_average = .19)
nw_post <- weighted_average(n_men = n_male, n_women = n_female, men_average = .67, women_average = .64)

nw_dim <- dim_calculator(mean_control = nw_pre, mean_treatment = nw_post)
stand_result(eff_type = "d_i_m", raw_effect_size = nw_dim, n_t = n_participants, n_c = n_participants, ctrl_sd = nw_sd)


## Asgharzade -----------------------------------
# on hold can't find clean result

## austrian -----------------------------------
# wrong direction
austrian_2014 <- odds_ratio(n_control = 451, n_treatment = 451,
                            percent_control = .07, percent_treatment = .08)
stand_result(eff_type = "odds_ratio", raw_effect_size = austrian_2014, n_t = 451, n_c = 451)


## Baker -----------------------------------
bi_pre <- weighted.mean(x = c(3.61, 5 - 2.22), w = c(9, 7))
bi_post <- weighted.mean(x = c(4.2, 5 - 1.57), w = c(9, 7))
bi_follow <- weighted.mean(x = c(4.11, 5 - 1.68), w = c(9, 7))


bc_pre <- weighted.mean(x = c(3.52, 5 - 2.31), w = c(9, 7))
bc_post <- weighted.mean(x = c(3.54, 5 - 2.21), w = c(9, 7))
bc_follow <- weighted.mean(x = c(3.59, 5 - 2.19), w = c(9, 7))
bc_sd <- weighted_sd(ns = c(9, 7), sds = c(.41, .57), means = c(3.52, 5 - 2.31))

baker_post_did <- did_calculator(mean_control_pre = bc_pre, mean_treatment_pre = bi_pre, mean_control_post = bc_post, mean_treatment_post = bi_post, sd = bc_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = baker_post_did, ctrl_sd = bc_sd, n_t = 63, n_c = 69)

### 1 month follow up
baker_follow_did <- did_calculator(mean_control_pre = bc_pre, mean_treatment_pre = bi_pre, mean_control_post = bc_follow, mean_treatment_post = bi_follow, sd = bc_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = baker_follow_did, ctrl_sd = bc_sd, n_t = 63, n_c = 70)

## Boafo -----------------------------------
### this is a health intervention, but i dont think they report outcomes

# borsky -----------------------------------
### higher is good
borsky_did <- did_calculator(mean_treatment_pre = 4.8, mean_treatment_post = 5, mean_control_pre = 5.1, mean_control_post = 4.6)

stand_result(eff_type = "d_i_d", n_t = 41, n_c = 45, raw_effect_size = borsky_did, ctrl_sd = 2.48)

# borsky_dim1 <- dim_calculator(mean_control = 4.8, mean_treatment = 5)
# stand_result(eff_type = "d_i_m", raw_effect_size = borsky_dim1, ctrl_sd = 2.53, n_t = 41, n_c = 207)
# 
# borsky_dim2 <- did_calculator(mean_treatment_post = 5, mean_treatment_pre = 4.8, mean_control_post = 4.6, mean_control_pre = 5.1, sd = 2.48)
# stand_result(eff_type = "d_i_m", raw_effect_size = borsky_dim2, ctrl_sd = 2.48, n_t = 81, n_c = 45)

## bowen -----------------------------------
### not relevant outcomes

## Chamberland -----------------------------------
chamberland_sd <- se_2_sd(se = .03, n = 213)
chamberland_1week <- did_calculator(mean_control_pre = 3.05, mean_treatment_pre = 3.01, sd = chamberland_sd, mean_control_post = 3.03, mean_treatment_post = 3.25)
stand_result(eff_type = "d_i_d", ctrl_sd = chamberland_sd, n_t = 5, n_c = 4, raw_effect_size = chamberland_1week)

chamberland_1month <- did_calculator(mean_control_pre = 3.05, mean_treatment_pre = 3.01, sd = chamberland_sd, mean_treatment_post = 3.13, mean_control_post = 3.02)
stand_result(eff_type = "d_i_d", ctrl_sd = chamberland_sd, n_t = 5, n_c = 4, raw_effect_size = chamberland_1month)

## Darlington -----------------------------------
### irma
#### swat
stand_result(eff_type = "d", raw_effect_size = .04, n_t = 3, n_c = 3) # post
stand_result(eff_type = "d", raw_effect_size = .04, n_t = 3, n_c = 3) # 4 mo
#### swat +
stand_result(eff_type = "d", raw_effect_size = .08, n_t = 3, n_c = 3) # post
stand_result(eff_type = "d", raw_effect_size = .06, n_t = 3, n_c = 3) # 4 mo

### bystander behavior
stand_result(eff_type = "d", raw_effect_size = .2, n_t = 3, n_c = 3) # post # swat; 4 mo
stand_result(eff_type = "d", raw_effect_size = .24, n_t = 3, n_c = 3) # post # swat +; 4 mo

## Eugene
### not primary intervention

## Gage  -----------------------------------
### result also in gage 2016 pg 7

pre_mean <- weighted_average(men_average = 5, women_average = 5.3, n_men = 95, n_women = 114)
post_mean <- weighted_average(men_average = 8.3, n_men = 95, women_average = 8.5, n_women = 114)
gage_sd <- weighted_sd(ns = c(95, 114), sds = c(2, 2.2), means = c(5, 5.3))

# gage_knowledge <- dim_calculator(mean_control = pre_mean, mean_treatment = post_mean)
# stand.result(eff.type = "d.i.m", u.s.d = gage_knowledge, n.t = 209, n.c = 209, ctrl.sd = gage_sd)

gage_knowledge <- log_odds_ratio(percent_control = .052, percent_treatment = .084, n_control = 221, n_treatment = 221)
stand_result(eff_type = "log.odds_ratio", raw_effect_size = gage_knowledge, n_t = 221, n_c = 221)

## Gannon -----------------------------------
### not primary intervention

## Holland -----------------------------------
### behavior
n_con <- 51 + 2061
holland_con <- 51 / n_con


n_min <- 75 + 1645
holland_min <- 75 / n_min

log_min <- log_odds_ratio(percent_control = holland_con, n_control = n_con, percent_treatment = holland_min, n_treatment = n_min)
stand.result(eff.type = "log.odds.ratio", n.c = n_con, n.t = n_min, u.s.d = log_min)


n_mod <- 149 + 7229
holland_mod <- 149 / n_mod

log_mod <- log_odds_ratio(percent_control = holland_con, n_control = n_con, percent_treatment = holland_mod, n_treatment = n_mod)
stand.result(eff.type = "log.odds.ratio", n.c = n_con, n.t = n_mod, u.s.d = log_mod)

n_high <- 170 + 12875
holland_high <- 170 / n_high
log_high <- log_odds_ratio(percent_control = holland_con, n_control = n_con, percent_treatment = holland_high, n_treatment = n_high)
stand.result(eff.type = "log.odds.ratio", n.c = n_con, n.t = n_high, u.s.d = log_high)

### attitudes
dim_min <- dim_calculator(mean_control = 3.56, mean_treatment = 3.7)
stand.result(eff.type = "d.i.m", n.c = n_con, n.t = n_min, ctrl.sd = 1.3, u.s.d = dim_min)

dim_mod <- dim_calculator(mean_control = 3.56, mean_treatment = 4.01)
stand.result(eff.type = "d.i.m", n.c = n_con, n.t = n_mod, ctrl.sd = 1.3, u.s.d = dim_mod)

dim_high <- dim_calculator(mean_control = 3.56, mean_treatment = 4.56)
stand.result(eff.type = "d.i.m", n.c = n_con, n.t = n_high, ctrl.sd = 1.3, u.s.d = dim_high)


## Huebner -----------------------------------
### not a primary intervention

## Kirkner -----------------------------------
kirkner_t <- blpl::t_inverse(p = .001, n = 184)
stand_result(eff_type = "t_test", raw_effect_size = kirkner_t, n_t = 184, n_c = 184)

## Lishnoff -----------------------------------
### not our outcomes

## McClure -----------------------------------
### ns
stand_result(eff_type = "d", raw_effect_size = 0, n_t = 1, n_c = 1)
## Neudorfer -----------------------------------


## McMahon -----------------------------------
mcmahon <- dim_calculator(mean_control = 2.5, mean_treatment = 2.29)
stand_result(eff_type = "d_i_m", raw_effect_size = mcmahon, ctrl_sd = .55, n_t = 643, n_c = 643)

## Nickerson -----------------------------------
### survey not intervention

# peskin 2014 -----------------------------------
physical_vict <- log_odds_ratio(n_control = 463, n_treatment = 303, percent_control = .199, percent_treatment = .156)
stand_result(eff_type = "log_odds_ratio", raw_effect_size = physical_vict, n_t = 463, n_c = 303)

physical_perp <- log_odds_ratio(n_control = 463, n_treatment = 303, percent_control = .168, percent_treatment = .165)
stand_result(eff_type = "log_odds_ratio", raw_effect_size = physical_perp, n_t = 463, n_c = 303)

## Peterson -----------------------------------
### IRMA
#### traditional
### lower is better 
peterson_irma_post <- dim_calculator(mean_control = 2.4, mean_treatment = 2.1) # post
stand_result(eff_type = "d_i_m", n_t = 349, n_c = 376, ctrl_sd = .5, raw_effect_size = peterson_irma_post)

peterson_irma_2mo <- did_calculator(mean_treatment_pre = 2.4, mean_treatment_post = 2.2, mean_control_pre = 2.4, mean_control_post = 2.5, sd = .5) # 2 mo
stand_result(eff_type = "d_i_d", raw_effect_size = peterson_irma_2mo, n_t = 184, n_c = 175, ctrl_sd = .5)

#### bystander education
peterson_b_irma_post <- dim_calculator(mean_control = 2.5, mean_treatment = 1.9) # post
stand_result(eff_type = "d_i_m", raw_effect_size = peterson_b_irma_post, n_t = 342, n_c = 369, ctrl_sd = .5)

peterson_b_irma_2mo <- did_calculator(mean_treatment_pre = 2.5, mean_treatment_post = 2.1, mean_control_pre = 2.4, mean_control_post = 2.5, sd = .5) # 2 mo
stand_result(eff_type = "d_i_d", raw_effect_size = peterson_b_irma_2mo, n_t = 229, n_c = 175, ctrl_sd = .5)

### bystander behavior
peterson_trad_bb <- did_calculator(mean_treatment_pre = 4.7, mean_treatment_post = 4.9, mean_control_pre = 4.9, mean_control_post = 3.7, sd = 4.3)#### traditional
stand_result(eff_type = "d_i_d", raw_effect_size = peterson_trad_bb, n_t = 184, n_c = 175, ctrl_sd = 4.3)

peterson_b_bb <- did_calculator(mean_treatment_pre = 4.6, mean_treatment_post = 7, mean_control_pre = 4.9, mean_control_post = 3.7, sd = 4.3) ## bystander education
stand_result(eff_type = "d_i_d", raw_effect_size = peterson_b_bb, n_t = 229, n_c = 175, ctrl_sd = 4.3)


## saggurti -----------------------------------
### hiv intervention

## Salzar -----------------------------------
### behavior
stand_result(eff_type = "d", raw_effect_size = .29, n_t = 123, n_c = 93)

### rma
salzar_rma <- dim_calculator(mean_control = 36.62, mean_treatment = 31.14)
## sd taken from pg 9
stand_result(eff_type = "d_i_m", n_t = 123, n_c = 93, raw_effect_size = salzar_rma, ctrl_sd = 10.29)

## sarnquist -----------------------------------
stand_result(eff_type = "odds_ratio", raw_effect_size = 1.61, n_t = 1562, n_c = 1976)


## Scull -----------------------------------
scull_dim <- dim_calculator(mean_control = 10.2, mean_treatment = 11.08)
stand_result(eff_type = "d_i_m", n_t = 56, n_c = 56, ctrl_sd = 2.92, raw_effect_size = scull_dim)

##sinclair -----------------------------------
### = sinclair 2013


# stewart -----------------------------------
stewart_rma <- dim_calculator(mean_control = 1.69, mean_treatment = 1.33)
stand_result(eff_type = "d_i_m", raw_effect_size = stewart_rma, n_t = 23, n_c = 33, ctrl_sd = .77)
# stewart_be <- dim_calculator(mean_control = 4.99, mean_treatment = 5.81)
# stand_result(eff_type = "d_i_m", raw_effect_size = stewart_be, n_c = 33, n_t = 23, ctrl_sd = 1.1)


# 2013 =================================
## Baron
stand_result(eff_type = "f_test", raw_effect_size = 2.195, n_t = 10, n_c = 9)

# Belknap -----------------------------------
belknap_pre <- weighted.mean(x = c(6.8, 3.3, 4.4), w = c(65, 64, 64))
belknap_sd <- weighted_sd(ns = c(65, 64, 64), sds = c(2.3, .9, 1.7), means = c(6.8, 3.3, 4.4))
belknap_post <- weighted.mean(x = c(6.4, 3.9, 4.2), w = c(65, 64, 64))
belknap_dim <- dim_calculator(mean_control = belknap_pre, mean_treatment = belknap_post)
stand_result(eff_type = "d_i_m", raw_effect_size = belknap_dim, ctrl_sd = belknap_sd, n_c = 3, n_t = 3)

## Buck -----------------------------------
### not our outcomes

## Campbell -----------------------------------
campbell_dim <- dim_calculator(mean_control = 4.97, mean_treatment = 6.48)
stand_result(eff_type = "d_i_m", raw_effect_size = campbell_dim, n_t = 44 ,n_c = 36, ctrl_sd = 2.7)

## Elias-Lambert -----------------------------------
### irma
### lower is better
elias_irma_post <- did_calculator(mean_treatment_pre = 38.03, mean_control_pre = 35.1, sd = 8.24, mean_control_post = 31, mean_treatment_post = 33.94)
stand_result(eff_type = "d_i_d", raw_effect_size = elias_irma_post, ctrl_sd = 8.24, n_t = 79, n_c = 63)

elias_irma_follow <- did_calculator(mean_treatment_pre = 38.03, mean_control_pre = 35.1, sd = 8.24, mean_control_post = 33.6, mean_treatment_post = 35)
stand_result(eff_type = "d_i_d", raw_effect_size = elias_irma_follow, ctrl_sd = 8.24, n_t = 35, n_c = 20)

### ses
### could be d_i_d but i don't see low risk n's
elias_ses <- log_odds_ratio(n_control = 20, n_treatment = 35, percent_control = .1, percent_treatment = .086)
stand_result(eff_type = "log.odds_ratio", raw_effect_size = elias_ses, n_t = 35, n_c = 20)


## Espelage -----------------------------------
stand_result(eff_type = "odds_ratio", n_t = 18, n_c = 18, raw_effect_size = 1.04) # perp
stand_result(eff_type = "odds_ratio", n_t = 18, n_c = 18, raw_effect_size = 1.01) # vict

## Garman -----------------------------------
### not our outcomes


## Katz a -----------------------------------
katz_dim <- dim_calculator(mean_control = 4.3, mean_treatment = 5.52)
stand_result(eff_type = "d_i_m", raw_effect_size = katz_dim, no.sd.given = T, n_t = 52, n_c = 52)

## Katz b -----------------------------------
# katzb_dim <- dim_calculator(mean_control = 4.26, mean_treatment = 4.42)
stand_result(eff_type = "f_test", raw_effect_size = 4.6, n_t = 2, n_c = 1)

### rma ns
stand_result(eff_type = "d", raw_effect_size = 0, n_c = 2, n_t = 1)

## Miller 2013 -----------------------------------
### higher is better
miller_gender <- did_calculator(mean_treatment_pre = 2.99, mean_treatment_post = 3.07, mean_control_pre = 3.07, mean_control_post = 3.18, sd = .56)
stand_result(eff_type = "d_i_d", raw_effect_size = miller_gender, n_t = 8, n_c = 8, ctrl_sd = .56)

miller_perp <- did_calculator(mean_treatment_pre = .31, mean_treatment_post = .28, mean_control_pre = .25, mean_control_post = .38, sd = .74)
stand_result(eff_type = "d_i_d", raw_effect_size = miller_perp, n_t = 8, n_c = 8, ctrl_sd = .74)

## Senn -----------------------------------


## Sinclair -----------------------------------
sinclair <- log_odds_ratio(n_control = 108, n_treatment = 381, percent_control = .231, percent_treatment = .092)
stand_result(eff_type = "log.odds_ratio", raw_effect_size = sinclair, n_c = 108, n_t = 381)

# DeGue ########################

## Taylor - I used the 300~ page mega doc. pg 304
## wave b is immediate
## wave c is 6 months later
## school is on pg 41, 43
## t_test is from negative binomial regression described on pg 54
## i am using n for schools
### victimization frequency, wave b
stand_result(eff_type = "t_test", raw_effect_size = -.76, n_t = 8, n_c = 9) # building_b
stand_result(eff_type = "t_test", raw_effect_size = -.97, n_t = 6, n_c = 9) # classroom_b
stand_result(eff_type = "t_test", raw_effect_size = -.91, n_t = 7, n_c = 9) # build_class_b

### perpetration frequency, wave b (pg 306)
stand_result(eff_type = "t_test", raw_effect_size = -.41, n_t = 8, n_c = 9) # building_c
stand_result(eff_type = "t_test", raw_effect_size = -.34, n_t = 6, n_c = 9) # classroom_c
stand_result(eff_type = "t_test", raw_effect_size = -1.09, n_t = 7, n_c = 9) # build_class_c


### victimization, wave c
stand_result(eff_type = "t_test", raw_effect_size = -2.46, n_t = 8, n_c = 9) # building_c
stand_result(eff_type = "t_test", raw_effect_size = -.08, n_t = 6, n_c = 9) # classroom_c
stand_result(eff_type = "t_test", raw_effect_size = -2.27, n_t = 7, n_c = 9) # build_class_c

### perpetration frequency, wave c
stand_result(eff_type = "t_test", raw_effect_size = -2.24, n_t = 8, n_c = 9) # building_c
stand_result(eff_type = "t_test", raw_effect_size = -.27, n_t = 6, n_c = 9) # classroom_c
stand_result(eff_type = "t_test", raw_effect_size = -1.75, n_t = 7, n_c = 9) # build_class_c




# 2012 =========================
# ball -----------------------------------
ball_2012_victimization <- dim_calculator(mean_control = .77, mean_treatment = .75)
stand_result(eff_type = "d_i_m", raw_effect_size = ball_2012_victimization, ctrl_sd = .64, n_t = 143, n_c = 143)

ball_2012_perpetration <- dim_calculator(mean_control = .72, mean_treatment = .69)
stand_result(eff_type = "d_i_m", raw_effect_size = ball_2012_perpetration, ctrl_sd = .58, n_t = 143, n_c = 143)

## berlient -----------------------------------
berlient_sd <- 15.79
rmv <- dim_calculator(mean_control = 68.09, mean_treatment = 63.11)
vev <- dim_calculator(mean_control = 68.09, mean_treatment = 57.05)
oev <- dim_calculator(mean_control = 68.09, mean_treatment = 69.87)

stand_result(eff_type = "d_i_m", ctrl_sd = berlient_sd, n_c = 11, n_t = 9, raw_effect_size = rmv)
stand_result(eff_type = "d_i_m", ctrl_sd = berlient_sd, n_c = 11, n_t = 17, raw_effect_size = vev)
stand_result(eff_type = "d_i_m", ctrl_sd = berlient_sd, n_c = 11, n_t = 16, raw_effect_size = oev)



## Black -----------------------------------
### attitudes
black_intervention <- weighted.mean(x = c(24.78, 25.44, 25.44, 24.66), w = c(169, 202, 57, 50))
black_comparison <- weighted.mean(x = c(23.53, 20.7, 21.46, 23.11), w = c(15, 23, 37, 46))
black_sd <- weighted_sd(ns = c(15, 23, 37, 46), means = c(23.53, 20.7, 21.46, 23.11), sds = c(4.6, 5.23, 3.9, 4.9))
black_es <- dim_calculator(mean_control = black_comparison, mean_treatment = black_intervention)
stand_result(eff_type = "d_i_m", raw_effect_size = black_es, n_t = sum(169, 202, 57, 50), n_c = sum(15, 23, 37, 46), ctrl_sd = black_sd)

## Caver -----------------------------------
### not evaluating program

## Foshee -----------------------------------
stand_result(eff_type = "odds_ratio", raw_effect_size = .26, n_t = 140, n_c = 184) # physical victimization among NOT INVOLVED AT BASELINE. n is close, but a little too high. note this has controls
stand_result(eff_type = "odds_ratio", raw_effect_size = .48, n_t = 140, n_c = 184) # physical perp

## foubert -----------------------------------
stand_result(eff_type = "d", raw_effect_size = .4, n_t = 8, n_c = 8) # men's program
stand_result(eff_type = "d", raw_effect_size = .1, n_t = 8, n_c = 8) # comparison group

## lawson -----------------------------------
stand_result(eff_type = "d", raw_effect_size = .44, n_t = 3, n_c = 3)



## Martin -----------------------------------
### attitudes
cont_pre <- weighted_average(men_average = 1.91, women_average = 1.63, n_men = 53, n_women = 23)
cont_post <- weighted_average(men_average = 1.78, women_average = 1.57, n_men = 53, n_women = 23)
cont_follow <- weighted_average(men_average = 1.73, women_average = 1.5, n_men = 53, n_women = 23)
cont_sd <- weighted_sd(ns = c(53, 23), sds = c(.44, .26), means = c(1.91, 1.63))

tre_pre <- weighted_average(men_average = 2.17, women_average = 1.76, n_men = 37, n_women = 56)
tre_post <- weighted_average(men_average = 1.94, women_average = 1.57, n_men = 37, n_women = 56)
tre_follow <- weighted_average(men_average = 1.75, women_average = 1.46, n_men = 37, n_women = 56)

martin_post <- did_calculator(sd = cont_sd, mean_control_pre = cont_pre, mean_treatment_pre = tre_pre, mean_control_post = cont_post, mean_treatment_post = tre_post)
stand_result(eff_type = "d_i_d", ctrl_sd = cont_sd, n_t = 93, n_c = 76, raw_effect_size = martin_post)

martin_follow <- did_calculator(sd = cont_sd, mean_control_pre = cont_pre, mean_treatment_pre = tre_pre, mean_control_post = cont_follow, mean_treatment_post = tre_follow)
stand_result(eff_type = "d_i_d", ctrl_sd = cont_sd, n_t = 93, n_c = 76, raw_effect_size = martin_follow)

### behaviors
stand_result(eff_type = "d", raw_effect_size = 0, n_c = 76, n_t = 93)

# ## Miller 2012 -----------------------------------
# 
# ### Gender Attitudes
# ga_follow <- did_calculator(mean_treatment_pre = 2.99, mean_treatment_post = 3, mean_control_pre = 3.08, mean_control_post = 3.09, sd = .58)
# stand_result(eff_type = "d_i_d", raw_effect_size = ga_follow, n_c = 8, n_t = 8, ctrl_sd = .58)
# 
# ### perpetration
# miller_perp <- did_calculator(mean_treatment_pre = .36, mean_control_pre = .3, mean_control_post = .38, mean_treatment_post = .35, sd = .84)
# stand_result(eff_type = "d_i_d", raw_effect_size = miller_abuse, ctrl_sd = .84, n_t = 8, n_c = 8)

## Spielman -----------------------------------
spielman_pre_female <- mean(c(.59, .37, .81, .98, (1 - .58), .15, .37))
spielman_pre_male <- mean(c(.31, .27, .76, .99, (1 - .47), .22, .25))
spielman_pre <- weighted_average(men_average = spielman_pre_male, women_average = spielman_pre_female, n_men = 214, n_women = 193)

spielman_post_female <- mean(c(.998, .879, .82, .93, (1 - .34), .99, .78))
spielman_post_male <- mean(c(.932, .86, .78, .95, (1 - .27), .96, .99))
spielman_post <- weighted_average(men_average = spielman_post_male, women_average = spielman_post_female, n_men = 214, n_women = 193)

spielman_log_odds <- log_odds_ratio(percent_control = spielman_pre, percent_treatment = spielman_post, n_control = 214+193, n_treatment = 214+193)

stand_result(eff_type = "log_odds_ratio", raw_effect_size = spielman_log_odds, n_t = 11, n_c = 11)



# 2011 =================================
## Ahrens -----------------------------------

## Coker et al., 2011 -----------------------------------
### Students Educating and Empowering to Develop Safety (SEEDS) trained (confounded with green dot)
stand_result("f_test", raw_effect_size = 6.29, n_t = 351, n_c = 1301) # irma seeds
stand_result("f_test", raw_effect_size = 95.97, n_t = 351, n_c = 1301) # Actual active bystander behaviors score

### Violence Intervention and Prevention (VIP) engaged but not SEEDS trained (confounded with green dot)
stand_result("f_test", raw_effect_size =  4.85, n_t = 159, n_c = 1301) # irma
stand_result("f_test", raw_effect_size =  19.6, n_t = 159, n_c = 1301) # actual active bystander behavior

### Green Dot speech alone
stand_result("f_test", raw_effect_size =  2.54, n_t = 693, n_c = 1301) # irma
stand_result("f_test", raw_effect_size = 18.26, n_t = 693, n_c = 1301) # actual active bystander behavior


## Department of Justice -----------------------------------
doj <- dim_calculator(mean_control = 4.75, mean_treatment = 4.78)
stand_result(eff_type = "d_i_m", raw_effect_size = doj, n_t = 149, n_c = 149, ctrl_sd = .32)


## Gidycz -----------------------------------
## note this study doesn't include attrition rate seperated by control and treatment. i am using the aggregate numbers they gave me, these are going to be a little too high. they have like 10 primary outcomes, i am taking the relevant ones
### irma
### lower is better
gidycz_rma_sd <- se_2_sd(se = 1.93, n = 204)
gidycz_irma_4 <- did_calculator(mean_treatment_pre = 54.14, sd = gidycz_rma_sd, mean_control_pre = 53.72, mean_treatment_post = 52.24, mean_control_post = 55.61) # rma 4 months
stand_result(eff_type = "d_i_d", raw_effect_size = gidycz_irma_4, ctrl_sd = gidycz_rma_sd, n_c = 249, n_t = 204)

gidycz_irma_7 <- did_calculator(mean_treatment_pre = 54.14, sd = gidycz_rma_sd, mean_control_pre = 53.72, mean_treatment_post = 49.18, mean_control_post = 51.09) # rma 7 months
stand_result(eff_type = "d_i_d", raw_effect_size = gidycz_irma_7, ctrl_sd = gidycz_rma_sd, n_c = 249, n_t = 204)

### ses
gidycz_ses_4month <- log_odds_ratio(percent_treatment = .015, percent_control = .067, n_control = 249, n_treatment = 204)
stand_result(eff_type = "log_odds_ratio", raw_effect_size = gidycz_ses_4month, n_t = 6, n_c = 6)


## Katz -----------------------------------
katz_2011 <- dim_calculator(mean_control = 3.33, mean_treatment = 4.43)
katz_sd <- se_2_sd(se = .03, n = 825)
stand_result(eff_type = "d_i_m", raw_effect_size = katz_2011, ctrl_sd = katz_sd, n_t = 1, n_c = 1)

## Kernsmith -----------------------------------

kernsmith_pre <- weighted_average(men_average = 2.99, women_average = 3.3, n_men = 44, n_women = 56)
kernsmith_post <- weighted_average(men_average = 3.2, women_average = 3.44, n_men = 44, n_women = 56)
kernsmith_follow <- weighted_average(men_average = 3.27, women_average = 3.54, n_men = 44, n_women = 56)
kernsmith_sd <- weighted_sd(ns = c(56, 44), sds = c(.35, .39), means = c(3.3, 2.99))

kernsmith_dim_post <- dim_calculator(mean_control = kernsmith_pre, mean_treatment = kernsmith_post)
stand_result(eff_type = "d_i_m", ctrl_sd = kernsmith_sd, n_c = 282, n_t = 282, raw_effect_size = kernsmith_dim_post)

kernsmith_dim_follow <- dim_calculator(mean_control = kernsmith_pre, mean_treatment = kernsmith_follow)
stand_result(eff_type = "d_i_m", ctrl_sd = kernsmith_sd, n_c = 282, n_t = 88, raw_effect_size = kernsmith_dim_follow)


## Langhinrichsen-Rohling -----------------------------------
### lower is better 
rma_lang <- did_calculator(mean_control_post = 2.91, mean_control_pre = 2.91, mean_treatment_pre = 2.99, mean_treatment_post = 2.47, sd = 1.15)
stand_result(eff_type = "d_i_d", raw_effect_size = rma_lang, n_t = 69, n_c = 90, ctrl_sd = 1.15)


## Moor -----------------------------------
moor_n_girls <- round(394*.518, 0)
moor_n_boys <- round(394*.482, 0)

boys_att <- dim_calculator(mean_control = 3.37, mean_treatment = 3.59)
stand_result(eff_type = "d_i_m", raw_effect_size = boys_att, ctrl_sd = .78, n_t = moor_n_boys, n_c = moor_n_boys)

girls_att <- dim_calculator(mean_control = 4.03, mean_treatment = 4.21)
stand_result(eff_type = "d_i_m", raw_effect_size = girls_att, ctrl_sd = .57, n_t = moor_n_girls, n_c = moor_n_girls)

### behaviors
moor_boys_pre <- mean(c(3.15, 4.54, 4.64))
moor_boys_post <- mean(c(3.56, 4.58, 4.68))
moor_boys_beh <- dim_calculator(mean_control = moor_boys_pre, mean_treatment = moor_boys_post)
moor_boys_sd <- weighted_sd(means = c(3.15, 4.54, 4.64), sds = c(1.21, .91, .89), ns = c(moor_n_boys, moor_n_boys, moor_n_boys))
stand_result(eff_type = "d_i_m", raw_effect_size = moor_boys_beh, ctrl_sd = moor_boys_sd, n_t = moor_n_boys, n_c = moor_n_boys)

moor_girls_pre <- mean(c(2.52, 4.74, 4.76))
moor_girls_post <- mean(c(3.03, 4.75, 4.81))
moor_girls_beh <- dim_calculator(mean_control = moor_girls_pre, mean_treatment = moor_girls_post)
moor_girls_sd <- weighted_sd(ns = c(moor_n_girls, moor_n_girls, moor_n_girls), means = c(2.52, 4.74, 4.76), sds = c(1.19, .86, .83))
stand_result(eff_type = "d_i_m", raw_effect_size = moor_girls_beh, ctrl_sd = moor_girls_sd, n_t = moor_n_girls, n_c = moor_n_girls)

## Potter -----------------------------------
potter_2011 <- dim_calculator(mean_control = 20.53, mean_treatment = 27.6)
stand_result(eff_type = "d_i_m", raw_effect_size = potter_2011, ctrl_sd = 24.82, n_c = 279, n_t = 115)

## Smothers -----------------------------------
## phase 1 and phase 2 are **essentially** different studies, and should be treated like so. about 13 people were overlapped
## they only used cases where everyone was there so pre post n is same.
smothers_saaq_phase1 <- dim_calculator(mean_control = 86.41, mean_treatment = 92.41)
stand_result(raw_effect_size = smothers_saaq_phase1, eff_type = "d_i_m", n_t = 5, n_c = 5, ctrl_sd = 8.64)

# smothers_saaq_phase2 <- dim_calculator(mean_control = 63.64, mean_treatment = 68.39)
# stand_result(raw_effect_size = smothers_saaq_phase2, eff_type = "d_i_m", ctrl_sd = 7.38, n_c = 70, n_t = 70)


## Sparks -----------------------------------
## post test is one week later . 119 youths in the analysis . pre post
stand_result(eff_type = "d", raw_effect_size = -.03, n_t = 118, n_c = 118)

## Taylor -----------------------------------
# same as Taylor 2013


## Vladutiu -----------------------------------
### not an experiment, this is a review paper




# 2010 ============================

## Hillenbrandgunn -----------------------------------
cont_pre <- weighted_average(men_average = 40.4, n_men = 50, women_average = 33.11, n_women = 38)
tre_pre <- weighted_average(men_average = 39.49, n_men = 78, women_average = 33.04, n_women = 46)
cont_post <- weighted_average(men_average = 41.3, n_men = 50, women_average = 32.63, n_women = 38)
tre_post <- weighted_average(men_average = 36.28, n_men = 78, women_average = 28.61, n_women = 46)
cont_follow <- weighted_average(men_average = 41.66, n_men = 50, women_average = 33.29, n_women = 38)
tre_follow <- weighted_average(men_average = 35.46, n_men = 78, women_average = 29.85, n_women = 46)
cont_sd <- weighted_sd(ns = c(50, 38), sds = c(8.87, 6.76), means = c(40.4, 33.11))
#### irma
### lower is better 
post_did <- did_calculator(sd = cont_sd, mean_control_pre = cont_pre, mean_treatment_pre = tre_pre, mean_control_post = cont_post, mean_treatment_post = tre_post)
stand_result(eff_type = "d_i_d", n_t = 7, n_c = 5, ctrl_sd = cont_sd, raw_effect_size = post_did)

follow_did <- did_calculator(sd = cont_sd, mean_control_pre = cont_pre, mean_treatment_pre = tre_pre, mean_control_post = cont_follow, mean_treatment_post = tre_follow)
stand_result(eff_type = "d_i_d", n_t = 7, n_c = 5, ctrl_sd = cont_sd, raw_effect_size = follow_did)


## Jordan -----------------------------------
jor_video <- did_calculator(mean_control_pre = 73.2, mean_control_post = 73.3, sd = 8.95, mean_treatment_pre = 74.1, mean_treatment_post = 76.3) # video
stand_result(eff_type = "d_i_d", raw_effect_size = jor_video, n_t = 9, n_c = 9, ctrl_sd = 8.95)

jor_peer <- did_calculator(mean_control_pre = 73.2, mean_control_post = 73.3, sd = 8.95, mean_treatment_pre = 74.8, mean_treatment_post = 76.7) # peer education
stand_result(eff_type = "d_i_d", raw_effect_size = jor_peer, n_t = 9, n_c = 9, ctrl_sd = 8.95)

## Liu -----------------------------------
### att
stand_result(eff_type = "t_test", raw_effect_size = 1.99, n_t = 95, n_c = 707)

### behavior ns
stand_result(eff_type = "d", raw_effect_size = 0, n_c = 707, n_t = 95)

## Moynihan -----------------------------------
### irma
moynihan_irma_post <- did_calculator(mean_control_pre = 28.19, mean_treatment_pre = 26.5, sd = 7.13, mean_control_post = 27.45, mean_treatment_post = 23.25)
stand_result(eff_type = "d_i_d", ctrl_sd = 7.13,n_t = 62, n_c = 36, raw_effect_size = moynihan_irma_post)

moynihan_irma_2month <- did_calculator(mean_control_pre = 28.19, mean_treatment_pre = 26.5, sd = 7.13, mean_treatment_post = 24, mean_control_post = 27.64)
stand_result(eff_type = "d_i_d", ctrl_sd = 7.13, n_t = 62, n_c = 36, raw_effect_size = moynihan_irma_2month)


### bystander behavior
moynihan_beh <- did_calculator(mean_control_pre = 14.34, mean_treatment_pre = 13.31, mean_control_post = 14.34, mean_treatment_post = 14.43, sd = 5.55)
stand_result(eff_type = "d_i_d", raw_effect_size = moynihan_beh, ctrl_sd = 5.55, n_t = 62, n_c = 36)

## Nelson -----------------------------------
nelson_pre <- weighted.mean(c(7.92, 8.06, 5.19), w = c(36, 63, 58))
nelson_post <- weighted.mean(x = c(8.58, 9.08, 8.9), w = c(36, 63, 58))
nelson_dim <- dim_calculator(mean_treatment = nelson_post, mean_control = nelson_pre)

stand_result(eff_type = "d_i_m", raw_effect_size = nelson_dim, no.sd.given = T, n_t = 3, n_c = 3)

## Potter -----------------------------------
### no comparison group

## Rich -----------------------------------
### qualitiative

## Taylor a -----------------------------------

## Taylor b -----------------------------------

# 2009 ===========================
## Banyard -----------------------------------
banyard_2009 <- dim_calculator(mean_control = 1.5, mean_treatment = 1.32)
stand_result(eff_type = "d_i_m", raw_effect_size = banyard_2009, n_t = 193, n_c = 193, ctrl_sd = .44)

## Boba Liley -----------------------------------
#not codable


## Bradley -----------------------------------
experimental_men <- did_calculator(mean_treatment_post = 23.49, mean_treatment_pre = 25.92, mean_control_post = 25.44, mean_control_pre = 27.41, sd = 9.49)
stand_result(eff_type = "d_i_d", raw_effect_size = experimental_men, ctrl_sd = 9.49, n_t = 54, n_c = 59)


## DeGannes -----------------------------------
DeGannes_usd <- dim_calculator(mean_control = 65.38, mean_treatment = 59.74)
stand_result(eff_type = "d_i_m", raw_effect_size = DeGannes_usd, ctrl_sd = 15.32, n_t = 29, n_c = 57)

## Foubert -----------------------------------
#not codable - no pre measure, only post without control


## Lori Ann Post -----------------------------------
### need help coding

## Stephens -----------------------------------
stephans_usd_post <- dim_calculator(mean_control = 1.68, mean_treatment = 1.35)
stand_result(eff_type = "d_i_m", raw_effect_size = stephans_usd_post, ctrl_sd = 0.79, n_t = 51, n_c = 52)

stephans_usd_follow <- dim_calculator(mean_control = 1.71, mean_treatment = 1.25)
stand_result(eff_type = "d_i_m", raw_effect_size = stephans_usd_follow, ctrl_sd = 0.77, n_t = 27, n_c = 38)



# 2008 =================================

## Borges --------------
#### knowledge
#### higher is better
presentation <- did_calculator(mean_control_pre = 1.25, mean_control_post = 1.1, sd = 1.03, mean_treatment_pre = 1.11, mean_treatment_post = 1.18)
stand_result(eff_type = "d_i_d", raw_effect_size = presentation, ctrl_sd = 1.03, n_c = 62, n_t = 61)

presentation_activity <- did_calculator(mean_control_pre = 1.25, mean_control_post = 1.1, sd = 1.03, mean_treatment_pre = 1.27, mean_treatment_post = 1.76)
stand_result(eff_type = "d_i_d", raw_effect_size = presentation_activity, ctrl_sd = 1.03, n_c = 62, n_t = 65)


## Cissner -----------------------------------
gv_peer <- dim_calculator(mean_control = 3.83, mean_treatment = 4.16)
stand_result(eff_type = "d_i_m", raw_effect_size = gv_peer, n_t = 20, n_c = 3, no.sd.given = T)

gv_workshop <- dim_calculator(mean_control = 3.83, mean_treatment = 3.99)
stand_result(eff_type = "d_i_m", raw_effect_size = gv_peer, n_t = 20, n_c = 3, no.sd.given = T)

## Jones -----------------------------------
jones <- dim_calculator(mean_treatment = 8.41, mean_control = 6.76)
stand_result(eff_type = "d_i_m", raw_effect_size = jones, n_t = 3, n_c = 3, ctrl_sd = 2.1)

## Moynihan -----------------------------------
stand_result(eff_type = "t_test", raw_effect_size = -.96, n_t = 127, n_c = 106)

## Potter -----------------------------------
potter_2008 <- did_calculator(mean_treatment_pre = 1.13, mean_control_pre = 1.06, mean_control_post = .97, mean_treatment_post = 1.38)
stand_result(eff_type = "d_i_d", n_t = 1, n_c = 1, raw_effect_size = potter_2008, ctrl_sd = 1.23)

## Stephens a -----------------------------------
### irma
stand_result(eff_type = "d", raw_effect_size = .44, n_c = 52, n_t = 51, ctrl_sd = .79)
stand_result(eff_type = "d", raw_effect_size = .6, n_c = 38, n_t = 27, ctrl_sd = .77)

### ses
stand_result(eff_type = "d", raw_effect_size = -.3, n_t = 27, n_c = 38, ctrl_sd = .45)

## stephens b --------------
### cultural irma post
stand_result(eff_type = "d", raw_effect_size = .35, n_t = 43, n_c = 38)

### cultural irma 5 week
stephens_irma <- dim_calculator(mean_control = 1.8, mean_treatment = 1.72)
stand_result(eff_type = "d_i_m", raw_effect_size = stephens_irma, n_t = 23, n_c = 28, ctrl_sd = .87)

### cultural ses 5 week
stephens_ses <- dim_calculator(mean_control = .29, mean_treatment = .13)
stand_result(eff_type = "d_i_m", raw_effect_size = stephens_ses, n_t = 23, n_c = 28, ctrl_sd = .46)

# 2007 =================================
## Banyard -----------------------------------
### irma
### lower is better
#### 1 session
banyard_post_1session_irma <- did_calculator(mean_control_pre = 32.54, sd = 12.65, mean_treatment_pre = 32.2, mean_control_post = 31.4, mean_treatment_post = 28.38)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_post_1session_irma, ctrl_sd = 12.65, n_t = 128, n_c = 108)

banyard_2month_1session_irma <- did_calculator(mean_control_pre = 32.54, sd = 12.65, mean_treatment_pre = 32.2, mean_control_post = 30.09, mean_treatment_post = 27.79)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_2month_1session_irma, ctrl_sd = 12.65, n_t = 92, n_c = 93)

banyard_4month_1session_irma <- did_calculator(mean_control_pre = 32.54, sd = 12.65, mean_treatment_pre = 32.2, mean_control_post = 38.84, mean_treatment_post = 34.38)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_4month_1session_irma, ctrl_sd = 12.65, n_t = 40, n_c = 51)


banyard_12month_1session_irma <- did_calculator(mean_control_pre = 32.54, sd = 12.65, mean_treatment_pre = 32.2, mean_control_post = 33.94, mean_treatment_post = 28.36)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_12month_1session_irma, ctrl_sd = 12.65, n_t = 27, n_c = 26)


#### 3 session
banyard_post_3session_irma <- did_calculator(mean_control_pre = 32.54, sd = 12.65, mean_treatment_pre = 32.9, mean_control_post = 31.4, mean_treatment_post = 25.76)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_post_3session_irma, ctrl_sd = 12.65, n_t = 123, n_c = 108)

banyard_2month_3session_irma <- did_calculator(mean_control_pre = 32.54, sd = 12.65, mean_treatment_pre = 32.9, mean_control_post = 30.09, mean_treatment_post = 27.17)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_2month_3session_irma, ctrl_sd = 12.65, n_t = 97, n_c = 93)

banyard_4month_3session_irma <- did_calculator(mean_control_pre = 32.54, sd = 12.65, mean_treatment_pre = 32.9, mean_control_post = 38.84, mean_treatment_post = 31.03)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_4month_3session_irma, ctrl_sd = 12.65, n_t = 48, n_c = 51)

banyard_12month_3session_irma <- did_calculator(mean_control_pre = 32.54, sd = 12.65, mean_treatment_pre = 32.9, mean_control_post = 33.94, mean_treatment_post = 33.53)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_12month_3session_irma, ctrl_sd = 12.65, n_t = 30, n_c = 26)

### bystander behavior
#### 1 session
banyard_2month_1session_bb <- did_calculator(mean_control_pre = 9.58, mean_treatment_pre = 10.47, sd = 6.29, mean_control_post = 11.57, mean_treatment_post = 14.72)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_2month_1session_bb, ctrl_sd = 6.29, n_t = 92, n_c = 93)

banyard_4month_1session_bb <- did_calculator(mean_control_pre = 9.58, mean_treatment_pre = 10.47, sd = 6.29, mean_control_post = 11.16, mean_treatment_post = 14.12)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_4month_1session_bb, ctrl_sd = 6.29, n_t = 40, n_c = 51)

banyard_12month_1session_bb <- did_calculator(mean_control_pre = 9.58, mean_treatment_pre = 10.47, sd = 6.29, mean_control_post = 12.88, mean_treatment_post = 13.93)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_12month_1session_bb, ctrl_sd = 6.29, n_t = 27, n_c = 26)


#### 3 session
banyard_2month_3session_bb <- did_calculator(mean_control_pre = 9.58, mean_treatment_pre = 10.06, sd = 6.29, mean_control_post = 11.57, mean_treatment_post = 12.7)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_2month_3session_bb, ctrl_sd = 6.29, n_t = 97, n_c = 93)

banyard_4month_3session_bb <- did_calculator(mean_control_pre = 9.58, mean_treatment_pre = 10.06, sd = 6.29, mean_control_post = 11.16, mean_treatment_post = 11.02)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_4month_3session_bb, ctrl_sd = 6.29, n_t = 48, n_c = 51)

banyard_12month_3session_bb <- did_calculator(mean_control_pre = 9.58, mean_treatment_pre = 10.06, sd = 6.29, mean_control_post = 12.88, mean_treatment_post = 12.8)
stand_result(eff_type = "d_i_d", raw_effect_size = banyard_12month_3session_bb, ctrl_sd = 6.29, n_t = 30, n_c = 26)


## Beardall -----------------------------------
beardall_pre <- mean(c(2.64, 3.23, 3.88, 3.16, 3.76, 3.9, 3.18, 3.79))
beardall_post <- mean(c(2.7, 3.54, 3.88, 3.55, 4.14, 4.2, 3.48, 4.09))


beardall_dim <- dim_calculator(mean_control = beardall_pre, mean_treatment = beardall_post)

stand_result(eff_type = "d_i_m", raw_effect_size = beardall_dim, no.sd.given = T, n_t = 68, n_c = 68)



## Foubert -----------------------------------
n_control <- (111 / 2) + (365 / 2)
n_treatment <- (111 / 2) + (365 / 2)
### ses
stand_result(eff_type = "f_test", raw_effect_size = 13.07, n_t = n_treatment, n_c = n_control)

### rma
#### post
stand_result(eff_type = "f_test", raw_effect_size = 4.32, n_t = n_treatment, n_c = n_control)
#### 7 month follow up
stand_result(eff_type = "f_test", raw_effect_size = 2.37, n_t = n_treatment, n_c = n_control)

## Lowe -----------------------------------
stand_result(eff_type = "t_test", raw_effect_size = 10.6, n_t = 4, n_c = 4, ctrl_sd = 1.8)


## Rothman -----------------------------------
stand_result(eff_type = "odds_ratio", raw_effect_size = 1.74, n_t = 738, n_c = 1244)

# 2006 ===========================
## Fay -----------------------------------
### low is good
fay_post <- did_calculator(mean_control_pre = 48.75, mean_treatment_pre = 49.97, mean_control_post = 49.41, mean_treatment_post = 44.49)
stand_result(eff_type = "d_i_d", raw_effect_size = fay_post, n_c = 3, n_t = 3, ctrl_sd = 10.65)

## Foubert -----------------------------------
foubert_bystander <- dim_calculator(mean_control = 97.9, mean_treatment = 80.3)
stand_result(eff_type = "d_i_m", raw_effect_size = foubert_bystander, n_t = 4, n_c = 4, ctrl_sd = 29)

foubert_consent <- dim_calculator(mean_control = 100.2, mean_treatment = 85.8)
stand_result(eff_type = "d_i_m", raw_effect_size = foubert_consent, n_t = 4, n_c = 4, ctrl_sd = 27.8)

## Kress -----------------------------------
stand_result(eff_type = "f_test", raw_effect_size = 142.28, n_t = 174, n_c = 174)

## Milhausen -----------------------------------
stand_result(eff_type = "d", n_t = 160, n_c = 261, raw_effect_size = 0)

# 2005 ========================
## Foshee -----------------------------------
### vict
foshee_1month <- did_calculator(mean_control_pre = .22, mean_treatment_pre = .24, sd = .78, mean_control_post = .29, mean_treatment_post = .24)
stand_result(eff_type = "d_i_d", n_t = 7, n_c = 7, ctrl_sd = .78, raw_effect_size = foshee_1month)

foshee_1year <- did_calculator(mean_control_pre = .22, mean_treatment_pre = .24, sd = .78, mean_control_post = .42, mean_treatment_post = .35)
stand_result(eff_type = "d_i_d", n_t = 7, n_c = 7, ctrl_sd = .78, raw_effect_size = foshee_1year)

foshee_2year <- did_calculator(mean_control_pre = .22, mean_treatment_pre = .24, sd = .78, mean_control_post = .28, mean_treatment_post = .26)
stand_result(eff_type = "d_i_d", n_t = 7, n_c = 7, ctrl_sd = .78, raw_effect_size = foshee_2year)

foshee_3year <- did_calculator(mean_control_pre = .22, mean_treatment_pre = .24, sd = .78, mean_control_post = .2, mean_treatment_post = .15)
stand_result(eff_type = "d_i_d", n_t = 7, n_c = 7, ctrl_sd = .78, raw_effect_size = foshee_3year)


### perp
foshee_1month_perp <- did_calculator(mean_control_pre = .07, mean_treatment_pre = .1, sd = .53, mean_control_post = .18, mean_treatment_post = .07)
stand_result(eff_type = "d_i_d", n_t = 7, n_c = 7, ctrl_sd = .53, raw_effect_size = foshee_1month_perp)

foshee_1year_perp <-did_calculator(mean_control_pre = .07, mean_treatment_pre = .1, sd = .53, mean_control_post = .21, mean_treatment_post = .17)
stand_result(eff_type = "d_i_d", n_t = 7, n_c = 7, ctrl_sd = .53, raw_effect_size = foshee_1year_perp)

foshee_2year_perp <-did_calculator(mean_control_pre = .07, mean_treatment_pre = .1, sd = .53, mean_control_post = .19, mean_treatment_post = .06)
stand_result(eff_type = "d_i_d", n_t = 7, n_c = 7, ctrl_sd = .53, raw_effect_size = foshee_2year_perp)

foshee_3year_perp <- did_calculator(mean_control_pre = .07, mean_treatment_pre = .1, sd = .53, mean_control_post = .07, mean_treatment_post = .05)
stand_result(eff_type = "d_i_d", n_t = 7, n_c = 7, ctrl_sd = .53, raw_effect_size = foshee_3year_perp)

# 2004 =======================

## Foshee -----------------------------------
foshee_sd <- s_pooled(reg_coef = -.23, total_n = 259+201, n_treatment = 259, n_control = 201, outcome_sd = .66)
stand_result(eff_type = "reg_coef", raw_effect_size = -.23, n_t = 5, n_c = 5, ctrl_sd = foshee_sd)

## Lobo -----------------------------------
### irma
#### 3 month
lobo_irma_sd <- se_2_sd(se = 1.2, n = 117)
lobo_irma_3month <- did_calculator(mean_treatment_pre = 40.74, mean_control_pre = 40.63, sd = lobo_irma_sd, mean_control_post = 40.37, mean_treatment_post = 38.31)
stand_result(eff_type = "d_i_d", raw_effect_size = lobo_irma_3month, n_c = 114, n_t = 117, ctrl_sd = lobo_irma_sd)

##### 7 month
lobo_irma_7month <- did_calculator(mean_treatment_pre = 40.74, mean_control_pre = 40.63, sd = lobo_irma_sd, mean_control_post = 40.16, mean_treatment_post = 40.78)
stand_result(eff_type = "d_i_d", raw_effect_size = lobo_irma_7month, n_t = 114, n_c = 117, ctrl_sd = lobo_irma_sd)



### ses
#### 3 month
stand_result(eff_type = "log_odds_ratio", raw_effect_size = -.28, n_t = 137, n_c = 149)

#### 7 month
stand_result(eff_type = "log_odds_ratio", raw_effect_size = .27, n_t = 131, n_c = 128)

## Stephens -----------------------------------
### note this study is only men, i am just using the function not usually used for this case
stephens_treatment <- weighted_average(men_average = 3.06, women_average = 2.01, n_men = 12, n_women = 11)
stephens_control <- weighted_average(men_average = 2.79, women_average = 2.73, n_men = 10, n_women = 12)

stephens_dim <- dim_calculator(mean_control = stephens_control, mean_treatment = stephens_treatment)
stephens_sd <- weighted_sd(ns = c(10,12), sds = c(1.44, .78), means = c(2.79, 2.73))
stand_result(eff_type = "d_i_m", raw_effect_size = stephens_dim, n_t = 12+11, n_c = 10+12, ctrl_sd = stephens_sd)

# 2003 ===========================
## Johansson-Love -----------------------------------=
### post
stand_result(eff_type = "f_test", raw_effect_size = 9.687, n_t = 78, n_c = 73)
stand_result(eff_type = "f_test", raw_effect_size = 11.215, n_t = 78, n_c = 73)


## Meraviglia -----------------------------------
meraviglia_log <- log_odds_ratio(n_control = 380, n_treatment = 349, percent_control = .27, percent_treatment = .36) # students
stand_result(eff_type = "log_odds_ratio", raw_effect_size = meraviglia_log, n_t = 6, n_c = 6)

meraviglia_log_staff <- log_odds_ratio(n_control = 239, n_treatment = 222, percent_control = .71, percent_treatment = .70) # staff
stand_result(eff_type = "log_odds_ratio", raw_effect_size = meraviglia_log_staff, n_t = 6, n_c = 6)

## O'Donohue -----------------------------------
### pilot
stand_result(eff_type = "t_test", raw_effect_size = -4.45, n_t = 33, n_c = 33)
### main
stand_result(eff_type = "f_test", raw_effect_size = 31.63, n_t = 50, n_c = 52)


# 2002 ===========================
## Davis Liddell -----------------------------------
### rma post
social_treatment_post <- dim_calculator(mean_control = 40.61, mean_treatment = 34.9)
stand_result(eff_type = "d_i_m", raw_effect_size = social_treatment_post, n_t = 29, n_c = 29, ctrl_sd = 16.57)

traditional_treatment_post <- dim_calculator(mean_control = 40.61, mean_treatment = 33.52)
stand_result(eff_type = "d_i_m", raw_effect_size = traditional_treatment_post, n_t = 29, n_c = 29, ctrl_sd = 16.57)


### atw follow
social_follow <- did_calculator(mean_control_pre = 29.52, mean_treatment_post = 31.69, mean_treatment_pre = 30.28, mean_control_post = 31.38, no_sd_given = T)
traditional_follow <- did_calculator(mean_control_pre = 29.52, mean_treatment_post = 31.69, mean_treatment_pre = 28.97, mean_control_post = 29.9, no_sd_given = T)


davis_dim_traditional <- dim_calculator(mean_control = 40.61, mean_treatment = 33.52)
stand_result(eff_type = "d_i_m", raw_effect_size = davis_dim_traditional, ctrl_sd = 16.57, n_t = 29, n_c = 29)

davis_dim_socialization <- dim_calculator(mean_control = 40.61, mean_treatment = 34.90)
stand_result(eff_type = "d_i_m", raw_effect_size = davis_dim_socialization, ctrl_sd = 16.57, n_t = 29, n_c = 29)


## Douglass -----------------------------------
traditional <- dim_calculator(mean_control = 52.67, mean_treatment = 42.5)
stand_result(eff_type = "d_i_m", n_c = 64, n_t = 62, ctrl_sd = 14.6, raw_effect_size = traditional)

believable_yes <- dim_calculator(mean_control = 53.13, mean_treatment = 47.25)
stand_result(eff_type = "d_i_m", n_c = 64, n_t = 59, ctrl_sd = 13.25, raw_effect_size = believable_yes)


## Glickman -----------------------------------
### attitudes toward sexual violence ; lower better
sexual_pre <- weighted_average(women_average = 22.65, men_average = 21, n_men = 47, n_women = 49)
sexual_post <- weighted_average(women_average = 20.07, men_average = 18.92, n_men = 47, n_women = 49)
sexual_sd <- weighted_sd(ns = c(49, 47), sds = c(7.62, 7.78), means = c(20.07, 18.92))
sexual_dim <- dim_calculator(mean_control = sexual_pre, mean_treatment = sexual_post)
stand_result(eff_type = "d_i_m", raw_effect_size = sexual_dim, n_t = 48, n_c = 48, ctrl_sd = sexual_sd)

### behavior negative pg 63 (only those in relationships)
perp <- dim_calculator(mean_control = 9.3, mean_treatment = 7.52)
stand_result(eff_type = "d_i_m", n_t = 34, n_c = 34, raw_effect_size = perp, ctrl_sd = 6.05)

victim <- dim_calculator(mean_control = 10.38, mean_treatment = 9.03)
stand_result(eff_type = "d_i_m", n_t = 34, n_c = 34, raw_effect_size = victim, ctrl_sd = 9.61)

## Sanchez-Cesareo -----------------------------------
### Study 1
### knowledge
#### higher is better 
s1_k_post <- did_calculator(mean_control_pre = 6.64, mean_treatment_pre = 6.52, mean_control_post = 6.17, mean_treatment_post = 6.1) # post
stand_result(eff_type = "d_i_d", n_t = 501, n_c = 191, ctrl_sd = 2.07, raw_effect_size = s1_k_post)

s1_k_follow <- did_calculator(mean_control_pre = 6.64, mean_treatment_pre = 6.52, mean_control_post = 6.06, mean_treatment_post = 6.05) # follow
stand_result(eff_type = "d_i_d", n_t = 501, n_c = 191, ctrl_sd = 2.07, raw_effect_size = s1_k_follow)

### Study 2
s2f_k_p <- dim_calculator(mean_control = 4.39, mean_treatment = 4.05) # full
stand_result(eff_type = "d_i_m", ctrl_sd = 2.19, n_t = 187, n_c = 187, raw_effect_size = s2f_k_p)

s2f_k_f <- dim_calculator(mean_control = 4.39, mean_treatment = 4.71) # full
stand_result(eff_type = "d_i_m", ctrl_sd = 2.19, n_t = 187, n_c = 187, raw_effect_size = s2f_k_f)

s2m_k_p <- dim_calculator(mean_control = 5.04, mean_treatment = 4.83) # minimal
stand_result(eff_type = "d_i_m", ctrl_sd = 1.95, n_t = 159, n_c = 159, raw_effect_size = s2m_k_p)

s2m_k_f <- dim_calculator(mean_control = 5.04, mean_treatment = 4.79) # minimal
stand_result(eff_type = "d_i_m", ctrl_sd = 1.95, n_t = 159, n_c = 159, raw_effect_size = s2m_k_p)


## Whitlock -----------------------------------
### higher is better 
whitlock <- did_calculator(mean_control_pre = 1.43, mean_treatment_pre = 1.44, mean_control_post = 1.38, mean_treatment_post = 1.68)
stand_result(eff_type = "d_i_d", raw_effect_size = whitlock, ctrl_sd = .68, n_t = 65, n_c = 98)

# 2001 ==============================
## Bingham -----------------------------------
#### higher is better
bingham_knowledge <- dim_calculator(mean_control = 3.94, mean_treatment = 4.33)
stand_result(eff_type = "d_i_m", n_t = 197, n_c = 319, ctrl_sd = .99, raw_effect_size = bingham_knowledge)

## Gidycz -----------------------------------
### low is better
male_gidycz <- did_calculator(mean_control_pre = 26.24, mean_control_post = 26.7, mean_treatment_pre = 25.84, mean_treatment_post = 25.12, sd = 8.27)
stand_result(eff_type = "d_i_d", raw_effect_size = male_gidycz, n_t = 150, n_c = 150, ctrl_sd = 8.27)

female_gidycz <- did_calculator(mean_control_pre = 20.69, mean_control_post = 19.66, mean_treatment_pre = 20.15, mean_treatment_post = 18.53, sd = 7.04)
stand_result(eff_type = "d_i_d", raw_effect_size = female_gidycz, n_t = 351, n_c = 460, ctrl_sd = 7.04)


control_n_none <- sum(43, 63, 175)
experimental_n_none <- sum(43, 109, 201)
control_n_some <- sum(9, 25, 14)
experimental_n_some <- sum(13, 53, 15)
control_n_rape <- sum(10, 8, 0)
experimental_n_rape <- sum(18, 5, 2)

total_control <- c(control_n_none, control_n_some, control_n_rape)
total_experimental <- c(experimental_n_none, experimental_n_some, experimental_n_rape)
x <- matrix(c(total_control, total_experimental), nrow = 3)
chisq.test(x)


women_ses_d <- chisq_2_d(2.238, df = 2, n = sum(total_control, total_experimental))
stand_result(eff_type = "d", raw_effect_size = women_ses_d, n_t = 5, n_c = 5)

## Lydiard -----------------------------------
### high is good
lydiard <- did_calculator(mean_treatment_post = 46.93, mean_treatment_pre = 45.13, mean_control_post = 45.42, mean_control_pre = 45.31)
stand_result(eff_type = "d_i_d", ctrl_sd = 4.47, n_t = 95, n_c = 62, raw_effect_size = lydiard)

## Pacifici -----------------------------------
pacifici_did <- did_calculator(mean_control_pre = 2, mean_control_post = 1.94, mean_treatment_pre = 2.09, mean_treatment_post = 1.91, sd = .64)
stand_result(eff_type = "d_i_d", raw_effect_size = pacifici_did, n_c = 219, n_t = 239, ctrl_sd = .64)

## Robb -----------------------------------
stand_result(eff_type = "t_test", raw_effect_size = 1.67, n_t = 44, n_c = 46)

## Sanchez -----------------------------------
sanchez_sd <- se_2_sd(.102, n = 6)
sanchez_3month <- dim_calculator(mean_control = 7.05, mean_treatment = 7.65)
stand_result(eff_type = "d_i_m", raw_effect_size = sanchez_3month, n_c = 6, n_t = 6, ctrl_sd = sanchez_sd)

sanchez_6month <- dim_calculator(mean_control = 7.05, mean_treatment = 7.96)
stand_result(eff_type = "d_i_m", raw_effect_size = sanchez_6month, n_c = 6, n_t = 6, ctrl_sd = sanchez_sd)

## Ward -----------------------------------
ward <- did_calculator(mean_treatment_post = 1.76, mean_treatment_pre = 1.97, mean_control_pre = 1.92, mean_control_post = 1.93)
stand_result(eff_type = "d_i_d", raw_effect_size = ward, no_sd_given = T, n_t = 155, n_c = 64.8)

## Weisz -----------------------------------
stand_result(eff_type = "f_test", raw_effect_size = 1.05, n_c = 14, n_t = 14)

### higher is better 
weisz_follow <- did_calculator(mean_control_pre = 91.00, mean_control_post = 86.44, mean_treatment_pre = 82.40, mean_treatment_post = 91.70, sd = 13.07)
stand_result(eff_type = "d_i_d", raw_effect_size = weisz_follow, n_t = 20, n_c = 9, ctrl_sd = 13.07)


# 2000 =================================

## Beadner -----------------------------------
bead_sd <- 12.45

bead_post <- did_calculator(mean_control_pre = 41.75, mean_treatment_pre = 44.14, mean_control_post = 38.84, mean_treatment_post = 41.68)
stand_result(eff_type = "d_i_d", ctrl_sd = bead_sd, n_t = 48, n_c = 40, raw_effect_size = bead_post)

bead_follow <- did_calculator(mean_control_pre = 41.75, mean_treatment_pre = 44.14, mean_treatment_post = 40.18, mean_control_post = 39.98)
stand_result(eff_type = "d_i_d", ctrl_sd = bead_sd, n_t = 48, n_c = 40, raw_effect_size = bead_follow)



## Black -----------------------------------
black_post <- dim_calculator(mean_control = 25.9, mean_treatment = 23.3)
stand_result(eff_type = "d_i_m", raw_effect_size = black_post, n_t = 17, n_c = 17, ctrl_sd = 8.1)

black_follow <- dim_calculator(mean_control = 25.9, mean_treatment = 22.3)
stand_result(eff_type = "d_i_m", raw_effect_size = black_follow, n_t = 17, n_c = 17, ctrl_sd = 8.1)

## Foshee -----------------------------------
### behavior vict
foshee_2000_did_beh <- did_calculator(mean_control_pre = .11, mean_treatment_pre = .11, mean_control_post = .2, mean_treatment_post = .17)
stand_result(eff_type = "d", raw_effect_size = 0, n_t = 7, n_c = 7, no_sd_given = T)

### behavior perp
foshee_2000_did_beh_perp <- did_calculator(mean_control_pre = .03, mean_treatment_pre = .03, mean_treatment_post = .06, mean_control_post = .07)
stand_result(eff_type = "d", raw_effect_size = 0, no_sd_given = T, n_t = 7, n_c = 7)


### acceptance of dating violence
foshee_2000_did_dvio <- did_calculator(mean_control_pre = .53, mean_control_post = .54, mean_treatment_pre = .5, mean_treatment_post = .44)
stand_result(eff_type = "d_i_d", raw_effect_size = foshee_2000_did_dvio, n_t = 7, n_c = 7, no_sd_given = T)


## Foubert -----------------------------------
### i don't do rma post b/c they are combining the numbers in solomon 4 group
### follow
foubert_2000_dim <- dim_calculator(mean_control = 42.77, mean_treatment = 39.87)
stand_result(eff_type = "d_i_m", raw_effect_size = foubert_2000_dim, n_c = 4, n_t = 4, ctrl_sd = 12.74)

### ses
foubert_2000_ses <- dim_calculator(mean_control = .35, mean_treatment = .44)
stand_result(eff_type = "d_i_m", raw_effect_size = foubert_2000_ses, n_t = 4, n_c = 4, ctrl_sd = 1.53)

## Lonsway -----------------------------------
workshop <- dim_calculator(mean_control = 2.13, mean_treatment = 1.74)
stand_result(eff_type = "d_i_m", raw_effect_size = workshop, n_c = 67, n_t = 48, ctrl_sd = .86)

psych_class <- dim_calculator(mean_control = 2.13, mean_treatment = 2.02)
stand_result(eff_type = "d_i_m", raw_effect_size = psych_class, n_t = 76, n_c = 67, ctrl_sd = .86)

## Shultz -----------------------------------
shultz_treatment <- mean(c(83.18, 81.73)) # combine post treatments
shultz_dim <- dim_calculator(mean_treatment = shultz_treatment, mean_control = 74.25)
stand_result(eff_type = "d_i_m", raw_effect_size = shultz_dim, n_t = 40, n_c = 20, no.sd.given = T)

## Siebold -----------------------------------
stand.result(eff.type = "f.test", n.t = 150, n.c = 150, u.s.d = .685)

## Smith -----------------------------------
male_n = 83 + 2
female_n = 91 + 2
not_specified_n = 18 + 2
all_n <- male_n + female_n + not_specified_n
### note this is an sd approximation b/c we don't have info for the not specified gender people
smith_sd <- weighted_sd(ns = c(male_n, female_n), means = c(61.55, 52.95), sds = c(5.84, 6.68))

smith_pre <- weighted.mean(x = c(52.92, 61.55, 57.67), w = c(male_n, female_n, not_specified_n))
smith_post <- weighted.mean(x = c(58.88, 65.5, 60.81), w = c(male_n, female_n, not_specified_n))

smith_dim <- dim_calculator(mean_control = smith_pre, mean_treatment = smith_post)


stand_result(eff_type = "d_i_m", raw_effect_size = smith_dim, n_c = all_n, n_t = all_n, ctrl_sd = smith_sd)


## Wright -----------------------------------
wright_n = sum(245, 257, 196)
pre_percent <- weighted.mean(x = c(59, 72, 64), w = c(245, 257, 196)) / 100
post_percent <- weighted.mean(x = c(84, 88, 79), w = c(245, 257, 196)) / 100

wright_log_odds <- log_odds_ratio(n_treatment = wright_n, n_control = wright_n, percent_control = pre_percent, percent_treatment = post_percent)
stand_result(eff_type = "log.odds_ratio", raw_effect_size = wright_log_odds, n_t = wright_n, n_c = wright_n)

# 1999 ==================================
## Berg -----------------------------------
berg_male <- dim_calculator(mean_control = 1.27, mean_treatment = 1.63) # male
stand_result(eff_type = "d_i_m", ctrl_sd = .4, n_c = 17, n_t = 18, raw_effect_size = berg_male)

berg_female <- dim_calculator(mean_control = 1.27, mean_treatment = 1.4) # female
stand_result(eff_type = "d_i_m", ctrl_sd = .4, n_c = 17, n_t = 19, raw_effect_size = berg_female)

## bessire -----------------------------------


## Boegler-Daum -----------------------------------
stand_result(eff_type = "t_test", u_s_d = -6_004, n_t = 28, n_c = 28) # 1 session
stand_result(eff_type = "t_test", u_s_d = -6_124, n_t = 28, n_c = 28) # 6 session


## Breitenbecher -----------------------------------

percent_victimized <- 1 - .26
percent_non <- .26
n_treatment <- round(132 * .82, 0)
n_control <- round(143 * .82, 0)

# breit_did <- did_calculator(mean_treatment_pre = 16.38, mean_control_pre = 16.63, mean_control_post = 17.08, mean_treatment_post = 18.57, sd = 2.54)
stand_result(eff_type = "d", n_t = n_treatment, n_c = n_control, raw_effect_size = 0)

### sexual assault knowledge
### high is good
breit_know <- did_calculator(mean_control_pre = 16.63, mean_treatment_pre = 16.38, mean_control_post = 17.08, mean_treatment_post = 18.57)
stand_result(eff_type = "d_i_d", raw_effect_size = breit_know, n_t = n_treatment, n_c = n_control, ctrl_sd = 2.54)

## Burke -----------------------------------
burke_post <- did_calculator(mean_treatment_pre = 44.77, mean_control_pre = 44.5, sd = 16.41, mean_control_post = 43.03, mean_treatment_post = 61.98)
stand_result(eff_type = "d_i_d", n_t = 111, n_c = 109, ctrl_sd = 16.41, raw_effect_size = burke_post)

burke_follow <- did_calculator(mean_treatment_pre = 44.77, mean_control_pre = 44.5, sd = 16.41, mean_control_post = 45.05, mean_treatment_post = 57.39)
stand_result(eff_type = "d_i_d", n_t = 111, n_c = 109, ctrl_sd = 16.41, raw_effect_size = burke_follow)

## miller -----------------------------------
### descriptive

## Davis -----------------------------------
pre_treat <- weighted.mean(x = c(24.97, 23.44), w = c(76, 59))
post_treat <- weighted.mean(x = c(27.15, 26.56), w = c(76, 59))
davis_did <- did_calculator(mean_treatment_pre = pre_treat, mean_treatment_post = post_treat, mean_control_pre = 8.39, mean_control_post = 7.47)
stand_result(eff_type = "d_i_d", n_c = 2, n_t = 2, ctrl_sd = 7.15, raw_effect_size = davis_did)

## Heppner -----------------------------------
stand_result(eff_type = "d", raw_effect_size = 0, n_t = 39, n_c = 39)

## Saberi -----------------------------------
drama <- weighted_average(men_average = 40.02, n_men = 20, women_average = 38.09, n_women = 24) # drama
video <- weighted_average(men_average = 39.3, n_men = 23, women_average = 34.55, n_women = 25) # video
lecture <- weighted_average(men_average = 33.52, n_men = 16, women_average = 31.62, n_women = 19) # lecture
control <- weighted_average(men_average = 39.89, n_men = 19, women_average = 34.36, n_women = 19) # control
saberi_sd <- se_2_sd(se = 1.85, n = 19)

drama_dim <- dim_calculator(mean_control = control, mean_treatment = drama)
video_dim <- dim_calculator(mean_control = control, mean_treatment = video)
lecture_dim <- dim_calculator(mean_control = control, mean_treatment = lecture)

stand_result(eff_type = "d_i_m", n_t = 5, n_c = 5, ctrl_sd = saberi_sd, raw_effect_size = drama_dim)
stand_result(eff_type = "d_i_m", n_t = 5, n_c = 5, ctrl_sd = saberi_sd, raw_effect_size = video_dim)
stand_result(eff_type = "d_i_m", n_t = 5, n_c = 5, ctrl_sd = saberi_sd, raw_effect_size = lecture_dim)

## Stratgeier
### ses
stand_result(eff_type = "d", n_t = 42, n_c = 42, raw_effect_size = 0) # male sexual
stand_result(eff_type = "d", n_t = 42, n_c = 42, raw_effect_size = .34) # male legal
stand_result(eff_type = "d", n_t = 79.5, n_c = 79.5, raw_effect_size = .33) # female sexual
stand_result(eff_type = "d", n_t = 79.5, n_c = 79.5, raw_effect_size = .14) # female legal

### rma
strat_pre_sex <- weighted_average(men_average = 57.36, women_average = 53.25, n_men = 42, n_women = 79.5) # sexual
strat_post_sex <- weighted_average(men_average = 54.87, women_average = 51.59, n_men = 42, n_women = 79.5) # sexual
strat_sex_dim <- dim_calculator(mean_control = strat_pre_sex, mean_treatment = strat_post_sex)
sex_sd <- weighted_sd(ns = c(41, 79.5), sds = c(10.29, 11.93), means = c(57.36, 53.25))

stand_result(eff_type = "d_i_m", n_t = 41+79.5, n_c = 41+79.5, ctrl_sd = sex_sd, raw_effect_size = strat_sex_dim)

strat_pre_legal <- weighted_average(men_average = 61.95, women_average = 53.21, n_men = 42, n_women = 79.5) # legal
strat_post_legal <- weighted_average(men_average = 57.84, women_average = 50.64, n_men = 42, n_women = 79.5) # legal
legal_sd <- weighted_sd(ns = c(41, 79.5), sds = c(12.16, 10.07), means = c(61.95, 53.21))
strat_legal_dim <- dim_calculator(mean_control = strat_pre_legal, mean_treatment = strat_post_legal)

stand_result(eff_type = "d_i_m", raw_effect_size = strat_legal_dim, ctrl_sd = legal_sd, n_t = 41+79.5, n_c = 41+79.5)



# 1998 ==================================
## Anderson -----------------------------------
video_post <- did_calculator(mean_control_pre = 52.1, mean_control_post = 51.9, mean_treatment_pre = 51.9, mean_treatment_post = 49, sd = 7.1)
stand_result(eff_type = "d_i_d", raw_effect_size = video_post, n_c = 10/3, n_t = 10/3, ctrl_sd = 7.1)

talk_show_post <- did_calculator(mean_control_pre = 52.1, mean_control_post = 51.9, mean_treatment_pre = 52.8, mean_treatment_post = 50.4, sd = 7.1)
stand_result(eff_type = "d_i_d", raw_effect_size = talk_show_post, n_c = 10/3, n_t = 10/3, ctrl_sd = 7.1)

video_follow <- did_calculator(mean_control_pre = 52.1, mean_control_post = 52.2, mean_treatment_pre = 51.9, mean_treatment_post = 52.1, sd = 7.1)
stand_result(eff_type = "d_i_d", raw_effect_size = video_follow, n_c = 10/3, n_t = 10/3, ctrl_sd = 7.1)

talk_show_follow <- did_calculator(mean_control_pre = 52.1, mean_control_post = 52.2, mean_treatment_pre = 52.8, mean_treatment_post = 51.9, sd = 7.1)
stand_result(eff_type = "d_i_d", raw_effect_size = talk_show_follow, n_c = 10/3, n_t = 10/3, ctrl_sd = 7.1)

## Chasan-Taber -----------------------------------
### child sexual abuse

## Diegel -----------------------------------
### qualitative

## Duggan -----------------------------------
### no sds given
pre_test <- weighted.mean(x = c(57.4, 30.5), w = c(201, 138))
post_test <- weighted.mean(x = c(49.8, 23.8), w = c(201, 138))
follow_test <- weighted.mean(x = c(51.8, 25.5), w = c(201, 138))

duggan_did_post <- did_calculator(mean_control_pre = 45.4, mean_control_post = 39.3, mean_treatment_pre = 47, mean_treatment_post = 36)
stand_result(eff_type = "d_i_d", raw_effect_size = duggan_did_post, n_c = 116, n_t = 223, no_sd_given = T)

duggan_dim_follow <- dim_calculator(mean_control = pre_test, mean_treatment = follow_test)
stand_result(eff_type = "d_i_m", raw_effect_size = duggan_dim_follow, n_t = 339, n_c = 339, no.sd.given = T)


## Echols -----------------------------------
### post
stand_result(eff_type = "t_test", raw_effect_size = -5.23, n_t = 76, n_c = 64)
### follow
echols_did_follow <- did_calculator(mean_control_pre = 19.52, mean_treatment_pre = 23.68, mean_control_post = 19.33, mean_treatment_post = 21.42, sd = 5.55)
stand_result(eff_type = "d_i_d", raw_effect_size = echols_did_follow, n_c = 64, n_t = 76, ctrl_sd = 5.55)

## Foshee -----------------------------------
#### no sd given
foshee_did_1998_beh <- did_calculator(mean_treatment_pre = .04, mean_treatment_post = .02, mean_control_pre = .03, mean_control_post = .05)
stand_result(eff_type = "d_i_d", raw_effect_size = foshee_did_1998_beh, n_t = 7, n_c = 7, no_sd_given = T)

foshee_did_1998_att <- did_calculator(mean_control_pre = .54, mean_treatment_pre = .52, mean_control_post = .56, mean_treatment_post = .42)
stand_result(eff_type = "d_i_d", raw_effect_size = foshee_did_1998_att, n_t = 7, n_c = 7, no_sd_given = T)


## Foubert -----------------------------------
stand_result(eff_type = "f_test", raw_effect_size = 62.86, n_t = 4, n_c = 2)


## Hilton -----------------------------------
hilton_post <- dim_calculator(mean_control = .1, mean_treatment = .23)
stand_result(eff_type = "d_i_m", raw_effect_size = hilton_post, n_t = 4, n_c = 4, no.sd.given = T)

hilton_follow <- dim_calculator(mean_control = .1, mean_treatment = .056)
stand_result(eff_type = "d_i_m", raw_effect_size = hilton_follow, n_t = 4, n_c = 4, no.sd.given = T)

## Lanier -----------------------------------
### i am double counting the control pre b/c not given; no sds
lanier_did <- did_calculator(mean_treatment_pre = 4.07, mean_control_pre = 4.07, mean_treatment_post = 4.17, mean_control_post = 4.08)

stand_result(eff_type = "d_i_d", raw_effect_size = lanier_did, no_sd_given = T, n_t = 218, n_c = 218)

## Lonsway -----------------------------------
care_post <- dim_calculator(mean_control = 1.59, mean_treatment = 1.27)
stand_result(eff_type = "d_i_m", raw_effect_size = care_post, n_c = 62, n_t = 54, ctrl_sd = .54)


care_follow <- dim_calculator(mean_control = 1.59, mean_treatment = 1.17)
stand_result(eff_type = "d_i_m", raw_effect_size = care_follow, n_c = 62, n_t = 34, ctrl_sd = .54)

human_follow <- dim_calculator(mean_control = 1.77, 1.58)
stand_result(eff_type = "d_i_m", raw_effect_size = human_follow, n_c = 37, n_t = 21, ctrl_sd = .53)


## Mandellblat -----------------------------------
### i am just adding rma items, not sure if any are reverse coded
rm_female_pre <- sum(15.01, 3.86, 3.55, 1.39, 2.47, 2.56, 2.35, 2.39)
rm_female_post <- sum(16.11, 4.1, 3.98, 1.26, 2.22, 2.26, 2.11, 2.14)
rm_female_follow <- sum(16.17, 3.78, 3.83, 1.35, 2.33, 2.25, 2.14, 2.19)
rm_male_pre <- sum(13.69, 3.63, 3.72, 1.68, 2.64, 2.91, 2.64, 2.39)
rm_male_post <- sum(15.17, 3.94, 3.87, 1.66, 2.53, 2.69, 2.67, 2.49)
rm_male_follow <- sum(14.48, 3.8, 3.91, 1.68, 2.48, 2.86, 2.55, 2.42)

female_pre_sd <-
weighted_sd(ns = c(89*4, 86, 86, 88, 88, 88, 88, 88), sds = c(3.11, 1.13, 1.08, .88, .99, 1.29, 1.08, 1.11), means = c(15.01, 3.86, 3.55, 1.39, 2.47, 2.56, 2.35, 2.39))

male_pre_sd <-
  weighted_sd(ns = c(86*4, 86, 85, 85, 85, 84, 83, 85), sds = c(3.49, 1.23, .91, 1.09, .93, 1.34, .99, 1.08), means = c(13.69, 3.63, 3.72, 1.68, 2.64, 2.91, 2.64, 2.39))



### using RMS 1-4 as my indicator for n's
pre_sd <- weighted_sd(sds = c(female_pre_sd, male_pre_sd), means = c(rm_female_pre, rm_male_pre), ns = c(89, 86))

rm_pre <- weighted_average(men_average = rm_male_pre, women_average = rm_female_pre, n_men = 86, n_women = 89)
rm_post <- weighted_average(men_average = rm_male_post, women_average = rm_female_post, n_women = 89, n_men = 86)
rm_follow <- weighted_average(women_average = rm_female_follow, men_average = rm_male_follow, n_men = 86, n_women = 89)

rm_post_dim <- dim_calculator(mean_control = rm_pre, mean_treatment = rm_post)
rm_follow_dim <- dim_calculator(mean_control = rm_pre, mean_treatment = rm_follow)

stand_result(eff_type = "d_i_m", raw_effect_size = rm_post_dim, n_t = 8, n_c = 8, ctrl_sd = pre_sd)
stand_result(eff_type = "d_i_m", raw_effect_size = rm_follow_dim, n_t = 8, n_c = 8, ctrl_sd = pre_sd)

## Mitenberge
### this is a weird study about 5 women with ID; not comparable to others

## Perry -----------------------------------
perry_knowledge_sd <- s_pooled(total_n = 17+17, n_treatment = 17, n_control = 17, outcome_sd = 1.72, reg_coef = .37)
perry_beh_sd <- s_pooled(total_n = 17+17, n_treatment = 17, n_control = 17, outcome_sd = .96, reg_coef = -.15)
stand_result(eff_type = "reg_coef", raw_effect_size = .37,   n_t = 17, n_c = 17, ctrl_sd = perry_knowledge_sd)  # att
stand_result(eff_type = "reg_coef", raw_effect_size = -.15,   n_t = 17, n_c = 17, ctrl_sd = perry_beh_sd)  # behavior

## Pinzone Glover -----------------------------------
pre_treat <- weighted_average(men_average = 27.03, n_men = 30, women_average = 20.2, n_women = 46)
post_treat <- weighted_average(men_average = 21.97, n_men = 30, women_average = 17.76, n_women = 46)
pre_control <- weighted_average(men_average = 29.14, n_men = 29, women_average = 19.98, n_women = 46)
post_control <- weighted_average(men_average = 28.66, n_men = 29, women_average = 19.98, n_women = 46)
control_sd <- weighted_sd(ns = c(29, 46), sds = c(8.57, 6.77), means = c(29.14, 19.98))

glover_did <- did_calculator(mean_control_pre = pre_control, mean_control_post = post_control, mean_treatment_pre = pre_treat, mean_treatment_post = post_treat, sd = control_sd)

stand_result(eff_type = "d_i_d", raw_effect_size = glover_did, n_c = 29+46,
             n_t = 30+46,
             ctrl_sd = control_sd)

## Protocampise -----------------------------------

total_n <- 174 + 263
treatment_sd <- s_pooled(reg_coef = 1.736, total_n = total_n, n_treatment = 174, n_control = 263, outcome_sd = 3.9)
stand_result("reg_coef", raw_effect_size = 1.736, n_c = 174, n_t = 263, ctrl_sd = treatment_sd)

## Silverman -----------------------------------
m_1 <- mean(c(3.55, 5.93, 6.24, 6.04))
m_2 <- mean(c(4.44, 6.05, 6.33, 5.87))

f_1 <- mean(c(3.99, 6.22, 6.48, 6.3))
f_2 <- mean(c(4.75, 6.46, 6.62, 6.51))

t1 <- weighted_average(men_average = m_1, women_average = f_1, n_men = 61+24+66, n_women = 93+21+60)
t2 <- weighted_average(men_average = m_2, women_average = f_2, n_men = 61+24+66, n_women = 93+21+60)
t1_sd <- weighted_sd(means = c(3.55, 5.93, 6.24, 6.04, 3.99, 6.22, 6.48, 6.3),
            sds = c(1.81, 1.07, 1.34, 1.37, 1.77, .84, 1, 1.12),
            ns = c(rep(61+24+66, 4), rep(93+21+60, 4)))

silverman_dim_post <- dim_calculator(mean_control = t1, mean_treatment = t2)
stand_result(eff_type = "d_i_m", raw_effect_size = silverman_dim_post, ctrl_sd = t1_sd, n_t = 1, n_c = 1)

rm1_t1 <- weighted_average(men_average = 3.02, women_average = 4.14, n_men = 24+66, n_women = 21+60)
rm1_t3 <- weighted_average(men_average = 3.67, women_average = 4.92, n_men = 24+66, n_women = 21+60)
rm1_dim <- dim_calculator(mean_control = rm1_t1, mean_treatment = rm1_t3)
rm1_sd <- weighted_sd(ns = c(24+66, 21+60), sds = c(1.69, 1.66), means = c(3.02, 4.14))
stand_result(eff_type = "d_i_m", raw_effect_size = rm1_dim, ctrl_sd = rm1_sd, n_t = 1, n_c = 1)

# 1997 =========================
## Averyleaf -----------------------------------
n_women_treatment <- 102*.42
n_women_control <- 90*.63
n_men_treatment <- 102*(1 - .42)
n_men_control <- 90*(1 - .63)
weighted_sd(sds = c(1.2, 2.12),
            ns = c(n_men_control, n_women_control),
            means = c(3.6, 4.53))
control_sd <- weighted_sd(sds = c(1.2, 2.12),
                          ns = c(n_men_control, n_women_control),
                          means = c(3.6, 4.53)) # i am assuming these are SD's, but it is not actually labelled

treatment_pre <-
  weighted_average(men_average = 4.27, n_men = n_men_treatment,
                   women_average = 5.3, n_women = n_women_treatment)
treatment_post <-
  weighted_average(men_average = 3.71, n_men = n_men_treatment,
                   women_average = 4.25, n_women = n_women_treatment)

control_pre <-
  weighted_average(men_average = 3.6, n_men = n_men_control,
                   women_average = 4.53, n_women = n_women_control)
control_post <-
  weighted_average(men_average = 3.56, n_men = n_men_control,
                   women_average = 4.26, n_women = n_women_control)

### lower is better 
avery_leaf_did <-
  did_calculator(mean_treatment_pre = treatment_pre,
                 mean_treatment_post = treatment_post,
                 mean_control_pre = control_pre,
                 mean_control_post = control_post,
                 sd = control_sd)


stand_result(eff_type = "d_i_d", raw_effect_size = avery_leaf_did, ctrl_sd = control_sd, n_t = 102, n_c = 90) # n clusters not given

#### behavior
#### NS
stand_result(eff_type = "d", raw_effect_size = 0,  n_t = 102, n_c = 90)


## Biviano -----------------------------------
# knowledge; pg 101
beviano_sd <- se_2_sd(se = .26, n = 173)
stand_result(eff_type = "reg_coef", raw_effect_size = .83, n_t = 95, n_c = 78, ctrl_sd = beviano_sd)

## Boulter -----------------------------------
treatement_pre <- mean(c(48.22, 39.91))
control_pre <- mean(c(43, 35.72))
treatment_post <- mean(c(46.13, 37.87))
control_post <- mean(c(45.83, 39.17))
treatment_follow <- mean(c(45.83, 35.09))
control_follow <- mean(c(47.21, 38.34))
control_sd <- weighted_sd(ns = c(4,4), means = c(48.22, 39.91), sds = c(12.79, 12.38))

## lower better 
rma_post <- did_calculator(mean_control_pre = control_pre, mean_control_post = control_post, mean_treatment_pre = treatement_pre, mean_treatment_post = treatment_post, sd = control_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = rma_post, ctrl_sd = control_sd, n_t = 4, n_c = 4)


rma_follow <- did_calculator(mean_control_pre = control_pre, mean_control_post = control_follow, mean_treatment_pre = treatement_pre, mean_treatment_post = treatment_follow, sd = control_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = rma_follow, ctrl_sd = control_sd, n_t = 4, n_c = 4)


## Davis -----------------------------------
### attitude
#### social
# did_calculator(mean_control_pre = 41.69,
#                mean_control_post = 40.62,
#                mean_treatment_pre = 38.31,
#                mean_treatment_post = 34.90,
#                sd = )
# 1st post
davis_traditional <- dim_calculator(mean_control = 40.61, mean_treatment = 33.52)
stand_result(eff_type = "d_i_m", raw_effect_size = davis_traditional, n_c = 29, n_t = 29, ctrl_sd = 16.57)

davis_social <- dim_calculator(mean_control = 40.61, mean_treatment = 34.90)
stand_result(eff_type = "d_i_m", raw_effect_size = davis_social, n_t = 29, n_c = 29, ctrl_sd = 16.57)

# 2nd post
davis_traditional_2 <- dim_calculator(mean_control = 42.52, mean_treatment = 36.04)
stand_result(eff_type = "d_i_m", raw_effect_size = davis_traditional_2, n_t = 29, n_c = 29, ctrl_sd = 19.35)

davis_social_2 <- dim_calculator(mean_control = 42.52, mean_treatment = 37.14)
stand_result(eff_type = "d_i_m", raw_effect_size = davis_social_2, n_t = 29, n_c = 29, ctrl_sd = 19.35)

### behavior
social_pay <- log_odds_ratio(n_control = 29, n_treatment = 29, percent_control = .355, percent_treatment = .483)
stand_result(eff_type = "log.odds_ratio", raw_effect_size = social_pay, n_t = 29, n_c = 29)

traditional_pay <- log_odds_ratio(n_control = 29, n_treatment = 29, percent_control = .355, percent_treatment = .207)
stand_result(eff_type = "log.odds_ratio", raw_effect_size = traditional_pay, n_t = 29, n_c = 29)

## durand -----------------------------------
control_dim <- mean(c(.08, .16, .21, -.19, .3, .41))
int_dim <- mean(c(-.74, 1.14, 1.08, -.44, -.18, -.3))

durand_did <- int_dim - control_dim
stand_result(eff_type = "d_i_d", no_sd_given = T, raw_effect_size = durand_did, n_t = 3, n_c = 3)

## Fay -----------------------------------
fay_post <- did_calculator(mean_treatment_pre = 49.97, mean_treatment_post = 44.49, mean_control_pre = 48.75, mean_control_post = 49.41, sd = 10.65)
stand_result(eff_type = "d_i_d", ctrl_sd = 10.65, raw_effect_size = fay_post, n_t = 76, n_c = 78)

fay_5mo <- dim_calculator(mean_treatment = 41.5, mean_control = 49.97)## 5 mo ; pre post
stand_result(eff_type = "d_i_m", raw_effect_size = fay_5mo, ctrl_sd = 12.03, n_c = 71, n_t = 33)
## Foubert -----------------------------------
t_pre = 40.8
t_post = 28.7
t_follow = 33.7

c_pre = 41.4
c_follow = 37.3
c_sd = 10.6
# post
post <- dim_calculator(mean_control = t_pre, mean_treatment = t_post)
stand_result(eff_type = "d_i_m", raw_effect_size = post, ctrl_sd = c_sd, n_c = 2, n_t = 3)

#### 2 month follow up
follow <- did_calculator(mean_control_pre = c_pre, mean_control_post = c_follow, mean_treatment_pre = t_pre, mean_treatment_post = t_follow, sd = c_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = follow, n_c = 2, n_t = 3, ctrl_sd = c_sd)

## Gillies -----------------------------------
### behavior ns
#### direct
stand_result(eff_type = "d", raw_effect_size = 0, n_c = 75, n_t = 78)
#### standard
stand_result(eff_type = "d", raw_effect_size = 0, n_c = 75, n_t = 72)
### rma
### post
dca_post <- dim_calculator(mean_control = 17.81, mean_treatment = 18.91)
stand_result(eff_type = "d_i_m", ctrl_sd = 9.35, n_c = 75, n_t = 78, raw_effect_size = dca_post)

sp_post <- dim_calculator(mean_control = 17.81, mean_treatment = 17.5)
stand_result(eff_type = "d_i_m", ctrl_sd = 9.35, n_c = 75, n_t = 72, raw_effect_size = sp_post)

### 4 week
dca_4week <- dim_calculator(mean_control = 20.85, mean_treatment = 19.76)
stand_result(eff_type = "d_i_m", ctrl_sd = 11.08, n_c = 75, n_t = 78, raw_effect_size = dca_4week)

sp_4week <- dim_calculator(mean_control = 20.85, mean_treatment = 19.35)
stand_result(eff_type = "d_i_m", ctrl_sd = 11.08, n_c = 75, n_t = 72, raw_effect_size = sp_4week)


## Jansma -----------------------------------
### not our outcomes

## Peterson Homer -----------------------------------
ph_standard_post <- dim_calculator(mean_control = 17.81, mean_treatment = 17.5)
ph_standard_4week <- dim_calculator(mean_control = 20.85, mean_treatment = 19.35)
ph_direct_post <- dim_calculator(mean_control = 17.81, mean_treatment = 18.91)
ph_direct_4week <- dim_calculator(mean_control = 20.85, mean_treatment = 19.76)

stand_result(eff_type = "d_i_m", raw_effect_size = ph_standard_post, ctrl_sd = 9.91, n_c = 75, n_t = 72)
stand_result(eff_type = "d_i_m", raw_effect_size = ph_standard_4week, ctrl_sd = 11.08, n_c = 75, n_t = 72)
stand_result(eff_type = "d_i_m", raw_effect_size = ph_direct_post, ctrl_sd = 9.91, n_c = 75, n_t = 78)
stand_result(eff_type = "d_i_m", raw_effect_size = ph_direct_4week, ctrl_sd = 11.08, n_c = 75, n_t = 78)


## Northham -----------------------------------
dorm = 84
dorm_group = dorm / 4

rotc = 96
rotc_group = rotc / 4

### dorm ----
pre_rma_treatment <- weighted.mean(c(59.84), c(dorm_group))
post_rma_treatment <- weighted.mean(c(61.48, 60.46), c(dorm_group, dorm_group))
follow_rma_treatment <- weighted.mean(c(61.56, 59.85), c(dorm_group, dorm_group))

pre_ses_treatment <- weighted.mean(c(22.52), c(dorm_group))
post_ses_treatment <- weighted.mean(c(22.52, 23.04), c(dorm_group, dorm_group))
follow_ses_treatment <- weighted.mean(c(22.32, 23.12), c(dorm_group, dorm_group))

pre_rma_control <- weighted.mean(c(57.26), c(dorm_group))
post_rma_control <- weighted.mean(c(57.37, 59.93), c(dorm_group, dorm_group))
follow_rma_control <- weighted.mean(c(58, 61.5), c(dorm_group, dorm_group))

pre_ses_control <- weighted.mean(c(21.21), c(dorm_group))
post_ses_control <- weighted.mean(c(21.26, 22.5), c(dorm_group, dorm_group))
follow_ses_control <- weighted.mean(c(21.42, 22.5),  c(dorm_group, dorm_group))

dorm_group <- dorm_group*2
rma_sd <- 10.7
ses_sd <- 2.12

### high score is good
#### rma post
rma_post_did_dorm <- did_calculator(mean_control_pre = pre_rma_control, mean_control_post = post_rma_control, mean_treatment_pre = pre_rma_treatment, mean_treatment_post = post_rma_treatment, sd = rma_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = rma_post_did_dorm, n_c = dorm_group, ctrl_sd = rma_sd, n_t = dorm_group)

#### rma follow
rma_follow_did_dorm <- did_calculator(mean_control_pre = pre_rma_control, mean_control_post = follow_rma_control, mean_treatment_pre = pre_rma_treatment, mean_treatment_post = follow_rma_treatment, sd = rma_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = rma_follow_did_dorm, n_c = dorm_group, ctrl_sd = rma_sd, n_t = dorm_group)

### high is bad
#### ses post
ses_post_did_dorm <- did_calculator(mean_control_pre = pre_ses_control, mean_control_post = post_ses_control, mean_treatment_pre = pre_ses_treatment, mean_treatment_post = post_ses_treatment, sd = ses_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = ses_post_did_dorm, n_c = dorm_group, ctrl_sd = rma_sd, n_t = dorm_group)

#### ses follow
ses_follow_did_dorm <- did_calculator(mean_control_pre = pre_ses_control, mean_control_post = follow_ses_control, mean_treatment_pre = pre_ses_treatment, mean_treatment_post = follow_ses_treatment, sd = ses_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = ses_follow_did_dorm, n_c = dorm_group, ctrl_sd = rma_sd, n_t = dorm_group)


### rotc --------
pre_rma_treatment <- weighted.mean(c(58.82), c(rotc_group))
post_rma_treatment <- weighted.mean(c(59.55, 61.42), c(rotc_group, rotc_group))
follow_rma_treatment <- weighted.mean(c(62.03, 63.08), c(rotc_group, rotc_group))

pre_ses_treatment <- weighted.mean(c(21.94), c(rotc_group))
post_ses_treatment <- weighted.mean(c(21.97, 22.37), c(rotc_group, rotc_group))
follow_ses_treatment <- weighted.mean(c(22.1, 22.32), c(rotc_group, rotc_group))

pre_rma_control <- weighted.mean(c(54.83), c(rotc_group))
post_rma_control <- weighted.mean(c(56.89, 61.15), c(rotc_group, rotc_group))
follow_rma_control <- weighted.mean(c(62.53, 62.31), c(rotc_group, rotc_group))

pre_ses_control <- weighted.mean(c(21.78), c(rotc_group))
post_ses_control <- weighted.mean(c(21.82, 22.73), c(rotc_group, rotc_group))
follow_ses_control <- weighted.mean(c(21.94, 22.54),  c(rotc_group, rotc_group))

rotc_group = rotc_group*2
rma_sd <- 8.81
ses_sd <- .94


#### rma post
rma_post_did_rotc <- did_calculator(mean_control_pre = pre_rma_control, mean_control_post = post_rma_control, mean_treatment_pre = pre_rma_treatment, mean_treatment_post = post_rma_treatment, sd = rma_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = rma_post_did_rotc, n_c = rotc_group, ctrl_sd = rma_sd, n_t = rotc_group)

#### rma follow
rma_follow_did_rotc <- did_calculator(mean_control_pre = pre_rma_control, mean_control_post = follow_rma_control, mean_treatment_pre = pre_rma_treatment, mean_treatment_post = follow_rma_treatment, sd = rma_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = rma_follow_did_rotc, n_c = rotc_group, ctrl_sd = rma_sd, n_t = rotc_group)

#### ses post
ses_post_did_rotc <- did_calculator(mean_control_pre = pre_ses_control, mean_control_post = post_ses_control, mean_treatment_pre = pre_ses_treatment, mean_treatment_post = post_ses_treatment, sd = ses_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = ses_post_did_rotc, n_c = rotc_group, ctrl_sd = rma_sd, n_t = rotc_group)

#### ses follow
ses_follow_did_rotc <- did_calculator(mean_control_pre = pre_ses_control, mean_control_post = follow_ses_control, mean_treatment_pre = pre_ses_treatment, mean_treatment_post = follow_ses_treatment, sd = ses_sd)
stand_result(eff_type = "d_i_d", raw_effect_size = ses_follow_did_rotc, n_c = rotc_group, ctrl_sd = rma_sd, n_t = rotc_group)



### both (leaving this in for historical reasons)
# pre_rma_treatment <- weighted.mean(c(59.84, 58.82), c(dorm_group, rotc_group))
# post_rma_treatment <- weighted.mean(c(61.48, 60.46, 59.55, 61.42), c(dorm_group, dorm_group, rotc_group, rotc_group))
# follow_rma_treatment <- weighted.mean(c(61.56, 59.85, 62.03, 63.08), c(dorm_group, dorm_group, rotc_group, rotc_group))
# 
# pre_ses_treatment <- weighted.mean(c(22.52, 21.94), c(dorm_group, rotc_group))
# post_ses_treatment <- weighted.mean(c(22.52, 23.04, 21.97, 22.37), c(dorm_group, dorm_group, rotc_group, rotc_group))
# follow_ses_treatment <- weighted.mean(c(22.32, 23.12, 22.1, 22.32), c(dorm_group, dorm_group, rotc_group, rotc_group))
# 
# pre_rma_control <- weighted.mean(c(57.26, 54.83), c(dorm_group, rotc_group))
# post_rma_control <- weighted.mean(c(57.37, 59.93, 56.89, 61.15), c(dorm_group, dorm_group, rotc_group, rotc_group))
# follow_rma_control <- weighted.mean(c(58, 61.5, 62.53, 62.31), c(dorm_group, dorm_group, rotc_group, rotc_group))
# 
# pre_ses_control <- weighted.mean(c(21.21, 21.78), c(dorm_group, rotc_group))
# post_ses_control <- weighted.mean(c(21.26, 22.5, 21.82, 22.73), c(dorm_group, dorm_group, rotc_group, rotc_group))
# follow_ses_control <- weighted.mean(c(21.42, 22.5, 21.94, 22.54),  c(dorm_group, dorm_group, rotc_group, rotc_group))
# 
# 
# rma_sd <- weighted_sd(ns = c(dorm_group, rotc_group), means = c(59.84, 58.82), sds = c(7.19, 9.67))
# ses_sd <- weighted_sd(ns = c(dorm_group, rotc_group), means = c(22.52, 21.94), sds = c(1.45, .93))
# 
# 
# #### rma post
# rma_post_did <- did_calculator(mean_control_pre = pre_rma_control, mean_control_post = post_rma_control, mean_treatment_pre = pre_rma_treatment, mean_treatment_post = post_rma_treatment, sd = rma_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = rma_post_did, n_c = dorm_group+rotc_group, ctrl_sd = rma_sd, n_t = dorm_group+rotc_group)
# 
# #### rma follow
# rma_follow_did <- did_calculator(mean_control_pre = pre_rma_control, mean_control_post = follow_rma_control, mean_treatment_pre = pre_rma_treatment, mean_treatment_post = follow_rma_treatment, sd = rma_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = rma_follow_did, n_c = dorm_group+rotc_group, ctrl_sd = rma_sd, n_t = dorm_group+rotc_group)
# 
# #### ses post
# ses_post_did <- did_calculator(mean_control_pre = pre_ses_control, mean_control_post = post_ses_control, mean_treatment_pre = pre_ses_treatment, mean_treatment_post = post_ses_treatment, sd = ses_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = ses_post_did, n_c = dorm_group+rotc_group, ctrl_sd = rma_sd, n_t = dorm_group+rotc_group)
# 
# #### ses follow
# ses_follow_did <- did_calculator(mean_control_pre = pre_ses_control, mean_control_post = follow_ses_control, mean_treatment_pre = pre_ses_treatment, mean_treatment_post = follow_ses_treatment, sd = ses_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = ses_follow_did, n_c = dorm_group+rotc_group, ctrl_sd = rma_sd, n_t = dorm_group+rotc_group)


## Macgowan -----------------------------------
macgowan <- did_calculator(mean_control_pre = 2.93, mean_control_post = 3.01, mean_treatment_pre = 3, mean_treatment_post = 3.09, sd = .33)
stand_result(eff_type = "d_i_d", raw_effect_size = macgowan, n_c = 199, n_t = 241, ctrl_sd = .33)

## macintyre -----------------------------------
### child sexual abuse


## McLeod -----------------------------------
treatment_pre_fem <- mean(c(2.49, 2.5))
treatment_pos_fem <- mean(c(2.1, 2.31))
treatment_pre_mis <- mean(c(2.52, 2.54))
treatment_pos_mis <- mean(c(2.33, 2.48))
cont_pre <- mean(c(2.29, 2.52))
cont_post <- mean(c(2.27, 2.38))
cont_sd <- weighted_sd(ns = c(36, 39), sds = c(.36, .3), means = c(2.52, 2.29))
fem_did <- did_calculator(mean_control_pre = cont_pre, mean_control_post = cont_post, sd = cont_sd, mean_treatment_pre = treatment_pre_fem, mean_treatment_post = treatment_pos_fem)
stand_result(eff_type = "d_i_d", raw_effect_size = fem_did, n_t = 37.5, n_c = 37.5, ctrl_sd = cont_sd)


mis_did <- did_calculator(mean_control_pre = cont_pre, mean_control_post = cont_post, sd = cont_sd, mean_treatment_pre = treatment_pre_mis, mean_treatment_post = treatment_pos_mis)
stand_result(eff_type = "d_i_d", raw_effect_size = mis_did, n_t = 37.5, n_c = 37.5, ctrl_sd = cont_sd)


## michener -----------------------------------
### not our outcomes

## Murphy -----------------------------------
### b/c there are 3 classes in each condition, and 3 conditions, i am just dividing genders n's by 3
pre_men <- 79/3
pre_women <- 156/3
post_men <- 73/3
post_women <- 140/3
follow_men <- 70/3
follow_women <- 129/3
rma_pre_control <- weighted_average(men_average = 5.789, n_men = pre_men, women_average = 6.169, n_women = pre_women)
rma_post_control <- weighted_average(men_average = 5.781, n_men = post_men, women_average = 6.336, n_women = post_women)
rma_follow_control <- weighted_average(men_average = 5.821, n_men = follow_men, women_average = 6.315, n_women = follow_women)
rma_pre_1 <- weighted_average(men_average = 5.879, n_men = pre_men, women_average = 6.141, n_women = pre_women)
rma_post_1 <- weighted_average(men_average = 5.917, n_men = post_men, women_average = 6.482, n_women = post_women)
rma_follow_1 <- weighted_average(men_average = 5.604, n_men = follow_men, women_average = 6.32, n_women = follow_women)
rma_pre_3 <- weighted_average(men_average = 5.729, n_men = pre_men, women_average = 6.374, n_women = pre_women)
rma_post_3 <- weighted_average(men_average = 6.073, n_men = post_men, women_average = 6.413, n_women = post_women)
rma_follow_3 <- weighted_average(men_average = 5.456, n_men = follow_men, women_average = 6.474, n_women = follow_women)

rma_control_sd <- weighted_sd(ns = c(pre_men, pre_women), sds = c(.228, .213), means = c(5.789, 6.169))

## lower better 
rma_did_1 <- did_calculator(mean_control_pre = rma_pre_control, mean_control_post = rma_post_control, mean_treatment_pre = rma_pre_1, mean_treatment_post = rma_post_1, sd = rma_control_sd)
rma_did_1_follow <- did_calculator(mean_control_pre = rma_pre_control, mean_control_post = rma_follow_control, mean_treatment_pre = rma_pre_1, mean_treatment_post = rma_follow_1, sd = rma_control_sd)
rma_did_3 <- did_calculator(mean_control_pre = rma_pre_control, mean_control_post = rma_post_control, mean_treatment_pre = rma_pre_3, mean_treatment_post = rma_post_3, sd = rma_control_sd)
rma_did_3_follow <- did_calculator(mean_control_pre = rma_pre_control, mean_control_post = rma_follow_control, mean_treatment_pre = rma_pre_3, mean_treatment_post = rma_follow_3, sd = rma_control_sd)

# 1 intervention 3 days
stand_result(eff_type = "d_i_d", raw_effect_size = rma_did_1, n_t = 3, n_c = 3, ctrl_sd = rma_control_sd)

# 1 intervention 4 weeks
stand_result(eff_type = "d_i_d", raw_effect_size = rma_did_1_follow, n_t = 3, n_c = 3, ctrl_sd = rma_control_sd)

# 3 intervention 3 days
stand_result(eff_type = "d_i_d", raw_effect_size = rma_did_3, n_t = 3, n_c = 3, ctrl_sd = rma_control_sd)

# 3 intervention 4 weeks
stand_result(eff_type = "d_i_d", raw_effect_size = rma_did_3_follow, n_t = 3, n_c = 3, ctrl_sd = rma_control_sd)


## Schewe
### coded already as Schewe 1996

## Taal
### sexual abuse study


## Tarrant -----------------------------------
## assuming group n
### lower is better
rmas_post_standard <- did_calculator(mean_control_pre = 2.33, mean_control_post = 2.17, mean_treatment_pre = 2.13, mean_treatment_post = 1.91, sd = 1.02)
stand_result(eff_type = "d_i_d", raw_effect_size = rmas_post_standard, n_c = 2, n_t = 4, ctrl_sd = 1.02)

rmas_follow_standard <- did_calculator(mean_control_pre = 2.33, mean_control_post = 2.15, mean_treatment_pre = 2.13, mean_treatment_post = 1.96, sd = 1.02)
stand_result(eff_type = "d_i_d", raw_effect_size = rmas_follow_standard, n_c = 2, n_t = 4, ctrl_sd = 1.02)

rmas_post_experimental <- did_calculator(mean_control_pre = 2.33, mean_control_post = 2.17, mean_treatment_pre = 2.07, mean_treatment_post = 2.06, sd = 1.02)
stand_result(eff_type = "d_i_d", raw_effect_size = rmas_post_experimental, n_c = 2, n_t = 4, ctrl_sd = 1.02)

rmas_follow_experimental <- did_calculator(mean_control_pre = 2.33, mean_control_post = 2.15, mean_treatment_pre = 2.07, mean_treatment_post = 2.1, sd = 1.02)
stand_result(eff_type = "d_i_d", raw_effect_size = rmas_follow_experimental, n_c = 2, n_t = 4, ctrl_sd = 1.02)

## York
### I don't think this is an intervention


# 1996 =====================
## Bonate -----------------------------------

video <- did_calculator(mean_control_pre = 165.6, mean_control_post = 164.7, mean_treatment_pre = 167.2, mean_treatment_post = 176.7)
stand_result(eff_type = "d_i_d", raw_effect_size = video, n_c = 30 , n_t = 33, ctrl_sd = 22.9)

literature <- did_calculator(mean_control_pre = 165.6, mean_control_post = 164.7, mean_treatment_pre = 157.3, mean_treatment_post = 177.6)
stand_result(eff_type = "d_i_d", raw_effect_size = literature, n_c = 30 , n_t = 33, ctrl_sd = 22.9)

## Earle -----------------------------------
stand_result(eff_type = "t_test", raw_effect_size = 2.99, n_t = 1, n_c = 1)
stand_result(eff_type = "t_test", raw_effect_size = .937, n_t = 1, n_c = 1)
stand_result(eff_type = "t_test", raw_effect_size = .683, n_t = 1, n_c = 1)


## Forst -----------------------------------
## NS
## didactic
stand_result(eff_type = "d", raw_effect_size = 0, n_c = 17, n_t = 21)

## theatre
stand_result(eff_type = "d", raw_effect_size = 0, n_c = 17, n_t = 16)

## Killian -----------------------------------
### no causal inference

## Schewe -----------------------------------
### Rape supportive cognitions - RMA

schewe_rsc_rma <- did_calculator(mean_treatment_pre = 104.18, mean_treatment_post = 110.46, mean_control_pre = 101.12, mean_control_post = 98.04, sd = 12.43)
stand_result(eff_type = "d_i_d", raw_effect_size = schewe_rsc_rma, n_t = 22, n_c = 26, ctrl_sd = 12.43)

### victim empathy/outcome expectancies - RMA
schewe_vee_rma <- did_calculator(mean_treatment_pre = 104.96, mean_treatment_post = 105.5, mean_control_pre = 101.12, mean_control_post = 98.04, sd = 12.43)
stand_result(eff_type = "d_i_d", raw_effect_size = schewe_vee_rma, n_t = 26, n_c = 26, ctrl_sd = 12.43)



# 1995 ====================
## Cohen -----------------------------------
### behavior
### higher better
empowerment <- did_calculator(mean_control_pre = 2.92, sd = .74, mean_control_post = 3.09, mean_treatment_post = 2.86, mean_treatment_pre = 3.12)
stand_result(eff_type = "d_i_d", ctrl_sd = .74, n_t = 47, n_c = 46, raw_effect_size = empowerment)

attitudinal <- did_calculator(mean_control_pre = 2.92, sd = .74, mean_control_post = 3.09, mean_treatment_post = 2.8, mean_treatment_pre = 2.96)
stand_result(eff_type = "d_i_d", ctrl_sd = .74, n_t = 48, n_c = 46, raw_effect_size = attitudinal)

## Heppner a -----------------------------------
happner_a_pre <- weighted_average(men_average = 42.53, women_average = 32.84, n_men = 105, n_women = 152)
happner_a_post <- weighted_average(men_average = 36.09, women_average = 27, n_men = 105, n_women = 152)
happner_a_2month <- weighted_average(men_average = 44.95, women_average = 30.19, n_men = 105, n_women = 152)
happner_a_pre_sd <- weighted_sd(sds = c(13.37, 10.09), ns = c(105, 152), means = c(42.53, 32.84))



happner_dim_post <- dim_calculator(mean_control = happner_a_pre, mean_treatment = happner_a_post)
stand_result(eff_type = "d_i_m", raw_effect_size = happner_dim_post, ctrl_sd = happner_a_pre_sd, n_t = 257, n_c = 257)

happner_dim_2month <- dim_calculator(mean_control = happner_a_pre, mean_treatment = happner_a_2month)
stand_result(eff_type = "d_i_m", raw_effect_size = happner_dim_2month, ctrl_sd = happner_a_pre_sd, n_t = 257, n_c = 257)

## Heppner b -----------------------------------
### control
heppner_b_control_pre <- weighted_average(n_men = 48, n_women = 45, men_average = 14.64, women_average = 10.38)
heppner_b_control_post <- weighted_average(n_men = 48, n_women = 45, men_average = 13.64, women_average = 9.24)
heppner_b_control_5month <- weighted_average(n_men = 26, n_women = 30, men_average = 14.48, women_average = 10)

happner_b_control_sd <- weighted_sd(means = c(14.64, 10.38), ns = c(48, 45), sds = c(10.04, 7.96))

### video
heppner_b_video_pre <- weighted_average(men_average = 12.09, n_men = 42, women_average = 9.27, n_women = 37)
heppner_b_video_post <- weighted_average(men_average = 8.12, n_men = 42, women_average = 6.73, n_women = 37)
heppner_b_video_5month <- weighted_average(men_average = 16.43, n_men = 15, women_average = 6.76, n_women = 21)

## lower better
heppner_b_did_video_post <-
  did_calculator(mean_control_pre = heppner_b_control_pre,
               mean_control_post = heppner_b_control_post,
               sd = happner_b_control_sd,
               mean_treatment_post = heppner_b_video_post,
               mean_treatment_pre = heppner_b_video_pre)

stand_result(eff_type = "d_i_d", raw_effect_size = heppner_b_did_video_post, ctrl_sd = happner_b_control_sd, n_t = 79, n_c = 93)

heppner_b_did_video_5month <-
did_calculator(mean_control_pre = heppner_b_control_pre,
               mean_control_post = heppner_b_control_5month,
               sd = happner_b_control_sd,
               mean_treatment_post = heppner_b_video_post,
               mean_treatment_pre = heppner_b_video_pre)

stand_result(eff_type = "d_i_d", raw_effect_size = heppner_b_did_video_5month, ctrl_sd = happner_b_control_sd, n_t = 36, n_c = 56)

### interactive drama
heppner_b_drama_pre <- weighted_average(men_average = 15.17, n_men = 36, women_average = 8.52, n_women = 45)
heppner_b_drama_post <- weighted_average(men_average = 11.32, n_men = 36, women_average = 7.68, n_women = 45)
heppner_b_drama_5month <- weighted_average(men_average = 13.93, n_men = 15, women_average = 9.93, n_women = 29)

heppner_b_did_drama_post <-
did_calculator(mean_control_pre = heppner_b_control_pre,
               mean_control_post = heppner_b_control_post,
               sd = happner_b_control_sd,
               mean_treatment_post = heppner_b_drama_post,
               mean_treatment_pre = heppner_b_drama_pre)

stand_result(eff_type = "d_i_d", raw_effect_size = heppner_b_did_drama_post, ctrl_sd = happner_b_control_sd, n_t = 81, n_c = 93)

heppner_b_did_drama_5month <-
did_calculator(mean_control_pre = heppner_b_control_pre,
               mean_control_post = heppner_b_control_post,
               sd = happner_b_control_sd,
               mean_treatment_post = heppner_b_drama_5month,
               mean_treatment_pre = heppner_b_drama_pre)

stand_result(eff_type = "d_i_d", raw_effect_size = heppner_b_did_drama_5month, ctrl_sd = happner_b_control_sd, n_t = 44, n_c = 56)

## Lanier -----------------------------------
### attitudes post
lanier_attitudes_post_did <- did_calculator(mean_treatment_pre = 4.1347, mean_treatment_post = 4.2348, mean_control_pre = 4.0086, mean_control_post = 4.0271, sd = .4175)
stand_result(eff_type = "d_i_d", raw_effect_size = lanier_attitudes_post_did, ctrl_sd = .4175, n_t = 188, n_c = 248)

### attitudes 2 month
lanier_2month_attitudes <- dim_calculator(mean_control = 4.1891, mean_treatment = 4.2563)
stand_result(eff_type = "d_i_m", raw_effect_size = lanier_2month_attitudes, ctrl_sd = .3843, n_t = 72, n_c = 72)

### behavior post
lanier_behavior_post_did <- did_calculator(mean_control_pre = 3.9926, mean_control_post = 4.0154, mean_treatment_pre = 3.9977, mean_treatment_post = 4.0103, sd = .4497)
stand_result(eff_type = "d_i_d", raw_effect_size = lanier_behavior_post_did, ctrl_sd = .4497, n_t = 188, n_c = 248)

### behaviors 2 month
lanier_behavior_2month <- dim_calculator(mean_control = 4.0368, mean_treatment = 4.2941)
stand_result(eff_type = "d_i_m", raw_effect_size = lanier_behavior_2month, ctrl_sd = .4497, n_t = 72, n_c = 72)

## Rosenthal -----------------------------------
### rape myth acceptance
rosenthal_rma <- dim_calculator(mean_control = 42.2, mean_treatment = 40.1)
stand_result(eff_type = "d_i_m", raw_effect_size = rosenthal_rma, ctrl_sd = 11.4, n_t = 126, n_c = 119)

### amount of time volunteered
rosenthal_time <- dim_calculator(mean_control = .7, mean_treatment = 1)
stand_result(eff_type = "d_i_m", raw_effect_size = rosenthal_time, ctrl_sd = 1.2, n_t = 126, n_c = 119)


# 1994 =========================
## Frazier -----------------------------------
### higher better 
frazier_post <- did_calculator(mean_treatment_pre = 1.23, mean_treatment_post = 1.2, mean_control_pre = 1.34, mean_control_post = 1.41, sd = .47)
stand_result(eff_type = "d_i_d", raw_effect_size = frazier_post, ctrl_sd = .47, n_t = 2, n_c = 2)

frazier_1month <- did_calculator(mean_treatment_pre = 1.23, mean_treatment_post = 1.29, mean_control_pre = 1.34, mean_control_post = 1.23, sd = .47)
stand_result(eff_type = "d_i_d", raw_effect_size = frazier_1month, n_t = 2, n_c = 2, ctrl_sd = .47)


## Lenihan -----------------------------------
lenihan_pre <- weighted.mean(x = c(20.28, 25.79), w = c(412, 224))
lenihan_post <- weighted.mean(x = c(20.02, 25.63), w = c(203, 192))
lenihan_dim <- dim_calculator(mean_control = lenihan_pre, mean_treatment = lenihan_post)
n_pre = sum(412, 224)
n_post = sum(203, 192)
lenihan_sd <- weighted_sd(ns = c(412, 224), sds = c(4.9, 6.35), means = c(20.28, 25.79))
stand_result(eff_type = "d_i_m", n_c = n_pre, n_t = n_post, raw_effect_size = lenihan_dim, ctrl_sd = lenihan_sd)

# 1993 ======================
## Dallager -----------------------------------
stand_result(eff_type = "f_test", raw_effect_size = 7.17, n_t = 97, n_c = 48)

## Forst -----------------------------------
## high is bad
## didactic rma post
forst_didactic_rma_post <- dim_calculator(mean_control = 31.812, mean_treatment = 28.562)
stand_result(eff_type = "d_i_m", raw_effect_size = forst_didactic_rma_post, n_c = 16, n_t = 16, ctrl_sd = 7.12)

### didactic rma follow-up
forst_didactic_rma_follow <- did_calculator(mean_control_pre = 36.73, mean_control_post = 36.95, mean_treatment_pre = 31.812, mean_treatment_post = 27.69, sd = 7.12)
stand_result(eff_type = "d_i_d", raw_effect_size = forst_didactic_rma_follow, n_c = 16, n_t = 19, ctrl_sd = 11.05)

###  theatre rma post
forst_theatre_rma_post <- dim_calculator(mean_control = 36.294, mean_treatment = 33.471)
stand_result(eff_type = "d_i_m", raw_effect_size = forst_theatre_rma_post, ctrl_sd = 13.76, n_c = 17, n_t = 17)

### theatre rma follow-up
forst_theatre_rma_follow <- did_calculator(mean_control_pre = 36.73, mean_control_post = 36.95, mean_treatment_pre = 36.294, mean_treatment_post = 34, sd = 13.76)
stand_result(eff_type = "d_i_d", raw_effect_size = forst_theatre_rma_follow, n_c = 19, n_t = 17, ctrl_sd = 11.05)

## Hanson -----------------------------------
library(tidyverse)
hanson_ses <-
  tibble(treatment = c(rep(0, 73+53+24), rep(1, 5+4+6), rep(2, 0+2+13)),
         control = c(rep(0, 60+37+29), rep(1, 4+7+10), rep(2, 6+2+9), rep(NA_real_, 180-164))) %>%
  gather(key = "condition", value = "SES") %>%
  mutate(SES = factor(SES, ordered = TRUE))

hanson_ses_stats <-
  hanson_ses %>%
  group_by(condition) %>%
  mutate(SES = as.integer(SES) - 1) %>%
  summarise(mean = mean(SES, na.rm = TRUE),
            sd = sd(SES, na.rm = TRUE))

hanson_n <-
  hanson_ses %>%
  filter(!is.na(SES)) %>%
  count(condition) %>%
  spread(condition, n)



### ses
MASS::polr(SES ~ condition, data = hanson_ses)
# or easier
hansen_dim <- dim_calculator(mean_control = as.numeric(hanson_ses_stats[1,2]), mean_treatment = as.numeric(hanson_ses_stats[2,2]))
stand_result(eff_type = "d_i_m",
             raw_effect_size = hansen_dim,
             ctrl_sd = as.numeric(hanson_ses_stats[1,3]),
             n_c = as.integer(hanson_n$control),
             n_t = as.integer(hanson_n$treatment))


### sexual assault awareness survey
stand_result(eff_type = "f_test", raw_effect_size = 5.38, n_c = hanson_n$control, n_t = hanson_n$treatment)

## Holcomb -----------------------------------
stand_result(eff_type = "f_test", raw_effect_size = 156.251, n_c = 163, n_t = 163)

## Jensen -----------------------------------
### doesn't have statistics

## Jodine -----------------------------------
### control
jodine_control <- weighted_average(men_average = 44.27, women_average = 33.21, n_men = 22, n_women = 15)
jodine_control_post1 <- weighted_average(men_average = 44.78, women_average = 33.93, n_men = 22, n_women = 15)
jodine_control_post2 <- weighted_average(men_average = 42, women_average = 33.44, n_men = 22, n_women = 15)

#jodine_control_sd_pre <- weighted_sd(ns = c(22, 15), sds = c(7.28, 7.32), means = c(44.27, 33.21))

### video
jodine_videotape_pre <- weighted_average(men_average = 44.09, women_average = 34.72, n_men = 11, n_women = 25)
jodine_videotape_post1 <- weighted_average(men_average = 46.75, women_average = 33.54, n_men = 11, n_women = 25)
jodine_videotape_post2 <- weighted_average(men_average = 45.33, women_average = 32.37, n_men = 11, n_women = 25)

### lower better 
videotape_post1_did <- did_calculator(mean_treatment_post = jodine_videotape_post1, mean_treatment_pre = jodine_videotape_pre,
                                    mean_control_post = jodine_control_post1, mean_control_pre = jodine_control, sd = jodine_control_sd_pre)
stand_result(eff_type = "d_i_d", raw_effect_size = videotape_post1_did, ctrl_sd = jodine_control_sd_pre, n_t = 36, n_c = 37)

videotape_post2_did <- did_calculator(mean_treatment_post = jodine_videotape_post2, mean_treatment_pre = jodine_videotape_pre,
                                    mean_control_post = jodine_control_post2, mean_control_pre = jodine_control, sd = jodine_control_sd_pre)
stand_result(eff_type = "d_i_d", raw_effect_size = videotape_post2_did, ctrl_sd = jodine_control_sd_pre, n_t = 36, n_c = 37)


### role play
jodine_roleplay_pre <- weighted_average(men_average = 41.08, women_average = 37.18, n_men = 14, n_women = 18)
jodine_roleplay_post1 <- weighted_average(men_average = 38.17, women_average = 35.94, n_men = 14, n_women = 18)
jodine_roleplay_post2 <- weighted_average(men_average = 42, women_average = 36.54, n_men = 14, n_women = 18)

roleplay_post1_did <- did_calculator(mean_treatment_post = jodine_roleplay_post1, mean_treatment_pre = jodine_roleplay_pre,
                                    mean_control_post = jodine_control_post1, mean_control_pre = jodine_control, sd = jodine_control_sd_pre)

stand_result(eff_type = "d_i_d", raw_effect_size = roleplay_post1_did, ctrl_sd = jodine_control_sd_pre, n_t = 32, n_c = 37)
roleplay_post2_did <- did_calculator(mean_treatment_post = jodine_roleplay_post2, mean_treatment_pre = jodine_roleplay_pre,
                                    mean_control_post = jodine_control_post2, mean_control_pre = jodine_control, sd = jodine_control_sd_pre)

stand_result(eff_type = "d_i_d", raw_effect_size = roleplay_post2_did, ctrl_sd = jodine_control_sd_pre, n_t = 32, n_c = 37)



### lecture
jodine_lecture_pre <- weighted_average(men_average = 40.62, women_average = 37, n_men = 13, n_women = 14)
jodine_lecture_post1 <- weighted_average(men_average = 38.23, women_average = 36.71, n_men = 13, n_women = 14)
jodine_lecture_post2 <- weighted_average(men_average = 38.5, women_average = 34.92, n_men = 13, n_women = 14)


lecture_post1_did <- did_calculator(mean_treatment_post = jodine_lecture_post1,
                                    mean_treatment_pre = jodine_lecture_pre,
                                    mean_control_post = jodine_control_post1,
                                    mean_control_pre = jodine_control,
                                    sd = jodine_control_sd_pre)
stand_result(eff_type = "d_i_d", raw_effect_size = lecture_post1_did, ctrl_sd = jodine_control_sd_pre, n_t = 27, n_c = 37)

lecture_post2_did <- did_calculator(mean_treatment_post = jodine_lecture_post2,
                                    mean_treatment_pre = jodine_lecture_pre,
                                    mean_control_post = jodine_control_post2,
                                    mean_control_pre = jodine_control,
                                    sd = jodine_control_sd_pre)
stand_result(eff_type = "d_i_d", raw_effect_size = lecture_post2_did, ctrl_sd = jodine_control_sd_pre, n_t = 27, n_c = 37)

## Kline -----------------------------------
kline_pre <- weighted.mean(x = c(21.29, 19.79), w = c(38, 47))
kline_post <- weighted.mean(x = c(20.13, 16.73), w = c(38, 48))

kline_did <- did_calculator(mean_treatment_post = kline_post, mean_treatment_pre = kline_pre, mean_control_pre = 22.21, mean_control_post = 22.32)
stand_result(eff_type = "d_i_d", raw_effect_size = kline_did, n_t = 86, n_c = 47, ctrl_sd = 11.11)


## Nagler -----------------------------------
### rma
stand_result(eff_type = "f_test", raw_effect_size = .44, n_t = 64, n_c = 62)

### ses
nagler_male <- chisq_2_d(chisq = 3.2, df = 4, n = 75) # male
stand_result(eff_type = "d", n_t = 41, n_c = 34, raw_effect_size = nagler_male)

nagler_female <- chisq_2_d(chisq = 2.46, df = 4, n = 51)
stand_result(eff_type = "d", n_t = 23, n_c = 28, raw_effect_size = nagler_female)

## Schewe -----------------------------------
### directed at pedophiles

## Schwartz -----------------------------------
schwartz <- did_calculator(mean_control_pre = 37.84, mean_control_post = 38.48,mean_treatment_post = 40.03, mean_treatment_pre = 37.84)
stand_result(eff_type = "d_i_d", raw_effect_size = schwartz, n_t = 10.5, n_c = 10.5, ctrl_sd = 5.24)

## Wolford -----------------------------------
lecture_pre <- weighted.mean(x = c(40.62, 37), w = c(13, 14))
lecture_1 <- weighted.mean(x = c(38.23, 36.71), w = c(13, 14))
lecture_2 <- weighted.mean(x = c(38.5, 34.92), w = c(13, 14))

video_pre <- weighted.mean(x = c(44.09, 34.72), w = c(11, 25))
video_1 <- weighted.mean(x = c(46.75, 33.54), w = c(11, 25))
video_2 <- weighted.mean(x = c(45.33, 32.37), w = c(11, 25))

role_play_pre <- weighted.mean(x = c(41.08, 37.18), w = c(14, 18))
role_play_1 <- weighted.mean(x = c(38.17, 35.94), w = c(14, 18))
role_play_2 <- weighted.mean(x = c(42, 36.54), w = c(14, 18))

control_pre <- weighted.mean(x = c(44.27, 33.21), w = c(22, 15))
control_1 <- weighted.mean(x = c(44.78, 33.93), w = c(22, 15))
control_2 <- weighted.mean(x = c(42.0, 33.44), w = c(22, 15))
control_sd <- weighted_sd(ns = c(22, 15), sds = c(7.28, 7.32), means = c(44.27, 33.21))


lecture_1_did <- did_calculator(mean_control_pre = control_pre, mean_control_post = control_1, mean_treatment_pre = lecture_pre, mean_treatment_post = lecture_1)
stand_result(eff_type = "d_i_d", ctrl_sd = control_sd, n_c = 37, raw_effect_size = lecture_1_did, n_t = 27)

lecture_2_did <- did_calculator(mean_control_pre = control_pre, mean_control_post = control_2, mean_treatment_pre = lecture_pre, mean_treatment_post = lecture_2)
stand_result(eff_type = "d_i_d", ctrl_sd = control_sd, n_c = 37, raw_effect_size = lecture_2_did, n_t = 27)

video_1_did <- did_calculator(mean_control_pre = control_pre, mean_control_post = control_1, mean_treatment_pre = video_pre, mean_treatment_post = video_1)
stand_result(eff_type = "d_i_d", ctrl_sd = control_sd, n_c = 37, raw_effect_size = video_1_did, n_t = 36)

video_2_did <- did_calculator(mean_control_pre = control_pre, mean_control_post = control_2, mean_treatment_pre = video_pre, mean_treatment_post = video_2)
stand_result(eff_type = "d_i_d", ctrl_sd = control_sd, n_c = 37, raw_effect_size = video_2_did, n_t = 36)

role_play_1_did <- did_calculator(mean_control_pre = control_pre, mean_control_post = control_1, mean_treatment_pre = role_play_pre, mean_treatment_post = role_play_1)
stand_result(eff_type = "d_i_d", ctrl_sd = control_sd, n_c = 37, raw_effect_size = role_play_1_did, n_t = 32)

role_play_2_did <- did_calculator(mean_control_pre = control_pre, mean_control_post = control_2, mean_treatment_pre = role_play_pre, mean_treatment_post = role_play_2)
stand_result(eff_type = "d_i_d", ctrl_sd = control_sd, n_c = 37, raw_effect_size = role_play_2_did, n_t = 32)




# 1992 ======================

## Abrams -----------------------------------
# null results
stand_result(eff_type = "d", raw_effect_size = 0, n_t = 66, n_c = 61)
stand_result(eff_type = "d", raw_effect_size = 0, n_t = 62, n_c = 61)

## Fonow -----------------------------------
### low is good
### workshop
fonow_workshop <- dim_calculator(mean_treatment = 2.3, mean_control = 2.5)
stand_result(eff_type = "d_i_m", raw_effect_size = fonow_workshop, no_sd_given = TRUE, n_c = 14/3, n_t = 14/3)
###
fonow_video <- dim_calculator(mean_treatment = 2.3, mean_control = 2.5)
stand_result(eff_type = "d_i_m", raw_effect_size = fonow_video, no_sd_given =  = TRUE, n_c = 14/3, n_t = 14/3)

## Hoehn -----------------------------------
hoehn_trad <- dim_calculator(mean_control = 71.63, mean_treatment = 76)
stand_result(eff_type = "d_i_m", raw_effect_size = hoehn_trad, n_t = 32, n_c = 32, ctrl_sd = 8.14)

hoehn_fem <- dim_calculator(mean_control = 71.63, mean_treatment = 72.48)
stand_result(eff_type = "d_i_m", raw_effect_size = hoehn_fem, n_t = 31, n_c = 32, ctrl_sd = 8.14)

## Lenihan -----------------------------------
stand_result(eff_type = "f_test", n_t = 410.5, n_c = 410.5, raw_effect_size = 116.87)

# 1991 =======================
## Feltey -----------------------------------
blame <- dim_calculator(mean_control = .54, mean_treatment = .21)
stand_result(eff_type = "d_i_m", raw_effect_size = blame, ctrl_sd = 1.03, n_c = 378, n_t = 118)

## Gibson -----------------------------------
## RMA
rma_control <- weighted_average(men_average = 26.17, women_average = 20.3, n_men = 59, n_women = 100)
rma_treatement <- weighted_average(n_men = 21, n_women = 40, men_average = 25.19, women_average = 19.4)
control_sd <- weighted_sd(ns = c(59, 100), sds = c(7.14, 5.36), means = c(26.17, 20.3))

rma_dim <- dim_calculator(mean_control = rma_control, mean_treatment = rma_treatement)
stand_result(eff_type = "d_i_m", raw_effect_size = rma_dim, ctrl_sd = control_sd, n_t = 21+40, n_c = 100+59)
# log_odds_ratio(n_treatment = 21, n_control = 59, percent_control = .08, percent_treatment = .11) %>% round(., 2)
### behavior pg 32
# good
men_tre_vict <- mean(c(10, 10, 5, 10))/100
men_con_vict <- mean(c(27, 14, 2, 2))/100
men_vict_odds <- log_odds_ratio(n_treatment = 21, n_control = 59, percent_treatment = men_tre_vict, percent_control = men_con_vict)
stand_result(eff_type = "log_odds_ratio", n_t = 21, n_c = 59, raw_effect_size = men_vict_odds)

# good
women_tre_vict <- mean(c(38, 18, 5, 0))/100
women_con_vict <- mean(c(30, 27, 6, 5))/100
women_vict_odds <- log_odds_ratio(n_treatment = 40, n_control = 100, percent_treatment = women_tre_vict, percent_control = women_con_vict)
stand_result(eff_type = "log_odds_ratio", n_t = 40, n_c = 100, raw_effect_size = women_vict_odds)


### vict together
vict_tre <- weighted_average(men_average = men_tre_vict, women_average = women_tre_vict, n_men = 21, n_women = 40)
vict_con <- weighted_average(men_average = men_con_vict, women_average = women_con_vict, n_men = 59, n_women = 100)
vict_odds <- log_odds_ratio(percent_control = vict_con, percent_treatment = vict_tre, n_control = 100+59, n_treatment = 21+40)
stand_result(eff_type = "log_odds_ratio", raw_effect_size = vict_odds, n_t = 21+40, n_c = 100+59)

### perp
# bad
men_tre_perp <- mean(c(14, 24, 10, 10))/100
men_con_perp <- mean(c(20, 19, 5, 8))/100
men_perp_odds <- log_odds_ratio(n_treatment = 21, n_control = 59, percent_treatment = men_tre_perp, percent_control = men_con_perp)
stand_result(eff_type = "log_odds_ratio", n_t = 21, n_c = 59, raw_effect_size = men_perp_odds)

# bad
women_tre_perp <- mean(c(20, 8, 0, 0))/100
women_con_perp <- mean(c(3, 2, 0, 1))/100
women_perp_odds <- log_odds_ratio(n_treatment = 40, n_control = 100, percent_treatment = women_tre_perp, percent_control = women_con_perp)
stand_result(eff_type = "log_odds_ratio", n_t = 40, n_c = 100, raw_effect_size = women_perp_odds)

### perp together
perp_tre <- weighted_average(men_average = men_tre_perp, women_average = women_tre_perp, n_men = 21, n_women = 40)
perp_con <- weighted_average(men_average = men_con_perp, women_average = women_con_perp, n_men = 59, n_women = 100)
perp_odds <- log_odds_ratio(n_control = 59+100, n_treatment = 21+40, percent_control = perp_con, percent_treatment = perp_tre)
stand_result(eff_type = "log_odds_ratio", raw_effect_size = perp_odds, n_t = 21+40, n_c = 100+59)

## Gilbert -----------------------------------
volunteer_time <- dim_calculator(mean_control = .09, mean_treatment = .16)
stand_result(eff_type = "d_i_m", raw_effect_size = volunteer_time, ctrl_sd = .42, n_t = 30, n_c = 23)

stand_result("f_test", raw_effect_size = 5.58, ctrl_sd = 9.66, n_t = 30, n_c = 31)


## Harrison -----------------------------------
video <- weighted.mean(x = c(32, 22.3, 30.5, 28.7), w = c(3, 8, 11, 6))
video_discussion <- weighted.mean(x = c(26.9, 26.7, 31.9, 30), w = c(10, 11, 8, 9))
control <- weighted_average(men_average = 22.7, n_men = 7, women_average = 29.6, n_women = 12)
harrison_sd <- weighted_sd(means = c(22.7, 29.6), sds = c(4.1, 2.7), ns = c(7, 12))

video_n = 3 + 8 + 11 + 7
video_dis_n = 10 + 11 + 8 + 9
control_n = 7 + 12

video_dim <- dim_calculator(mean_control = control, mean_treatment = video)
stand_result(eff_type = "d_i_m", ctrl_sd = harrison_sd, n_c = control_n, raw_effect_size = video_dim, n_t = video_n)

video_dis_dim <- dim_calculator(mean_control = control, mean_treatment = video_discussion)
stand_result(eff_type = "d_i_m", ctrl_sd = harrison_sd, n_c = control_n, raw_effect_size = video_dis_dim, n_t = video_dis_n)

## Nichols -----------------------------------
### high is bad
### rma
didactic_post <- did_calculator(mean_control_pre = 35.22, mean_control_post = 35.24, mean_treatment_post = 29.94, mean_treatment_pre = 32.02)
stand_result(eff_type = "d_i_d", ctrl_sd = 13.59, n_c = 50, n_t = 39, raw_effect_size = didactic_post)

experiental_post <- did_calculator(mean_control_pre = 35.22, mean_control_post = 35.24, mean_treatment_pre = 32.17, mean_treatment_post = 29.37)
stand_result(eff_type = "d_i_d", ctrl_sd = 13.59, n_c = 50, n_t = 30, raw_effect_size = experiental_post)

didactic_follow <- did_calculator(mean_control_pre = 35.22, mean_control_post = 35.56, mean_treatment_pre = 32.02, mean_treatment_post = 29.25)
stand_result(eff_type = "d_i_d", ctrl_sd = 13.59, n_c = 50, n_t = 39, raw_effect_size = didactic_follow)

experiental_follow <- did_calculator(mean_control_pre = 35.22, mean_control_post = 35.56, mean_treatment_pre = 32.17, mean_treatment_post = 29.63)
stand_result(eff_type = "d_i_d", ctrl_sd = 13.59, n_c = 50, n_t = 30, raw_effect_size = experiental_follow)

## Ostrowski -----------------------------------
#### low is good 
### combined ############
# m, f, m&f
emp_pre <- weighted.mean(x = c(3.21, 2.46, 2.87), w = c(26, 19, 59))
ed_pre <- weighted.mean(x = c(3.57, 2.38, 2.92), w = c(21, 38, 37))
both_pre <- weighted.mean(x = c(3.7, 2.22, 2.38), w = c(28, 45, 43))
cont_pre <- weighted.mean(x = c(2.91, 2.44, 2.45), w = c(31, 11, 25))
cont_sd <- weighted_sd(means = c(2.91, 2.44, 2.45), sds = c(.935, .728, .818), ns = c(31, 11, 25))

emp_post <- weighted.mean(x = c(3.42, 2.82, 3.16), w = c(26, 19, 59))
ed_post <- weighted.mean(x = c(3.21, 3.21, 3.22), w = c(21, 38, 37))
both_post <- weighted.mean(x = c(3.36, 2.84, 2.86), w = c(28, 45, 43))
cont_post <- weighted.mean(x = c(3.17, 2.8, 3.21), w = c(31, 11, 25))



emp_did <- did_calculator(mean_control_pre = cont_pre, 
               mean_control_post = cont_post, 
               mean_treatment_pre = emp_pre,
               mean_treatment_post = emp_post, 
               sd = cont_sd)

stand_result(eff_type = "d_i_d", ctrl_sd = cont_sd, n_c = sum(c(31, 11, 25)), n_t = sum(c(26, 19, 59)), raw_effect_size = emp_did)

ed_did <- did_calculator(mean_control_pre = cont_pre, 
               mean_control_post = cont_post, 
               mean_treatment_pre = ed_pre,
               mean_treatment_post = ed_post, 
               sd = cont_sd)

stand_result(eff_type = "d_i_d", ctrl_sd = cont_sd, n_c = sum(c(31, 11, 25)), n_t = sum(c(21, 38, 37)), raw_effect_size = ed_did)

both_did <- did_calculator(mean_control_pre = cont_pre, 
               mean_control_post = cont_post, 
               mean_treatment_pre = both_pre,
               mean_treatment_post = emp_post, 
               sd = cont_sd)
                           
stand_result(eff_type = "d_i_d", ctrl_sd = cont_sd, n_c = sum(c(31, 11, 25)), n_t = sum(c(28, 45, 43)), raw_effect_size = both_did)                          



# ### empathy men
# men_sd <- 0.935
# ostrowski_empathy_men <-
#   did_calculator(mean_control_pre = 2.91, mean_control_post = 3.17, mean_treatment_pre = 3.21, mean_treatment_post = 3.42, sd = men_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = ostrowski_empathy_men, ctrl_sd = men_sd, n_c = 2, n_t = 1)
# 
# ### education men
# ostrowski_education_men <-
# did_calculator(mean_control_pre = 2.91, mean_control_post = 3.17, mean_treatment_pre = 3.57, mean_treatment_post = 3.21, sd = men_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = ostrowski_education_men, ctrl_sd = men_sd, n_c = 2, n_t = 1)
# 
# ### empathy & education men
# ostrowski_eduemp_men <-
# did_calculator(mean_control_pre = 2.91, mean_control_post = 3.17, mean_treatment_pre = 3.7, mean_treatment_post = 3.36, sd = men_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = ostrowski_eduemp_men, ctrl_sd = men_sd, n_c = 2, n_t = 1)
# 
# ### empathy women ###########
# women_sd <- 0.728
# ostrowski_empathy_women <-
# did_calculator(mean_control_pre = 2.44, mean_control_post = 2.8, mean_treatment_pre = 2.46, mean_treatment_post = 2.82, sd = women_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = ostrowski_empathy_women, ctrl_sd = women_sd, n_c = 1, n_t = 2)
# 
# ### education women
# ostrowski_education_women <-
# did_calculator(mean_control_pre = 2.44, mean_control_post = 2.8,  mean_treatment_pre = 2.38, mean_treatment_post = 3.21,sd = women_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = ostrowski_education_women, ctrl_sd = women_sd, n_c = 1, n_t = 2)
# 
# ### empathy & education women
# ostrowski_eduemp_women <-
# did_calculator(mean_control_pre = 2.44, mean_control_post = 2.8,  mean_treatment_pre = 2.22, mean_treatment_post = 2.84, sd = women_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = ostrowski_eduemp_women, ctrl_sd = women_sd, n_c = 1, n_t = 2)
# 
# ### empathy both ##########
# both_sd <- 0.818
# ostrowski_empathy_both <-
#   did_calculator(mean_control_pre = 2.45, mean_control_post = 3.21, mean_treatment_pre = 2.87, mean_treatment_post = 3.16, sd = both_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = ostrowski_empathy_both, ctrl_sd = both_sd, n_c = 5, n_t = 2)
# 
# ### education both
# ostrowski_education_both <-
#   did_calculator(mean_control_pre = 2.45, mean_control_post = 3.21, mean_treatment_pre = 2.92, mean_treatment_post = 3.22, sd = both_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = ostrowski_education_both, ctrl_sd = both_sd, n_c = 2, n_t = 2)
# 
# ### empathy & education both
# ostrowski_eduemp_both <-
#   did_calculator(mean_control_pre = 2.45, mean_control_post = 3.21, mean_treatment_pre = 2.38, mean_treatment_post = 2.86, sd = both_sd)
# stand_result(eff_type = "d_i_d", raw_effect_size = ostrowski_eduemp_both, ctrl_sd = both_sd, n_c = 1, n_t = 2)


# 1990 =========================
## Baylis -----------------------------------
### i don't think there is enough info to code


## Gray -----------------------------------
### not our outcomes

## kleinke -----------------------------------
### not prevention program

## Matrin -----------------------------------
### not our outcomes

## Nelson -----------------------------------
video_pre <- weighted.mean(x = c(29.33, 20.92), w = c(9,24))
brochure_pre <- weighted.mean(x = c(25.29, 19.46), w = c(7, 24))
control_pre <- weighted.mean(x = c(25.4, 25.36), w = c(9, 16))

video_post <- weighted.mean(x = c(24.67, 18.08),  c(9,24))
brochure_post <- weighted.mean(x = c(24.86, 16.08),  c(7, 24))
control_post <- weighted.mean(x = c(23.9, 21.14), c(9, 16))

### low is good
brochure_did <- did_calculator(mean_control_pre = control_pre, mean_control_post = control_post, mean_treatment_pre = brochure_pre, mean_treatment_post = brochure_post)
stand_result(eff_type = "d_i_d", n_c = 25, no_sd_given = T, n_t = 33, raw_effect_size = brochure_did)


video_did <- did_calculator(mean_control_pre = control_pre, mean_control_post = control_post, mean_treatment_pre = video_pre, mean_treatment_post = video_post)
stand_result(eff_type = "d_i_d", n_c = 25, no_sd_given = T, n_t = 31, raw_effect_size = video_did)


## Pohl -----------------------------------
### rma, low is good
stand_result(eff_type = "f_test", raw_effect_size = 8.61, n_t = 3, n_c = 5)


# 1989 =======================
## Crowley -----------------------------------
### this is a paper about sexual abuse

## Intons-Peterson -----------------------------------
### rape education
intons_rapeed <- dim_calculator(mean_treatment = 6.51, mean_control = 6.07)# low is bad
stand_result(eff_type = "d_i_m", raw_effect_size = intons_rapeed, n_c = 30, n_t = 30, no.sd.given = TRUE)
### sex education
intons_sexed <- dim_calculator(mean_treatment = 6.49, mean_control = 6.07)
stand_result(eff_type = "d_i_m", raw_effect_size = intons_sexed, n_c = 30, n_t = 30, no.sd.given = TRUE)

## Johnson -----------------------------------
stand_result(eff_type = "f_test", raw_effect_size = 4.6, n_t = 74, n_c = 74)

# 1988 ========================
## Borden -----------------------------------
### higher is better
borden <- did_calculator(mean_treatment_pre = 109.4, mean_treatment_post = 109.18, mean_control_pre = 110.2, mean_control_post = 112.02, sd = 10.72)
stand_result(eff_type = "d_i_d", raw_effect_size = borden, n_t = 50, n_c = 50, ctrl_sd = 10.72)

## Hand -----------------------------------
### not a primary prevention program

## Jones -----------------------------------
stand_result(eff_type = "t_test", raw_effect_size = -7.61,n_t = (7), n_c = (3))


## Tice -----------------------------------
### this is a paper about sexual abuse


# 1987 =========================
## Lee -----------------------------------
stand_result(eff_type = "t_test", n_t = 12, n_c = 12, raw_effect_size = 5.15)

# 1986 =========================
## Fischer -----------------------------------
treat_pre <- weighted.mean(x = c(1.7, 1.8, 1.6), w = c(73, 72, 46))
treat_post <- weighted.mean(x = c(1.2, 1.2, 1.2), w = c(73, 72, 46))
fischer_did <- did_calculator(mean_treatment_pre = treat_pre, mean_treatment_post = treat_post, mean_control_pre = 1.5, mean_control_post = 1.4, sd = .8)

stand_result(eff_type = "d_i_d", ctrl_sd = .8, raw_effect_size = fischer_did, n_t = 3, n_c = 1)

