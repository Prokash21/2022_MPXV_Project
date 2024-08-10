
################################################### DEGs, LFC, FDR | NODE 5 ###################################################

# Find out P values, Log Fold Change(LFC) Values, False Discovery Rate (FDR) Values 

# Identify available coefficient names
coeff_names <- as.data.frame(resultsNames(dds))

# Print the coefficient names
print(coeff_names)

#   resultsNames(dds)
# 1                                 Intercept
# 2 Treatment_MPXV_clade_IIa_infected_vs_mock
# 3 Treatment_MPXV_clade_IIb_infected_vs_mock
# 4 Treatment_MPXV_clade_I_infected_vs_mock

# For User: Select 1 or 2 or 3 or 4

X <- coeff_names[3,]

resLFC <- lfcShrink(dds, coef = X  , type = "apeglm")

# Change DEseq object to R object (dataframe)
# change resLFC to a dataframe
resLFC <- as.data.frame(resLFC)

write.csv(resLFC, file = paste0('resLFC_', X,'.csv'))

# Researchers are often interested in minimizing the number of false discoveries. 
# Only Keep the significant genes padj (FDR) values is less than 0.05
# resLFC_p_cut <- resLFC[resLFC$padj < 0.05,]


# create histogram plot of p-values
hist(resLFC$padj, breaks=seq(0, 1, length = 21), col = "grey", border = "white", 
     xlab = "", ylab = "", main = "Frequencies of padj-values")

summary(resLFC)

############################################ UP and Downregulated Genes | NODE 5.1 ####################################################

# Upregulated genes
Upregulated <- resLFC[resLFC$log2FoldChange > 1 & resLFC$padj < 0.05, ]
Upregulated_padj <- Upregulated[order(Upregulated$padj ),]
write.csv(Upregulated_padj, file = paste0('Upregulated_padj_', X,'.csv'), row.names = TRUE)

# Downregulated genes
Downregulated <- resLFC[resLFC$log2FoldChange < -1 & resLFC$padj < 0.05, ]
Downregulated_padj <- Downregulated[order(Downregulated$padj),]
write.csv(Downregulated_padj, file = paste0('Downregulated_padj_', X,'.csv'), row.names = TRUE )
