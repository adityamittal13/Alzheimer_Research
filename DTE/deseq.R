# Libraries
library(DESeq2)

# Data Preprocessing
countfile <- "counts.bam"
countdata <- read.table(countfile, header = TRUE, row.names = 1)
data <- read.csv("expression_data.csv", row.names = 1)

# DeSeq
deseq <- DESeqDataSetFromMatrix(countData = countdata, colData = data, design = ~condition)
deseq <- DeSeq(deseq)

# Results
results <- results(deseq)
results <- res[order(res$padj),]
significant_results <- subset(results, padj < 0.05)
