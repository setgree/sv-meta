FROM rocker/r-base:latest

RUN apt-get update \
  && apt-get install -y \
    "libcurl4-openssl-dev" \
    "libssl-dev" \
    "libxml2-dev" \
  && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'if(!require("remotes")) install.packages("remotes")'

RUN Rscript -e 'remotes::install_version(package = "clipr", version = "0.7.1")'
RUN Rscript -e 'remotes::install_version(package = "dplyr", version = "1.0.7")'
RUN Rscript -e 'remotes::install_version(package = "forcats", version = "0.5.1")'
RUN Rscript -e 'remotes::install_version(package = "ggplot2", version = "3.3.5")'
RUN Rscript -e 'remotes::install_version(package = "ggtext", version = "0.1.1")'
RUN Rscript -e 'remotes::install_version(package = "glue", version = "1.4.2")'
RUN Rscript -e 'remotes::install_version(package = "janitor", version = "2.1.0")'
RUN Rscript -e 'remotes::install_version(package = "kableExtra", version = "1.3.4")'
RUN Rscript -e 'remotes::install_version(package = "knitr", version = "1.33")'
RUN Rscript -e 'remotes::install_version(package = "patchwork", version = "1.1.1")'
RUN Rscript -e 'remotes::install_version(package = "purrr", version = "0.3.4")'
RUN Rscript -e 'remotes::install_version(package = "readr", version = "2.0.1")'
RUN Rscript -e 'remotes::install_version(package = "rstatix", version = "0.7.0")'
RUN Rscript -e 'remotes::install_version(package = "stringr", version = "1.4.0")'
RUN Rscript -e 'remotes::install_version(package = "tibble", version = "3.1.4")'
RUN Rscript -e 'remotes::install_version(package = "tidyr", version = "1.1.3")'
RUN Rscript -e 'remotes::install_version(package = "tidyverse", version = "1.3.1")'

