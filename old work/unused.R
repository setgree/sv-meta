library(tidyverse)
library(qualtRics)



```{r}
dat %>% 
  count(scale_name, sort = T) %>%
  DT::datatable()
```





##### Attitudes
How many papers measured attitudes?
  
  ```{r}
dat %>% count(scale_type, sort = T )
```

How many of those are short-term measurements?
  
  ```{r}
dat %>% 
  filter(scale_type == "attitudes") %>% 
  select(unique_study_id, delay) %>% 
  drop_na(delay) %>% 
  group_by(unique_study_id) %>% 
  mutate(max_delay = max(delay),
         only_short_term = max_delay == 0) %>% 
  count(only_short_term) %>% 
  ungroup() %>% 
  count(only_short_term)
```

Average effect size for attitude measurements, split by delay/no delay?
  
  ```{r}
dat %>%
  filter(scale_type == 'attitudes') %>% 
  split(.$delay  == 0) %>%
  map(.f = ~robust(x = rma(yi = .$d, 
                           vi = .$var_d), 
                   cluster = .$unique_study_id))
# mean delay?
mean(dat$delay)
median(dat$delay)
range(dat$delay)
quantile(dat$delay, by =  0.2)
```

To do so, we break down our dataset according to four types of study designs: experimental studies, quasi experimental studies, and observational studies. as presented in Table X, 
```{r}
dat %>% 
  select(unique_study_id, scale_type, study_design, d) %>% 
  filter(scale_type == "behavior") %>% 
  group_by(unique_study_id, study_design) %>% 
  summarise(mean_d_by_study_x_design = mean(d)) %>% 
  group_by(study_design) %>% 
  summarise(n = n(),
            mean_d_by_design = mean(mean_d_by_study_x_design)) %>% 
  kable(digits = 2, format = "latex", booktabs = T) %>%
  kableExtra::kable_styling()

```


```{r}
dat %>% 
  select(unique_study_id, scale_type, study_design, d) %>% 
  filter(scale_type == "attitudes") %>% 
  group_by(unique_study_id, study_design) %>% 
  summarise(mean_d_by_study_x_design = mean(d)) %>% 
  group_by(study_design) %>% 
  summarise(n = n(),
            mean_d_by_design = mean(mean_d_by_study_x_design)) %>% 
  kable(digits = 2, format = "latex", booktabs = T) %>%
  kableExtra::kable_styling() 
```


### Roni questions
**a list of all of the papers either written by foshee or evaluate safe dates**
  
  **a list of studies for this time perios (1985-2000) and where they were published** 
  
  **can we pull some data here to back up these arguments? can we look at 1985-2000 and see the breakdown in terms of labratory vs. field?** 
  
  **Also - can we say how many of these papers are dissertations vs. journal articles?**
  m
**finally - can we say who are the participants in these interventions? are they mostly targeting men?**
  
  ```{r roni_questions}
key_time_period <- dat %>% filter(year >= 1985 & year <= 2000) 
# look at 1985-2000 and see the breakdown in terms of labratory vs. field?
table(key_time_period$lab_field)

# publication type?
table(key_time_period$publication_type)

# gender breakdown? 
table(key_time_period$participant_sex, useNA = 'ifany')

dat %>% filter(year >= 1985 & year <= 2000) %>%
  group_by(condition_gender) %>%
  summarise(unique_study_count = n_distinct(unique_study_id))

### just for my own edification you can also do 
# dat %>%
#   filter(year >= 1985 & year <= 2005) %>%
#   {table(.$publication_type)}

# In this code, {} is used to group the operations within the pipe so that
# the `.` placeholder represents the filtered dataset. 


```

### Ana questions
can we put in a percent of total studies here that use IRMA

```{r IRMA_sum}
filtered_studies <- dat %>%
  filter(scale_type == 'attitudes') %>%
  distinct(unique_study_id, .keep_all = TRUE)

num_with_scale <- sum(grepl("illinois rape myth acceptance", filtered_studies$scale_name, ignore.case = TRUE))
num_without_scale <- nrow(filtered_studies) - num_with_scale

cat("Number of studies with 'Illinois Rape Myth Acceptance' in scale_name:", num_with_scale, "\n")
cat("Number of studies without 'Illinois Rape Myth Acceptance' in scale_name:", num_without_scale, "\n")

# double check this in a crude way
(dat %>%
    filter(grepl("illinois rape myth acceptance", scale_name, ignore.case = TRUE)) %>%
    distinct(unique_study_id) %>%
    nrow()) / (dat %>%
                 filter(scale_type == 'attitudes') %>%
                 distinct(unique_study_id) %>%
                 nrow())

dat %>%
  filter(scale_type == 'attitudes') %>%
  group_by(has_irma = grepl("illinois rape myth acceptance", scale_name, ignore.case = TRUE)) %>%
  summarize(Count = n())

# one other way
dat %>%
  filter(scale_type == 'attitudes') %>%
  distinct(unique_study_id, scale_name) %>%
  group_by(has_irma = grepl("illinois rape myth acceptance", scale_name, ignore.case = TRUE)) %>%
  summarize(Count = n_distinct(unique_study_id)) %>%
  kable(format = "markdown")

```


```{r}

```


```{r country_distribution}
one_point_per_study <- dat %>% ungroup() %>% group_by(unique_paper_id) %>% slice(1) 

table(one_point_per_study$country)
# clean up country data though

```