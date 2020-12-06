#!/bin/bash

# Step 1: clean
Rscript -e "rmarkdown::render('./1-download-and-clean-data.Rmd', 
  output_dir = './results', clean = T)"

# step 2: Cohens D
Rscript 2-cohens-d.R

# step 3: paper stats
Rscript -e "rmarkdown::render('./3-SA-meta-analysis.Rmd', 
  output_dir = './results', clean = T)"
