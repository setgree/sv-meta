#!/bin/bash
set -ex

# Step 1: clean
Rscript -e "rmarkdown::render('./1-download-and-clean-data.Rmd', 
  output_dir = './results', clean = T)"

# step 2: Cohens D
Rscript 2-cohens-d.R

# step 3: paper stats
Rscript -e "rmarkdown::render('./3-sa-meta.Rmd', 
  output_dir = './results', clean = T)"

# step 4: forest plot
Rscript -e "rmarkdown::render('./4-ggplot-forest-plot.R', 
  output_dir = './results', clean = T)"

Rscript -e "rmarkdown::render('./5-paper-descriptives.Rmd', 
  output_dir = './results', clean = T)"

