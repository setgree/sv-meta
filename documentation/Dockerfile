FROM rocker/r-base:latest

RUN apt-get update \
  && apt-get install -y \
    "libcurl4-openssl-dev" \
    "libssl-dev" \
    "libxml2-dev" \
  && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'if(!require("remotes")) install.packages("remotes")'

RUN Rscript -e 'remotes::install_version(package = "dplyr", version = "1.1.3")'
RUN Rscript -e 'remotes::install_version(package = "forcats", version = "1.0.0")'
RUN Rscript -e 'remotes::install_version(package = "ggplot2", version = "3.4.3")'
RUN Rscript -e 'remotes::install_version(package = "ggrepel", version = "0.9.3")'
RUN Rscript -e 'remotes::install_version(package = "ggtext", version = "0.1.2")'
RUN Rscript -e 'remotes::install_version(package = "ggthemes", version = "4.2.4")'
RUN Rscript -e 'remotes::install_version(package = "janitor", version = "2.2.0")'
RUN Rscript -e 'remotes::install_version(package = "kableExtra", version = "1.3.4")'
RUN Rscript -e 'remotes::install_version(package = "knitr", version = "1.44")'
RUN Rscript -e 'remotes::install_version(package = "lubridate", version = "1.9.3")'
RUN Rscript -e 'remotes::install_version(package = "Matrix", version = "1.6-1.1")'
RUN Rscript -e 'remotes::install_version(package = "metadat", version = "1.2-0")'
RUN Rscript -e 'remotes::install_version(package = "metafor", version = "4.4-0")'
RUN Rscript -e 'remotes::install_version(package = "numDeriv", version = "2016.8-1.1")'
RUN Rscript -e 'remotes::install_version(package = "patchwork", version = "1.1.3")'
RUN Rscript -e 'remotes::install_version(package = "purrr", version = "1.0.2")'
RUN Rscript -e 'remotes::install_version(package = "scales", version = "1.2.1")'
RUN Rscript -e 'remotes::install_version(package = "stringr", version = "1.5.0")'
RUN Rscript -e 'remotes::install_version(package = "tibble", version = "3.2.1")'
RUN Rscript -e 'remotes::install_version(package = "tidyr", version = "1.3.0")'

