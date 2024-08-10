
########################################## Machine Learning and Visualization ##########################################

library(pROC)
library(randomForest)

# Set Working Directory
setwd("E:/DWCT/DEG/GSE219036_6_june/JUNE_24/New_Idea_ML/RNA_SEQ/13_K_C")

# List and print files in the directory
files_in_directory <- list.files()
print(files_in_directory)

# Load Data
X <- read.csv("13_K_C_ex_run.csv")

# Define outcome variable and gene expression variables
obese <- X$condition
gene_list <- c(
  "AURKA", "CDC20", "CCNB1", "KIF11", "HSPG2",
  "CCNA2", "BUB1B", "CCNB2", "BUB1", "RRM2",
  "CTBP2", "UBE2C", "TXNRD1"
)

# Set up plot layout
par(mfrow=c(3, 5))

# Loop through each gene for ROC curves
for (i in seq_along(gene_list)) {
  gene <- gene_list[i]
  weight <- X[[gene]]
  
  # Logistic regression model
  glm.fit <- glm(obese ~ weight, family=binomial)
  roc_glm <- roc(obese, glm.fit$fitted.values)
  
  # Random forest model
  set.seed(123)
  rf.model <- randomForest(factor(obese) ~ weight, ntree=500)
  roc_rf <- roc(obese, rf.model$votes[,1])
  
  # Plot ROC curves
  plot(roc_glm, col="#377eb8", lwd=2, percent=TRUE, 
       xlab="Specificity", ylab="Sensitivity",
       main=paste(gene))
  text(0.5, 0.4, paste("AUC =", round(auc(roc_glm), 3)), col="#377eb8", adj=0, cex=0.8)
  plot.roc(roc_rf, col="#4daf4a", lwd=2, percent=TRUE, add=TRUE)
  text(0.5, 0.3, paste("AUC =", round(auc(roc_rf), 3)), col="#4daf4a", adj=0, cex=0.8)
}

# Reset plot layout
par(mfrow=c(1, 1))

# Select and convert genes to data frame
genes <- X[, gene_list]
genes <- as.data.frame(genes)

# Random Forest with all genes
set.seed(123)
rf.model <- randomForest(factor(obese) ~ ., data = genes, ntree = 500)

# Plot Random Forest model
plot(rf.model)
legend("topright", legend=c("Error Rate", "Class 1", "Class 2"), 
       col=c("black", "red", "green"), lty=1, cex=0.8)

# Variable importance
importance(rf.model)
varImpPlot(rf.model)

