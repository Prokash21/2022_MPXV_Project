
########################################## RNA-Seq Data ############################################

source("install_packages.R")

########################################### Read Files | NODE 1 #############################################

# Load Data

# Expression Data
# load the count data
count_data <- read.csv("count_data.csv", header = TRUE, row.names = 1)

# Metadata
# load the sample info
sample_info <- read.csv("meta_data.csv", header = TRUE, row.names = 1)

# Ensure the number of samples match
if (ncol(count_data) != nrow(sample_info)) {
  stop("Number of samples in count_data and sample_info do not match!")
}

# Convert Condition to factor
sample_info$Treatment <- factor(sample_info$Treatment)

########################################### Screen Data Quality | NODE 2 ##############################################

# Dimension Reduction
# Data Quality
# Remove Outlier Samples

##############################################################################################################

# Quality Control: detect outlier genes
library(WGCNA)
gsg <- goodSamplesGenes(t(count_data)) # check the data format
summary(gsg)

# Remove outlier genes
data <- count_data[gsg$goodGenes == TRUE,]
