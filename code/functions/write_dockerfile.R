#' Convert the output from `sessioninfo::package_info()` into the contents of a Dockerfile
#' Generates a Dockerfile based on R package information
#'
#' @param write_file Boolean indicating whether to write the Dockerfile to disk
#' @param org The organization, defaulting to "rocker"
#' @param image The Docker image, defaulting to "r-base:latest"
#' @param apt_packages Boolean to install standard apt packages (default: TRUE)
#' @param dir Directory to save the Dockerfile (default: './')
#' @param filename Name of the Dockerfile (default: 'Dockerfile')
#' @export
#'
#' @importFrom sessioninfo package_info
#' @importFrom utils installed.packages
#'
write_dockerfileR <- function(write_file = TRUE,
                              org = "rocker",
                              image = "r-base:latest",
                              apt_packages = TRUE,
                              dir = './',
                              filename = 'Dockerfile') {
  
  # Check if 'sessioninfo' package is available
  if ("sessioninfo" %in% rownames(installed.packages()) == FALSE) {
    stop("Please install the 'sessioninfo' library before proceeding.")
  }
  
  # Write the Dockerfile to disk or output to console
  if (isTRUE(write_file)) {
    Dockerfile = paste0(dir, filename)
    file.create(Dockerfile)
    sink(file = Dockerfile, append = TRUE)
  }
  
  # Top of Dockerfile: add base image; install standard apt packages if required
  cat(paste0("FROM ", org, "/", image, "\n", "\n"))
  
  if (isTRUE(apt_packages)) {
    cat(paste0("RUN apt-get update \\", "\n",
               "  && apt-get install -y \\", "\n",
               "    \"libcurl4-openssl-dev\" \\", "\n",
               "    \"libssl-dev\" \\", "\n",
               "    \"libxml2-dev\" \\", "\n",
               "  && rm -rf /var/lib/apt/lists/*", "\n", "\n"))
  }
  
  # Retrieve package information
  pkgs <- sort(sessioninfo::package_info(pkgs = .packages(), 
                                         dependencies = FALSE)$package)
  
  # Install 'remotes' if necessary
  if (length(pkgs) != 0) {
    cat(paste0("RUN Rscript -e 'if(!require(\"remotes\")) ",
               "install.packages(\"remotes\")'", "\n"))
  }
  
  # Check for Bioconductor packages
  if (any(grep('Bioconductor', sessioninfo::package_info()$source))) {
    cat(paste0("RUN Rscript -e 'options(warn = 2); ",
               "if(!require(\"BiocManager\")) ",
               "install.packages(\"BiocManager\")'", "\n"))
  }
  
  # Separate packages into CRAN, Bioconductor, and GitHub packages
  cran_packs <- list()
  bioc_packs <- list()
  github_packs <- list()
  
  # Categorize packages
  for (pkg in pkgs) {
    # Categorize by source type
    if (any(grep("CRAN", sessioninfo::package_info(pkg, 
                                                   dependencies = FALSE)$source))) {
      cran_packs <- c(cran_packs, pkg)
    } else if (any(grep("Bioconductor", sessioninfo::package_info(pkg, 
                                                                  dependencies = FALSE)$source))) {
      bioc_packs <- c(bioc_packs, pkg)
    } else if (any(grep("Github", sessioninfo::package_info(pkg, 
                                                            dependencies = FALSE)$source))) {
      github_packs <- c(github_packs, pkg)
    }
  }
  
  # Add space after initial installation lines
  cat("\n")
  
  # Install CRAN packages
  for (pkg in cran_packs) {
    cat(paste0("RUN Rscript -e '",
               "remotes::install_version(package = '", pkg, "', ",
               "version = '", getNamespaceVersion(pkg), "')'", "\n"))
  }
  if (length(cran_packs) != 0) {
    cat("\n")
  }
  
  # Install Bioconductor packages
  if (length(bioc_packs) != 0) {
    cat("RUN Rscript -e 'options(warn = 2); ",
        "BiocManager::install(c(",
        paste(bioc_packs, collapse = ', '),
        "))'\n\n")
  }
  
  # Install GitHub packages
  for (pkg in github_packs) {
    source <- sessioninfo::package_info(pkg, dependencies = FALSE)$source
    cat(paste0("RUN Rscript -e '",
               "remotes::install_github(repo = '",
               gsub(pattern = ".*\\((.*)\\).*", replacement =  "\\1", source),
               "')'", "\n"))
  }
  
  # Stop writing to file if applicable
  if (isTRUE(write_file)) {
    sink()
  }
}
