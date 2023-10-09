#!/bin/bash
set -ex

if [ ! -d "../results/figures" ]; then
    mkdir -p "../results/figures"
fi

# Step 0: clean
Rscript -e "rmarkdown::render('./0-download-and-clean-data.Rmd', 
  output_dir = '../results', clean = T)"

# step 3: descriptive stats
Rscript -e "rmarkdown::render('./1-paper-descriptives.Rmd',
  output_dir = '../results', clean = T)"

# step 4: meta analysis
Rscript -e "rmarkdown::render('./2-sa-meta.Rmd',
  output_dir = '../results', clean = T)"

# step 5: appendixes
Rscript -e "rmarkdown::render('./3-appendixes.Rmd',
  output_dir = '../results', clean = T)"
  
  # step 6: exploratory analyses
Rscript -e "rmarkdown::render('./4-exploratory-analyses.Rmd',
  output_dir = '../results', clean = T)"