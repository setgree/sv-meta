# Code and Data for _Preventing Sexual Violence -- A Behavioral Problem Without a Behaviorally-Informed Solution_

By Roni Porat, Ana Gantman, Seth A. Green, John-Henry Pezzuto, \& Elizabeth Levy Paluck.

## Overview

This repository reproduces every quantitative claim and figure in the accompanying paper. 

### Code

The files in this directory reproduce all of the quantitative analyses in our paper and appendix. All files presume that `./code` is your working directory (open `sv-meta.Rproj` in Rstudio to have Rstudio take care of this automatically).

* `run.sh` is a shell script that runs through the data cleaning and analysis scripts, start to finish. (Here is an [introduction to shell scripts](https://swcarpentry.github.io/shell-novice/).)

* `1-paper-descriptives.Rmd`reproduces every quantitative and descriptive claim that's not in the results section. 

* `2-sv-meta.Rmd` reproduces the quantitative results.

* `3-appendixes.Rmd` reproduces the analyses in our appendixes.

* `4-exploratory-analyses.Rmd` produces some additional figures and analyses that we didn't include in the main scripts.

#### Functions

These files are in `code/functions/`.

* `d_calc.R` is the main function for calculating Glass's $\Delta$ or Cohen's d, depending on what you standardize on. This paper uses Glass's $\Delta$. This function was developed and refined over the course of the Contact and Prejudice reduction metas that Seth and John-Henry worked on previously. 

* `dip_calc.R` demonstrates how we calculate a standardized effect size from a reported difference in proportion. This comes up in an appendix.

* `map_robust.R` is a wrapper around `metafor::robust()` that allows us to pipe results to the function. It also works with `split | > map` analyses, which we found useful. 

* `odds_ratio_to_d.R` is used in an appendix to demonstrate why converting from odds ratio to Cohen's D can create a misleading impression about effect size magnitudes. Robin Gomila [makes this point very nicely elsewhere](https://www.robingomila.com/files/publications_pdfs/Gomila_2020_Logistic_vs_Linear.pdf). 

* `study_count.R` is used in `summarise()` at a few different points to count the number of unique study IDs in different subsets of the data.

* `sum_lm.R`prints a subset of the results from `summary(lm())` and also works in a pipe, e.g. `dat |> sum_lm()`.

* `var_d_calc.R` calculates the variance of $\Delta$.

* `write_dockerfile.R` composes a Dockerfile from information from `sessioninfo::package_info()`. 

### Data 

* `sv_meta_data.rds` is our dataset.

### Documentation

* `0-download-and-clean-data.md` is the script we used to download and clean the data (it was originally an `.Rmd`). You won't have access to our original google sheet dataset or raw data, but we're including this script as documentation.

* `codebook.csv` provides guidance about variables.

* `Dockerfile` reproduces the computational environment that produced the main results.

### Results

There are 4 HTML files, each corresponding to one of the main script, that intersperse relevant text, code, and results, and a figures folder with figures 1-5.

* `tt_studies.pdf` is Figure 1;
* `descriptive.pdf` is Figure 2;
* `tt_att_beh.pdf` is Figure 3;
* `tt_beh_type` is Figure 4;
* `corr.pdf` is Figure 5.