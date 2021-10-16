# Libraries
library(wasabi)
library(sleuth)
library(annotables)
library(tidyverse)
library(dplyr)

# Directories
sample_id <- dir(file.path("results"))
files <- file.path("results", sample_id, "kallisto")

# Pre-processing
samples <- read.table(file.path("metadata", "hiseq_info.txt"), header = TRUE, stringsAsFactors=FALSE)
samples <- dplyr::select(samples, sample = run_accession, condition)
samples <- dplyr::mutate(samples, path = files)

# Sleuth
sleuth <- sleuth_prep(samples, extra_bootstrap_summary = TRUE)
sleuth <- sleuth_fit(sleuth, ~condition, 'full')

# Significance Tests
table <- sleuth_results(sleuth, 'reduced:full', 'lrt', show_all = FALSE)
significant_values <- dplyr::filter(table, qval <= 0.05)
plot_bootstrap(sleuth, significant_values[0], units = "est_counts", color_by = "condition")
