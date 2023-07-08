#!/bin/bash
set -ex

# Step 1: clean
Rscript -e "rmarkdown::render('./1-download-and-clean-data.Rmd', 
  output_dir = './results', clean = T)"
# TO DO: add a parm var here for whether to download the data afresh?

# step 2: Cohens D
Rscript ./2-prep-data-for-analysis.R

# step 3: paper stats
Rscript -e "rmarkdown::render('./3-sa-meta.Rmd',
  output_dir = './results', clean = T)"

# step 4: robustness checks
Rscript -e "rmarkdown::render('./4-annotated-pre-analysis-plan.Rmd',
  output_dir = './results', clean = T)"

# step 5: descriptives

Rscript -e "rmarkdown::render('./5-paper-descriptives.Rmd',
  output_dir = './results', clean = T)"
