kallisto index -i index.idx transcripts.fasta.gz
kallisto quant -i index.idx -o output --bias -b 100 reads_1.fastq.gz reads_2.fastq.gz
