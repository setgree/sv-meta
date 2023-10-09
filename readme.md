# Code and Data for _Preventing Sexual Violence -- A Behavioral Problem Without a Behaviorally-Informed Solution_

By Roni Porat, Ana Gantman, Seth A. Green, John-Henry Pezzuto, \& Elizabeth Levy Paluck.

## Overview

This repository reproduces every quantitative claim and figure in the accompanying paper. 

## Scripts

These are the main files in `code/`.

* `run.sh` is a shell script that runs through the data cleaning and analysis scripts, start to finish. (Here is an [introduction to shell scripts](https://swcarpentry.github.io/shell-novice/).)

* `1-paper-descriptives.Rmd`reproduces every quantitative and descriptive claim that's not in the results section. 

* `2-sa-meta.Rmd` reproduces the quantitative results.

* `3-appendixes.Rmd` reproduces the analyses in our appendixes.

* `4-exploratory-analyses.Rmd` produces some additional figures and analyses that we didn't include in the main scripts.

## Functions

These are the files in `code/functions/`.

* `d_calc.R` calculates Glass's $\Delta$ based on the specified inputs.

* `dip_calc` demonstrates how we calculate a standardized effect size from a reported difference in proportion. This comes up in an appendix.

* `dplot.R` is an experimental function that creates a scatterplot of effect size and standard error of effect size. We use this a bit in the exploratory analyses script.

* `map_robust.R` is a wrapper around `metafor::robust()` that allows us to pipe results to the function. It also works with `split | > map` analyses, which we found useful. 

* `odds_ratio_to_d.R` is used in an appendix to demonstrate why converting from odds ratio to Cohen's D can create a misleading impression about effect size magnitudes. Robin Gomila [makes this point very nicely elsewhere](https://www.robingomila.com/files/publications_pdfs/Gomila_2020_Logistic_vs_Linear.pdf). 

* `study_count.R` is used in `summarise()` at a few different points to count the number of unique study IDs in different subsets of the data.

* `sum_lm.R`prints a subset of the results from `summary(lm())` and also works in a pipe, e.g. `dat |> sum_lm()`.

* `var_d_calc.R` calculates the variance of $\Delta$.

* `write_dockerfile.R` compoes a Dockerfile from information from `sessioninfo::package_info()`. 

## Data 
* `sa_meta_data_raw.csv` is the data you need to start from script 1. 

* `codebook.csv` and `codebook.pdf` provide some guidance about variable names.

## Documentation

* `0-download-and-clean-data.txt` is the script we used to download and clean the data (it was originally an `.Rmd`). You won't have access to our original google sheet dataset or raw data, but we're including this script as documentation.

## Results
Note to self to un-ignore this folder once we're ready to publish

### TODO
