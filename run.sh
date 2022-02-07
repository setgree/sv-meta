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

# step 4: robustness checks
Rscript -e "rmarkdown::render('./4-robustness-checks-and-alternate-specifications.Rmd', 
  output_dir = './results', clean = T)"

# step 5: descriptives
Rscript -e "rmarkdown::render('./5-paper-descriptives.Rmd', 
  output_dir = './results', clean = T)"

