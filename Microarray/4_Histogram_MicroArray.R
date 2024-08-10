
##############################Histogram######
# Build histogram of P-values for all genes. Normal test
hist(tT$adj.P.Val, col = "#B32424", border = "white", xlab = "P-adj",
     ylab = "Number of genes", main = "P-adj value distribution")

significant_genes <- sum(tT$adj.P.Val < 0.05)
print(significant_genes)
