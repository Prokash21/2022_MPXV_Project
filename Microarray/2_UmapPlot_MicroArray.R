#Umap Plot
# Ensure the data is cleaned
ex <- na.omit(ex)  # eliminate rows with NAs
ex <- ex[!duplicated(ex), ]  # remove duplicates

# Perform UMAP
ump <- umap(t(ex), n_neighbors = 7, random_state = 123)

# Plot UMAP
par(mar = c(3, 3, 2, 6), xpd = TRUE)
plot(ump$layout, main = "UMAP plot, nbrs=7", xlab = "", ylab = "", col = gs, pch = 20, cex = 1.5)

# Add legend for the groups
legend("topright", inset = c(-0.15, 0), legend = levels(gs), pch = 20, col = 1:nlevels(gs), title = "Group", pt.cex = 1.5)

# Add sample names as labels to each point
text(ump$layout, labels = colnames(ex), pos = 4, cex = 0.7, col = 'black')