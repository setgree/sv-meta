# ggplot forest plot

library(dplyr, warn.conflicts = F)
library(ggplot2, warn.conflicts = F)
library(stringr)
dat <- readRDS(file = './data/sa_meta_data_for_analysis.rds') %>%
  select(unique_study_id, scale_type, everything()) %>%
  mutate(labels = paste(tools::toTitleCase(word(author)), year)) %>%
  group_by(unique_study_id) %>%
  mutate(
    attitudes_behaviors = case_when(
      all(c('attitudes', 'behavior') %in% scale_type) ~ 0,
      scale_type == 'attitudes' ~ 1,
      scale_type == 'behavior' ~ 2
    )
  ) %>%
  ungroup()



# forest plot
rcts_grouped <- dat %>%
  filter(study_design == 'rct') %>%
  group_by(unique_paper_id) %>%
  mutate(mean_d = mean(d), mean_var_d = mean(var_d), mean_se_d = mean(se_d)) %>%
  select(author, year, paper_title, unique_study_id, 
         mean_d, mean_var_d, mean_se_d, everything()) %>%  
  slice(1) 


## metaplot effort
meta_rcts_grouped <- rma(yi = mean_d, vi = mean_var_d, data = rcts_grouped, slab = labels); meta_rcts_grouped
#forest plot attempt one
# pdf('./results/forest-plot.pdf',width = 20, height = 28)
sort.by.error <- rcts_grouped[order(rcts_grouped$mean_se_d), ]
yi <- sort.by.error$mean_d
sei <- sort.by.error$mean_se_d
var_names <- sort.by.error$labels

metaplot(mn = yi, se = sei, 
         labels = var_names,
         xlab = "Effect Size", ylab = "Study", 
         colors = meta.colors(box = "blue",
                              lines = 44,
                              zero = "white",
                              summary = "orange",
                              text = "black"),
         title(main = "SA  Forest Plot"))
abline(v = meta_rcts_grouped$beta, col = "blue", lty = "dashed")
# dev.off()
# don't love this, will use ggplot

