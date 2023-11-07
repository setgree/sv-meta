
# load data
dat <- readRDS(file = './data/sa_meta_data_for_analysis.rds')

## add unique-study_id
dat <- dat %>% group_by(unique_paper_id, intervention_name) %>% mutate(unique_study_id = cur_group_id())
# based this on https://stackoverflow.com/questions/62562499/obtain-a-unique-id-by-group-in-mutate-pipeline
# hope it's right

dat_att <- dat %>% filter(scale_type == 'attitudes')
dat_behav <- dat %>% filter(scale_type == 'behavior')

# same for RCTs
rct_dat <- dat %>% filter(study_design == 'rct')
rct_dat_att <- rct_dat %>% filter(scale_type == 'attitudes')
rct_dat_behav <- rct_dat %>% filter(scale_type == 'behavior')

## first, simple test: does outcome type predict D?
summary(lm(formula = d ~ as.numeric(scale_type),  data = dat))
# yes. second test: does outcome type predict d when it's just RCTs?

summary(lm(formula =  d ~ as.numeric(scale_type),  data = rct_dat))
# filter to RCTs and have to have both 

# meta-analyze with moderating variable for scale type
rma(yi = d, vi = var_d, mods = scale_type, data = dat)
# just RCTS?
rma(yi = d, vi = var_d ,mods = scale_type, data = rct_dat)

# now just the behavioural or attitudinal data?
rma(yi = d, vi = var_d, data = rct_dat_att)
rma(yi = d, vi = var_d , data = rct_dat_behav)
# that's our first major result right there. effect size drops from .28 to 0.1

# might change if and when we control for unique_study_id
# TO DO: add unique study ID (maybe JH can help with that?)

## ok I am trying: only including studies that have both attitudes and behaviors
## gonna substitute out unique_paper_id for unique_study_id at some point

dat <- dat %>% select(unique_paper_id, scale_type, everything())
has_both <- dat %>% 
  group_by(unique_study_id) %>%  
  filter(all(c('attitudes', 'behavior') %in% scale_type))

# now, controlling for unique_paper_id, do attitudes predict behavior?
summary(lm(formula = d ~ as.numeric(scale_type) + unique_paper_id, data = has_both))
# that's not quite right. i should talk this over with JH or someone ...lmer?
summary(lmer(formula = d ~ scale_type + (1 | unique_study_id), data = has_both))
