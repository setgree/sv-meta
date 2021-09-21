#' ---
#' title: 4-ggplot-forest-plot.R
#' author: Seth Green
#' date: 2021-06-21
#' output:
#'  pdf_document
#' ---

# ggplot forest plot
# https://www.selfmindsociety.com/post/a-forest-plot-in-ggplot2
rm(list = ls())
library(dplyr, warn.conflicts = F)
library(ggplot2, warn.conflicts = F)
library(ggtext)
library(metafor)
library(purrr)
library(stringr)

# Prep Data
dat_for_forest_plot <- readRDS(file = './data/sa_meta_data_for_analysis.rds') %>%
  select(unique_study_id, scale_type, everything()) %>%
  group_by(unique_study_id) %>%
  mutate(
    attitudes_behaviors = case_when(
      all(c('attitudes', 'behavior') %in% scale_type) ~ 0,
      scale_type == 'attitudes' ~ 1,
      scale_type == 'behavior' ~ 2)) %>%
  ungroup()  %>%
  filter(study_design == 'rct') %>%
  mutate(study_names = paste0(tools::toTitleCase(word(author)), " ",
                         year, " ", "(", scale_type, ")")) %>%
  filter(attitudes_behaviors == 0) %>%
  group_by(unique_paper_id, scale_type) %>%
  mutate(d = mean(d), 
         var_d = mean(var_d),
         se_d = mean(se_d)) %>%
  slice(1) %>%
  ungroup(scale_type) %>% 
  mutate(mean_se = mean(se_d)) %>%
  arrange(desc(mean_se)) %>%
  ungroup() %>%
  mutate(index = row_number()) %>%
  select(index, study_names, d, se_d, scale_type, unique_paper_id, behavior_type)

# overall effect size
overall <- dat_for_forest_plot %>%
  split(.$scale_type) %>%
  map(~robust(x = rma(yi = .$d, 
                          sei = .$se_d),
                  cluster = .$unique_paper_id))
# plot 

p <- dat_for_forest_plot %>%
  ggplot(mapping = aes(y = index, x = d, xmin = d - (1.96 * se_d),
                       xmax = d + (1.96 * se_d))) +  
           geom_point(size = 1) +
  geom_errorbarh(height = .1, aes(color = scale_type)) +
  geom_vline(xintercept = 0, 
             color = "black",  alpha = .5) +
  scale_x_continuous(name = expression(paste("Glass's", " ", Delta))) +
  scale_y_continuous(name = "", , breaks=1:40, # , trans = "reverse"
                     labels = dat_for_forest_plot$study_names) + 
  ylab("Study") +
  geom_vline(xintercept = overall$attitudes$beta, color = '#F8766D', lty = 'dashed') +
  geom_vline(xintercept = overall$behavior$beta, color = '#00BFC4', lty = 'dashed') +
  labs(color = "Attitudes or behaviors") +
theme_minimal() + 
  theme(axis.text.y = element_text(face = "bold"))
p
png(filename = './results/4-ggplot-forest-plot.png', width = 1920/2, height = 1080/2)
p
dev.off()
# what if we limit this just to perpetration and victimization outcomes?
# TODO: this is complex, have to group studies together and then drop them if 
# behavior type = bystander or volunteer

# This was really useful for figuring out colors and such: `ggplot_build(p)$data`

# TODO: create another point at the bottom that's the overall effect size and
# SE, a la the bottom point you get from the stata equivalent. (Or...just do
# this in Stata? Don's stata plot from the contact hypothesis is really nice and
# the code is  really clear and easy to follow, just look at figure 2 on
# https://codeocean.com/capsule/8235972/tree/v7)

# Plus just make it nicer overall