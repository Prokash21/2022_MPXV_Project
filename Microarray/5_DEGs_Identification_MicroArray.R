#DEGs Identification
tT1 <- topTable(fit2, adjust="fdr", sort.by="B", number=Inf)
# Extract the log2FC values from 'fit2'
log2fc <- fit2$coefficients[, 1]

# Create a named vector of log2FC values with gene IDs as names
log2fc_vector <- log2fc[rownames(tT1)]

# Insert the log2FC values into the 'tT' table based on the gene IDs
tT1$log2FC <- log2fc_vector
#write.csv(tT1,"LFC_GSE11234_Fibroblast.csv")

################################################
# Identify upregulated genes (log2FC > 1 and adjusted p-value < significance_threshold)
UP_CTS1_adj <- tT1[tT1$log2FC > 1 & tT1$adj.P.Val < 0.05, ]

# Identify downregulated genes (log2FC < -1 and adjusted p-value < significance_threshold)
DOWN_CTS1_adj <- tT1[tT1$log2FC < -1 & tT1$adj.P.Val < 0.05, ]

UP_CTS1new_adj <- subset(UP_CTS1_adj, Reporter.Species %in% c("Homo sapiens", "Monkeypox virus (strain Zaire 77-0666)"))
UP_CTS1_new_Ordered_adj <- UP_CTS1new_adj[order(UP_CTS1new_adj$adj.P.Val), ]
#write.csv(UP_CTS1_new_Ordered_adj, "UP_Entrez_Fibroblast_GSE11234.csv")

DOWN_CTS1new_adj <- subset(DOWN_CTS1_adj, Reporter.Species %in% c("Homo sapiens", "Monkeypox virus (strain Zaire 77-0666)"))
DOWN_CTS1_new_Ordered_adj <- DOWN_CTS1new_adj[order(DOWN_CTS1new_adj$adj.P.Val), ]
#write.csv(DOWN_CTS1_new_Ordered_adj, "DOWN_Entrez_Fibroblast_GSE11234.csv")

UP_CTS1new_Skip_adj <- subset(UP_CTS1_adj, Reporter.Species %in% c("Variola virus", "Vaccinia virus (strain WR)", "Not Applicable"))
#DOWN_CTS1new_Skip_adj <- subset(DOWN_CTS1_adj, Reporter.Species %in% c("Not Applicable"))