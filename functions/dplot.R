library(broom)
library(dplyr)
library(ggplot2)
library(stringr)

dplot  <- function(sa_data = dat, dot_size = 3, condense = F,
                   dot_informative = T, dot_shape = T, title = T) {
  
  # condense down to one estimate per paper?
  {if (condense) sa_data <- sa_data %>%
      group_by(unique_paper_id) %>% 
      mutate(d = mean(d),
             se_d = mean(se_d)) %>% 
      ungroup() %>% 
      distinct(unique_paper_id, .keep_all = T)}
  
  # helper functions for statistical summaries
  add_parenthesis <- function(vector){
    out <- as.vector(paste0("(", vector, ")")); out
  }
  coef_label_n <- function(df){
    coef <- round(tidy(lm(d ~ se_d, data = df))[,2], digits = 2) %>% 
      pull()
    paste0("ŷ = ", str_c(coef, collapse = " + "), "se")
  }
  se_label_n <- function(df){
    round(tidy(lm(d ~ se_d, data = df))[,3], digits = 2) %>% 
      pull() %>% add_parenthesis() %>% paste(., collapse = "  ")
  }
  
  # compute statistical summaries and combine into annotation dataset
  dcor <- paste("R = ", round(cor(sa_data$d, sa_data$se_d),
                              digits = 2))
  coef <- coef_label_n(sa_data)
  se_labs <- se_label_n(sa_data)
  rows <- paste("n = ", nrow(sa_data))
  xrng <- range(sa_data$se_d)[1]
  yrng <- range(sa_data$d)[2]
  annotations_df <- data.frame(x = xrng, y = yrng,
                               labels = paste(dcor, '\n', coef, '\n', 
                                              se_labs, '\n', rows))
  # plot
  dplot <- sa_data %>%
    ggplot2::ggplot(data = sa_data,
                    mapping = aes(y = d, x = se_d)) + 
    {if(dot_informative) geom_point(aes(color = study_design, 
                                  shape = scale_type), 
                              size = dot_size) } + 
    {if(dot_informative == F) geom_point(aes(colour = 'black'), size = dot_size) } +
    geom_smooth(method = 'lm') +
    xlab("Standard Errors") + 
    ylab("Effect Sizes") +
    guides(size = F) +
    {if(isTRUE(title)) ggtitle("Effect sizes by Standard Errors")} +
    {if(dot_informative) labs(colour = "Study Design", 
                              shape = "Attitudes or Behaviors")} +
    scale_shape_manual(name = "Attitudes or Behaviors",
                       values = c(16, 17), 
                       labels = c("Attitudes", "Behaviors")) +
    theme(plot.title =  element_text(hjust = 0.5))
  # add annotations
  dplot + geom_text(data = annotations_df,
                    mapping = aes(x = x, y = y, label = labels),
                    hjust = 'inward', vjust = 'inward')
}
