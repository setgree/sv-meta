#!/bin/bash
set -ex

if [ ! -d "../results/figures" ]; then
    mkdir -p "../results/figures"
fi

# Step 1: clean
Rscript -e "rmarkdown::render('./1-download-and-clean-data.Rmd', 
  output_dir = '../results', clean = T)"

# step 2: Cohens D and add necessary variables
Rscript ./2-prep-data-for-analysis.R

# step 3: descriptive stats
Rscript -e "rmarkdown::render('./3-paper-descriptives.Rmd',
  output_dir = '../results', clean = T)"

# step 4: meta analysis
Rscript -e "rmarkdown::render('./4-sa-meta.Rmd',
  output_dir = '../results', clean = T)"

# step 5: appendixes
Rscript -e "rmarkdown::render('./5-appendixes.Rmd',
  output_dir = '../results', clean = T)"
  
  # step 6: exploratory analyses
Rscript -e "rmarkdown::render('./6-exploratory-analyses.Rmd',
  output_dir = '../results', clean = T)"