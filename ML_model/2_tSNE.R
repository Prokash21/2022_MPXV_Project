################################################# t-SNE ###############################################

library(Rtsne)

# Load Data
data <- read.csv("10_rf_count_data.csv")
# Remove non-numeric columns for t-SNE
# Remove the gene ID column
data_numeric <- data[, sapply(data, is.numeric)]

# load the metadata
sample_info <- read.csv("10_rf_meta_data.csv", header =TRUE,row.names = 1)

set.seed(123)

# Perform t-SNE
metadata <- Rtsne(t(data_numeric), dims=2, perplexity=3, verbose=TRUE, max_iter=500)

# Create a data frame for plotting
tsne_data <- data.frame(
  X = tsne_result$Y[,1],
  Y = tsne_result$Y[,2],
  metadata
)

# Plot the t-SNE results using ggplot2
ggplot(tsne_data, aes(x = X, y = Y, color = metadata$group, label = rownames(metadata))) +
  geom_point(size = 3) +
  geom_text(aes(label = rownames(metadata)), hjust = 0, vjust = 1) +
  theme_minimal() +
  ggtitle("t-SNE Plot") +
  xlab("t-SNE 1") +
  ylab("t-SNE 2") +
  theme_minimal()
