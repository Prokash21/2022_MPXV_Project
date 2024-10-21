


################################################# PCA ########################################################

# Load Expression Data
# data <- read.csv("10_rf_count_data.csv")

# load the metadata
# sample_info <- read.csv("10_rf_meta_data.csv", header =TRUE,row.names = 1)


# Check for NA or Infinite values
summary(data)
is.na(data)

is.infinite(data)
# Replace NA and Infinite values with zero

data[is.na(data)] <- 0
data[is.infinite(data)] <- 0

# Verify no NA or Infinite values remain
summary(data)

# Remove non-numeric columns for PCA
# Remove the gene ID column
data_numeric <- data[, sapply(data, is.numeric)]
# data_numeric <- data[,1:12]

# Perform PCA
pca <- prcomp(t(data_numeric))

# View the PCA results
summary(pca)

# Prepare PCA data for plotting
pca.dat <- as.data.frame(pca$x)
pca.var <- pca$sdev^2
pca.var.percent <- round(pca.var / sum(pca.var) * 100, digits = 2)

# Merge PCA data with metadata
pca.dat <- cbind(pca.dat, sample_info)

library(ggplot2)
# Plot PCA with metadata groups
ggplot(pca.dat, aes(PC1, PC2, color = Treatment)) +
  geom_point() +
  geom_text(aes(label = rownames(pca.dat)), hjust = 0, vjust = 1) +
  labs(x = paste0('PC1: ', pca.var.percent[1], ' %'),
       y = paste0('PC2: ', pca.var.percent[2], ' %')) +
  theme_minimal() +
  theme(legend.title = element_blank())
