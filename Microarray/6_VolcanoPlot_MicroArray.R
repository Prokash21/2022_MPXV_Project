#Volcano plot
# Combine all genes (including non-significant ones)
combined_data_adj <- rbind(
  transform(UP_CTS1_new_Ordered_adj, Regulation = "Upregulated"),
  transform(DOWN_CTS1_new_Ordered_adj, Regulation = "Downregulated"),
  transform(tT1[!(rownames(tT1) %in% rownames(UP_CTS1_new_Ordered_adj) | rownames(tT1) %in% rownames(DOWN_CTS1_new_Ordered_adj)),], Regulation = "Not Significant")
)
# Filter out genes that should not be shown in the plot
filtered_data_adj <- combined_data_adj[!(rownames(combined_data_adj) %in% rownames(UP_CTS1new_Skip_adj) | rownames(combined_data_adj) %in% rownames(DOWN_CTS1new_Skip_adj)),]

# Create a volcano plot for upregulated, downregulated, and not significant genes
ggplot(filtered_data_adj, aes(x = log2FC, y = -log10(adj.P.Val))) +
  geom_point(aes(color = Regulation), size = 2, alpha = 0.7) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "red") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "red") +
  labs(
    title = "Volcano-Plot for Significant Genes in Fibroblast - GSE11234",
    x = "Log2 Fold Change",
    y = "-log10(adj.P-Value)",
    color = "Regulation"
  ) +
  scale_color_manual(values = c("Upregulated" = "red", "Downregulated" = "blue", "Not Significant" = "grey")) +
  theme_minimal()