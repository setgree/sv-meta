---
title: "1-download-and-clean-data.Rmd"
author: "Seth Green and John-Henry Pezzuto"
date: "`r format(Sys.time(), '%d %B, %Y')`"
output: html_document
editor_options: 
  chunk_output_type: console
---

This script was our main 'pre-analysis script' to get things from our "raw data", which was a messy google sheet, into a workable dataset. We're including the dataset in its 'finalized' form but not the raw data, which has some team internal comments, but we're including this script as an `.md` for completeness.

### setup

```{r setup}
rm(list = ls())
library(dplyr, warn.conflicts = FALSE)
library(googledrive)
library(readr)
library(stringr)
library(tidyr)
options(scipen = 99)
```

### Download most up-to-date dataset

```{r download_data, eval=T}
#' download sheet from google -----------------------------------
#' You, reader, won't have access to this, so don't run this chunk

drive_auth(email = T)
drive_download("Primary Prevention Meta 2020",
               path = "../data/sa_meta_data_raw",
               overwrite = T,
               type = 'csv') # dl to csv gets just first sheet
```

## read data and do initial cleaning

```{r clean_data}
raw_dat <- read.csv('../data/sa_meta_data_raw.csv', 
                    na.strings = c("NA")) |> 
  as_tibble(); 
problems(raw_dat) # none as of March 2022

#' drop 'eliminate' studies & create unique paper ID
raw_dat <- raw_dat |>
  fill(paper_title) |>
    replace_na(list(eliminate = 0)) |> 
  filter(eliminate == 0) |>
  group_by(paper_title) |>
  mutate(unique_paper_id = cur_group_id()) |> # create unique paper id
  select(-c(coder, page_number, comments, # drop team-internal stuff
            d, var_d, se_d, checked, alex.comments, checked, 
            partial_analysis,
            lead.author.department.training,
            authors.department.education.in.case.belongs.to.center,
            checker_comment, is_red, eliminate,
            )) |>
  group_by(unique_paper_id, intervention_name) |> 
  mutate(unique_study_id = cur_group_id()) |> ### create unique study id
  ungroup()
```

# prepare Cohen's D calcs

```{r standardizing_inputs}
#' making sure that inputs are all what the functions expect: 
#' eff_type, cluster_type, and checking for NAs

#' fix eff_type
unique(raw_dat$eff_type)
raw_dat$eff_type <- str_replace_all(raw_dat$eff_type, 
                                     c("d.i.d" = "d_i_d", 
                                       "f.test" = "f_test", 
                                       "d.i.m" = "d_i_m", 
                                       "difference_in_proportion" = "d_i_p", 
                                       "reg.coef" = "reg_coef", 
                                       "t.test" = "t_test", 
                                       "beta" = "reg_coef", 
                                       "log.odds.ratio" = "log_odds_ratio", 
                                       "odds.ratio" = "odds_ratio", 
                                       "NA" = NA_character_, 
                                       "-" = NA_character_, 
                                       "did" = "d_i_d", 
                                       "dim" = "d_i_m", 
                                       "^$|^ $" = NA_character_, # matches for empty string or space
                                       "d.i.p" = "d_i_p", 
                                       "d.i.p." = "d_i_p"))

unique(raw_dat$eff_type)

#' fix cluster_type data
raw_dat$cluster_type <- str_replace_all(raw_dat$cluster_type, 
                                        c("n_groups" = "n groups", 
                                          "-" = NA, 
                                          "^$|^ $" = NA))

#' change the cluster randomized var to be factors with an NA rather than a -
raw_dat$cluster_type <- gsub(pattern = '-', replacement = NA, x = raw_dat$cluster_type)

#' none missingcheck for any missing; March 2022
table(raw_dat$eff_type, useNA = 'ifany') 
```

### ctrl_SDs

```{r ctrl_sds}
class(raw_dat$ctrl_sd)
which(raw_dat$ctrl_sd == "") # as of 06/18/2021, this is no rows 
# and again as of 11/6/23 when I changed one blank cell to a - 
#' convert "no.sd" and "-" to NA
raw_dat$ctrl_sd <- str_replace_all(raw_dat$ctrl_sd, 
                                   c('no.sd' = NA_character_, 
                                     '-' = NA_character_))

#' Before convert to numeric,check which, if any, will be converted to NA by coercion
#' as of 6/18/2021. there are no studies converted by coercion
#' note: if there are some, re-download the data
sum(which(is.na(as.numeric(raw_dat$ctrl_sd))) != which(is.na(raw_dat$ctrl_sd)))
raw_dat$ctrl_sd <- as.numeric(raw_dat$ctrl_sd)

#' Convert all ctrl_SDs to 1 when Cohen's D is eff_type
raw_dat <- raw_dat |> 
  mutate(ctrl_sd = ifelse(eff_type == 'd', 1, ctrl_sd))

#' check if any necessary SDs are missing
raw_dat |> 
  filter(is.na(ctrl_sd)) |>
  filter(eff_type == 'd_i_d' | eff_type == 'd_i_m') |>
    nrow()
```

### Ns

```{r Ns_characters_become_NAs}
#' replace blanks, spaces, dashes, and 'not given' with NA

raw_dat[, c('n_t_pre', 'n_t_post', 'n_c_pre', 
            'n_c_post', 'n_t_group', 'n_c_group')] <-
  lapply(raw_dat[, c('n_t_pre', 'n_t_post', 'n_c_pre', 
                     'n_c_post', 'n_t_group', 'n_c_group')], 
         function(x) {
           x <- gsub(pattern = '-', replacement = NA, x = x)
           x <- gsub(pattern = '^\\s*$', replacement = NA, x = x) # replace whitespace string characters
           x <- gsub(pattern = 'not given', replacement = NA, x = x)
           return(x)
         })
```

# Now to convert everything to numeric

```{r further_N_clearning}
class(raw_dat$n_c_post)

cols_to_convert <- c('n_t_pre', 'n_t_post', 'n_c_pre', 
                     'n_c_post', 'n_t_group', 'n_c_group',
                     'u_s_d', 'anticipated_direction')
raw_dat[cols_to_convert] <- lapply(raw_dat[cols_to_convert], as.numeric)

rm(cols_to_convert)

#' Now checking for outstanding NAs where you really need one, which are n_t_post & n_c_post
na_vals <- subset(raw_dat, is.na(anticipated_direction) | 
                      apply(select(raw_dat, c('n_t_post', 'n_c_post')), 1, anyNA)) 

#' zero rows
rm(na_vals)
```

### Lab/field variable

```{r lab_field}
unique(raw_dat$lab_field)
sum(is.na(raw_dat$lab_field)) # 0 as of 09/19
raw_dat$lab_field <- as.factor(raw_dat$lab_field)
```

# fix study_design var and scale type

```{r study_design_and_scale_type}
raw_dat$study_design <- str_replace_all(raw_dat$study_design,
                                        c('cross sectional' = 'cross-sectional',
                                          'pre-post' = 'observational'))

raw_dat$study_design <- as.factor(raw_dat$study_design)
raw_dat$scale_type <- as.factor(raw_dat$scale_type)

if ("lab_or_field" %in% colnames(raw_dat)) {
  raw_dat <- raw_dat |> 
    select(-lab_or_field)
}

#' scale type
unique(raw_dat$scale_type) # good 
```

## Make everything under 10 clusters quasi-experimental

As Paluck et al. note in 'Prejudice Reduction: Progress and Challenges': 

>  in cluster-randomized experiments, groups of people, rather than individuals, are randomly assigned to experimental conditions. Reliably estimating standard errors requires at least 10 clusters, but many intervention studies do not approach even this minimal number.

So the cutoff is ten. We discuss this a bit in the appendix.

```{r too_few_clusters}

raw_dat$study_design <- as.character(raw_dat$study_design)

table(raw_dat$study_design)

raw_dat <- raw_dat |>
  mutate(robust_quasi_check = if_else(!is.na(n_t_group) & # check if clusters exists and its an RCT
                                        study_design == 'rct' & 
                                        n_t_group + n_c_group < 10, TRUE, FALSE)) |>
  mutate(study_design = ifelse(robust_quasi_check,  'quasi-experimental', study_design))

# how many did that affect
redesignated <- raw_dat |> 
  filter(robust_quasi_check) |>
  select(author, year, intervention_name, scale_name, delay, 
         unique_study_id, unique_paper_id, n_t_group, n_c_group)
nrow(redesignated) 
rm(redesignated)
raw_dat$study_design <- as.factor(raw_dat$study_design)
```

### convert delay into numeric

```{r delay}
raw_dat$delay <- str_replace_all(raw_dat$delay, c('4 month' = '122',
                                                   '2.5 years' = '912.5',
                                                   '2 weeks' = '14',
                                                   '3 weeks' = '21',
                                                   '1 month' = '30.5',
                                                   '5 weeks' = '35',
                                                   '14 days' = '14'))
raw_dat$delay[is.na(raw_dat$delay)] <- "0"

table(raw_dat$delay)
raw_dat$delay <- as.numeric(raw_dat$delay)
```

### Convert intervention_length into numeric

```{r fix_intervention_length}
raw_dat$intervention_length <- 
  ifelse(trimws(raw_dat$intervention_length) %in% 
           c("", "not given"), NA_character_, 
         raw_dat$intervention_length)

table(raw_dat$intervention_length, useNA = "ifany")

#' replace missing with 0
raw_dat$intervention_length[is.na(raw_dat$intervention_length)] <- "0"
raw_dat$intervention_length <- as.numeric(raw_dat$intervention_length)
```

### categorize behavior

Perpetration, victimization, bystander, and involvement are the big four intervention measures.

```{r categorize_behavior}

raw_dat <- raw_dat |>
  mutate(scale_name = str_to_lower(scale_name),
         behavior_type = as.factor(
           case_when(
             scale_type == "behavior" & str_detect(
               scale_name, "perp|perpetration|agression|comitted|aggression|aggressive") ~ "perpetration",
             scale_type == "behavior" &str_detect(
               scale_name, "vict|victimization|completed rape|underwent|ses-past year|survivor") ~ "victimization",
             scale_type == "behavior" &
               str_detect(scale_name, "bystander|observing|intervention|intervene") ~ "bystander",
             scale_type == "behavior" &
               str_detect(scale_name, "volunteer|support|involvement") ~ "involvement",
             scale_type == "attitudes" ~ "attitude",
             TRUE ~ NA_character_)))
```

### add useful levels

```{r levels}
raw_dat <- separate(raw_dat, setting, into = c("setting", "setting2"))

#' setting
raw_dat$setting <- factor(raw_dat$setting,
  levels = 1:7,
  labels = c(
    "middle school",
    "high school",
    "college",
    "work",
    "community",
    "faith based",
    "other"))

#' setting2
raw_dat$setting2 <- factor(raw_dat$setting2,
  levels = 1:7,
  labels = c(
    "middle school",
    "high school",
    "college",
    "work",
    "community",
    "faith based",
    "other"))


#' publication type
raw_dat$publication_type <- factor(raw_dat$publication_type,
  levels = 1:5,
  labels = c(
    "published",
    "unpublished",
    "government report",
    "dissertation",
    "formal evaluation"))

table(raw_dat$publication_type, useNA = "ifany")

raw_dat$origin <- factor(raw_dat$origin,
  levels = c(1, 2, 3),
  labels = c("DeGue", "Online Search", "Sent by Authors"))

#' condition_gender
table(raw_dat$condition_gender)

raw_dat <- raw_dat |>
  mutate(condition_gender = str_replace_all(
    condition_gender,
    c(
      "\\bboys\\b" = "male",
      "\\bmen\\b" = "male",
      "\\bwomen\\b" = "female",
      "\\bgirls\\b" = "female"
    )
  ))
table(raw_dat$condition_gender)

#' stage in life
raw_dat$stage_in_life <- factor(raw_dat$stage_in_life,
                                levels = 1:4,
                                labels = c("middle school (5th to 8th grade)", 
                                           "high school (9th to 12th grade)", 
                                           "college students", "adults"))


#' control type
raw_dat$type_of_control <- factor(raw_dat$type_of_control,
                                  levels = 1:4,
                                  labels = c("no treatment/waitlist control", 
                                             "placebo control", 
                                             "other treatment", 
                                             "no control group"))

#' treatment delivery
raw_dat$delivery_of_treatment <- factor(raw_dat$delivery_of_treatment,
                                        levels = 1:9,
                                        labels = c("lecture", 
                                                   "interactive presentation", 
                                                   "performance", 
                                                   "film", 
                                                   "active participants", 
                                                   "reading", 
                                                   "online", 
                                                   "not specified", 
                                                   "other"))
```

### participant_sex

This one is a little more complex because some studies have multiple treatment arms, one that's gender-segregreated and one that's mixed.

```{r participant_sex}
#' participant sex
table(raw_dat$participant_sex)
raw_dat$participant_sex <- str_replace_all(raw_dat$participant_sex,
                                           c("3,4" = "3, 4",
                                             "4,3" = "3, 4",
                                             "^$|^ $" = NA))
table(raw_dat$participant_sex)


raw_dat$participant_sex <- factor(raw_dat$participant_sex,
                                  labels = c("only male", 
                                             "only female", 
                                             "male and female in mixed groups", 
                                             "male and female in separate groups and also in combined groups",
                                             "male and female in separate groups",
                                             "male and female with group composition not specified",
                                             "general population"))
```

### Clean country

```{r}
raw_dat <- raw_dat |> 
  mutate(country = case_when(country == "MX" ~ "Mexico",
                             country == "CA" ~ "Canada",
                             country == "us" ~ "USA",
                             country == "" ~ "USA",
                             country == "US" ~ "USA",
                             T ~ country),
         country = factor(country))

table(raw_dat$country)
```

### clean up study_design

```{r study_design}
raw_dat$study_design <- str_replace_all(raw_dat$study_design, 
                                        pattern = "pre-post",
                                        replacement = "observational")
table(raw_dat$study_design)
```

### Add in more useful variables

```{r more_useful_varaiables}
# add in other useful variables
raw_dat <- raw_dat |>
  mutate(
    decade = as.factor(
      case_when(
        year <= 1989 ~ "1980s",
        year >= 1990 & year <= 1999 ~ "1990s",
        year >= 2000 & year <= 2009 ~ "2000s",
        year >= 2010 ~ "2010s",
        TRUE ~ "Other")),
    total_n = n_t_post + n_c_post,
    quantile_var = case_when(
      total_n < quantile(total_n, 0.2) ~ 1,
      total_n < quantile(total_n, 0.4) ~ 2,
      total_n < quantile(total_n, 0.6) ~ 3,
      total_n < quantile(total_n, 0.8) ~ 4,
      TRUE ~ 5),
    labels = paste(tools::toTitleCase(word(author)), year),
    ra = ifelse(study_design == 'rct', TRUE, FALSE),
    yes_delay = as.factor(delay > 0),
    published_unpublished =
      case_when(publication_type == 'published' ~ 'published',
                NA ~ 'unpublished',
                TRUE ~ 'unpublished'),
    study_design = case_when(
      study_design == "observational" ~ "Observational",
      study_design == "rct" ~ "Randomized Controlled Trial",
      study_design == "quasi-experimental" ~ "Quasi-Experimental"),
    study_design = factor(study_design, levels = c(
      "Randomized Controlled Trial",
      "Quasi-Experimental",
      "Observational")),
    behavior_type = str_to_title(behavior_type)) |>
  group_by(unique_study_id) |>
  mutate(
    has_both = case_when(
      all(c('attitudes', 'behavior') %in% scale_type) ~ 'both',
      scale_type == 'attitudes' ~ 'ideas',
      scale_type == 'behavior' ~ 'behavior'),
    attitudes_behaviors = case_when(
      all(c('attitudes', 'behavior') %in% scale_type) ~ 0,
      scale_type == 'attitudes' ~ 1,
      scale_type == 'behavior' ~ 2)) |>
  ungroup()
```

### replace 'attitudes' with 'ideas'

This was something we got more consistent about over the course of the paper, but at first.

```{r attitudes_become_ideas}
raw_dat <- raw_dat |>
  rename(ideas_behaviors = attitudes_behaviors) |>
  mutate(
    scale_type = if_else(scale_type == "attitudes", "ideas", scale_type),
    behavior_type = if_else(behavior_type == "Attitude", "ideas", behavior_type)
  )
```

## Export

```{r save_clean_data}
saveRDS(object = raw_dat, file = '../data/sv_meta_data.rds')

```

**Session info**

```{r sesion_info}
sessioninfo::session_info()
```
