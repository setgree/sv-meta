#!/bin/bash
set -ex

if [ ! -d "../results/figures" ]; then
    mkdir -p "../results/figures"
fi

# step 1: descriptive stats
Rscript -e "rmarkdown::render('./1-paper-descriptives.Rmd',
  output_dir = '../results', clean = T)"

# step 2: meta analysis
Rscript -e "rmarkdown::render('./2-sv-meta.Rmd',
  output_dir = '../results', clean = T)"

# step 3: appendixes
Rscript -e "rmarkdown::render('./3-appendixes.Rmd',
  output_dir = '../results', clean = T)"
  
# step 4: exploratory analyses
Rscript -e "rmarkdown::render('./4-exploratory-analyses.Rmd',
  output_dir = '../results', clean = T)"