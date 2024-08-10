##########################################
# Install Required Packages
##########################################

# Install BiocManager if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# Install Bioconductor and CRAN packages
BiocManager::install(c("WGCNA", "DESeq2"))
install.packages(c("tidyverse", "Rtsne", "umap", "ggplot2"))

##########################################
# Set Working Directory
##########################################

# Set the working directory
setwd("E:/DWCT//RNASeq/DGE")
getwd()
