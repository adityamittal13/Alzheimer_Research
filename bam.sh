bowtie2  -x index.idx -1 read_1.fastq -2 read_2.fastq -S file.sam
samtools view -bS file.sam -o file.bam
samtools sort file.bam -o file.sorted.bam
