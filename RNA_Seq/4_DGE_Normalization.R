
########################################### DGE Analysis ###################################################

########################################## Normalization | NODE 3 ###################################################

# Expression Data
# load the count data
# count_data <- read.csv("count_data.csv", header=TRUE,row.names = 1)

# Metadata
# load the sample info
# sample_info <- read.csv("meta_data.csv", header =TRUE,row.names = 1)

# Ensure the number of samples match
# if (ncol(count_data) != nrow(sample_info)) {
#   stop("Number of samples in count_data and sample_info do not match!")
# }

# Convert Condition to factor
# sample_info$Treatment <- factor(sample_info$Treatment)
# 
# Quality Control: detect outlier genes
# library(WGCNA)
# 
# gsg <- goodSamplesGenes(t(count_data))
# summary(gsg)
# 
# Remove outlier genes
# data <- count_data[gsg$goodGenes == TRUE,]

# Convert non-integer values to integers in count data
data <- round(data)
head(data)

# Create a new count data object
new_data <- as.matrix(data)
head(new_data)

dim(data)
dim(new_data)
dim(sample_info)

# Start Normalization
library(DESeq2)

# Generate the DESeqDataSet object
dds <- DESeqDataSetFromMatrix(countData = new_data, colData = sample_info, design = ~ Treatment)

# Perform DESeq2 analysis
dds <- DESeq(dds)
head(dds)

unique(sample_info$Treatment)

# [1] mock                    MPXV_clade_IIa_infected MPXV_clade_IIb_infected
# [4] MPXV_clade_I_infected 

# Input all factor from metadata 

# set the factor level 
dds$Treatment <- factor(dds$Treatment, levels = c("mock","MPXV_clade_IIa_infected","MPXV_clade_IIb_infected","MPXV_clade_I_infected")) 

# filter the genes
n <- round(as.data.frame((dim(sample_info) * .70)))[1,] # Check
keep <- rowSums(counts(dds)) >= n # This number would be less than 75 percent of sample number
dds <- dds[keep,]
dds

# set the reference/ control for the treatment factor
dds$Treatment <- relevel(dds$Treatment , ref = "mock") # User input ref = "....."
dds$Treatment

# perform the statistical tests to identify differentialy expressed genes
dds <- DESeq(dds)
head(dds)

# save the normalized counts
normalize_counts <- counts(dds,normalized=TRUE)
head(normalize_counts)
dim(normalize_counts)
write.csv(normalize_counts,"Normalized_Count_Data.csv")