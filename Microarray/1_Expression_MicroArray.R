
# Differential expression analysis with limma
library(GEOquery)
library(limma)
library(umap)
library(ggplot2)

# load series and platform data from GEO
gset <- getGEO("GSE11234", GSEMatrix =TRUE, AnnotGPL=FALSE)
if (length(gset) > 1) idx <- grep("GPL6762", attr(gset, "names")) else idx <- 1
gset <- gset[[idx]]

# make proper column names to match toptable 
fvarLabels(gset) <- make.names(fvarLabels(gset))

# group membership for all samples
#8 vs 8
#gsms <- paste0("XXXXXXXXXXXX1X1X1X1X1X1X1X1XXXXXXXXXXXXXXXXXXXXXXX",
#              "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX0XX",
#             "XXXX000X00X0X0XXXXXXXXXX")
#6 vs 8
gsms <- paste0("XXXXXXXXXXXX1X1X1X1X1X1X1X1XXXXXXXXXXXXXXXXXXXXXXX",
               "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
               "XXXXX00X00X0X0XXXXXXXXXX")
sml <- strsplit(gsms, split="")[[1]]

# filter out excluded samples (marked as "X")
sel <- which(sml != "X")
sml <- sml[sel]
gset <- gset[ ,sel]

#Expression Data
ex <- exprs(gset)
ex <- normalizeQuantiles(ex)
#write.csv(ex,"Expression_GSE11234_Fibroblast.csv")
