# Memo

How can we leverage transcriptomic and MRI brain data to predict new genetic targets for neurodegenerative diseases, in relation to the immune system and inflammation?

# Executive Summary

Neurodegenerative disorders, like Alzheimer's and Parkinson's, afflict nearly a billion individuals worldwide, causing decreased brain function and movement. Current clinical studies focus on remediating symptoms of these diseases rather than removing underlying causes; along with having a lack of understanding and complexity from a neural transcriptome perspective, many scientists struggle to find a permanent solution to these issues.

By leveraging transcriptome and MRI imaging, this study aims to expand possible gene targets for future drug discovery methods in Alzheimer's and other neurodegenerative diseases. After discovering inflamed areas from brain scans using convolutional neural networks and mapping them to neural regions, differential expression can find statistically significant genes, with feature selection methods optimizing the efficacy of the expression dataset.

This venture will provide new targets for researchers and increase savings through an automated workflow and accessibility through open-source code; additional testing can be run to validate these hypotheses, allowing for much stronger targeted treatments than before.

# Problem

**Nearly [1 billion](https://news.un.org/en/story/2007/02/210312-nearly-1-6-worlds-population-suffer-neurological-disorders-un-report) individuals are afflicted with neurological diseases**, from Alzheimer's disease to migraines to multiple sclerosis, with 6.8 million deaths each year. Currently, **there are [no cures for neurological diseases](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6027455)** due to the complexity of neural systems and lack of understanding from a genome and transcriptome perspective.

Because disease research is heavily symptoms-oriented and focused on proteins that cause neurodegenerative diseases, genomic and transcriptomic resources are underutilized, passing up on hundreds of potential gene and RNA targets that could be used in the drug discovery pipeline. By analyzing gene datasets, neurodegenerative research can expand, providing new pathways for reducing the impact of these harmful ailments.

### Alzheimer's

Approximately [44 million](https://alzheimersnewstoday.com/alzheimers-disease-statistics/) (around .6% of the global population) individuals are afflicted with Alzheimer's disease globally, being the most [prevalent](https://www.niehs.nih.gov/research/supported/health/neurodegenerative/index.cfm) and deadly neurodegenerative disorder as it causes uncontrolled cell death and loss of brain function. 

Prevailing hypotheses have sourced a buildup of amyloid, an uncontrolled protein deposited in animal tissues, to be the leading cause of this disease; this has spurred a number of treatments ([28%](https://www.science.org/content/article/alzheimer-s-gamble-nih-tries-turn-billions-new-funding-treatment-deadly-brain-disease) of research space) and billions of dollars of R&D to reduce amyloid, with little avail. **Little research has been performed outside of the amyloid space**, and with rates of Alzheimer's increasing, there's an increasing necessity for more permanent solutions.

Other research [focuses](https://www.science.org/content/article/alzheimer-s-gamble-nih-tries-turn-billions-new-funding-treatment-deadly-brain-disease) in the Alzheimer's space, like in metabolism (4.1%), neuroendocrine mechanisms (3.5%), and immunity (9.4%) often require additional genetic testing to continue their research further; however, due to the lack of knowledge in the space and inaccessibility of certain datasets, this research is often discontinued before it makes an impact. 

### Financial Investments

[Billions of dollars](https://www.science.org/content/article/alzheimer-s-gamble-nih-tries-turn-billions-new-funding-treatment-deadly-brain-disease) are being poured into Alzheimer's and other neurodegenerative diseases. Specifically, [OECD](https://www.oecd.org/about/budget/) notes 60% of research in scientific fields is carried out by industry, while 20% and 10% respectively are carried out by universities and government. 

In 2013, the United States spent nearly [$456.1 billion](https://www.nsf.gov/statistics/2015/nsf15330/nsf15330.pdf) on research, of which [$34 billion](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6118094/) is going to neurodegenerative diseases. Industry is the biggest contributor due to the potential for profit that comes from a breakthrough; however, due to little to no progress in the field and major clinical trial failures (from focusing on specific protein targets), financial investments are waning, indicating a need to shift to a new approach to research. Additionally, universities fund heavily for Alzheimer's research and are ramping up investment, as seen by Brown's recent [Center for Alzheimer's Disease Research](https://www.brown.edu/news/2021-04-28/center) and a [$55.6 million grant from the University of Washington](https://stateofreform.com/news/washington/2021/08/alzheimers-research-washington/). Similar to industry, little progress will decrease financial investments over time, indicating a need for a new method.

Lastly, the government, particularly the NIH, has a large stake in Alzheimer's research, with over [5% of its total budget](https://www.science.org/content/article/alzheimer-s-gamble-nih-tries-turn-billions-new-funding-treatment-deadly-brain-disease) going towards funding neurodegenerative disease research; government spending has ramped up, due to increases in grant applications and the government wanting to "bring in fresh ideas". This is evidenced by their change in spending, with a decrease in [~10% in β-amyloid](https://www.science.org/content/article/alzheimer-s-gamble-nih-tries-turn-billions-new-funding-treatment-deadly-brain-disease) from 27.2% and a ~3% increase in genetics research from 9.3%, among other novel ideas. Lastly, out of 452 that won Alzheimer's grants, 27% received their first NIH grant, while only 36% were established, indicating, in NIH Director Richard Hodes' words, that "[they're] not just repeating the things that failed and hoping [they] get a different result."

# Solution

*Code for building the pipeline can be accessed [here](https://github.com/adityamittal13/Alzheimer_Research).*

## Datasets

To relate inflammation data to genomic markers, the [Allen Brain Atlas](https://human.brain-map.org/) data portal was used, containing extensive gene expression levels for various gene classifications and parts of the body. This study looked specifically at gene classifications of [transcription factors](https://human.brain-map.org/microarray/search/show?search_term=84&search_type=gene_classification), [Alzheimer's](https://human.brain-map.org/microarray/search/show?search_term=91&search_type=gene_classification&page_num=0), and [inflammation mediated by chemokine and cytokine signaling pathways](https://human.brain-map.org/microarray/search/show?search_term=49&search_type=gene_classification&page_num=0).

To provide differential gene expression, FASTQ files were needed in conjunction with gene/transcript expression matrices. The [Aging, Dementia, and Traumatic Brain Injury Study](https://www.niagads.org/datasets/ng00059) in conjunction with [Guan et. al 2021.](https://www.niagads.org/datasets/ng00112) provided the requisite files needed.

## Workflow

![Screen Shot 2021-10-16 at 2.35.26 PM.png](Memo%200e30296069224924a52d9e1360f35b62/Screen_Shot_2021-10-16_at_2.35.26_PM.png)

Developing ML algorithms that can segment and interpret phenotypic-level changes in the brain are only valuable if there is a biological decision making process that can connect genome-wide associations with whole-brain patterns. This is why our pipeline is designed to validate many different hypotheses based on whole-brain changes by region and then looking at individual gene expression profiles to find causation. This is critical in the discovery of new biomarkers for early prevention and diagnosis while also informing drug design and discovery at the genome level. 

### Analyzing MRI Imaging Data To Detect Inflammation

A convolutional neural network image segmentation model on brain MRI imaging data can be used to detect different regions of the brain. From there, a supervised artificial neural network model can detect which regions are inflamed and map the level of inflammation.

Although MRI imaging data is commonly used for diagnostic imaging, its imaging precision can be utilized for discovering inflammation in the brain through artificial intelligence. As a cost-efficient and common tool for viewing inflammation, thousands of these images are on-hand at hospitals, which will allow for accurate supervised learning models and an effective starting point for genomic analysis.

### Mapping Inflammation to Genetics

Next, data analysis on relations between [inflamed regions](https://human.brain-map.org/microarray/search/show?search_term=49&search_type=gene_classification&page_num=0), [genomic](https://human.brain-map.org/microarray/search/show?search_term=97&search_type=gene_classification&page_num=0), and [transcriptomic](https://human.brain-map.org/microarray/search/show?search_term=84&search_type=gene_classification) data was run. Scatterplots of gene expression of various brain functions are superimposed on one another to find which genes or transcripts are over- or underexpressed to cause inflammation in genetic pathways.

Since inflamed regions provide a quantitative tool of measurement, inflamed regions were mapped to genomic and transcriptomic markers for further analysis. Inflammation in the brain is an underresearched symptom of neurodegenerative diseases, which can be used to determine where Alzheimer's and other neurodegenerative diseases have affected the brain.

### Selecting Highly Important Features

Furthermore, [tSNE](https://medium.com/swlh/t-sne-explained-math-and-intuition-94599ab164cf) was used to visualize high-dimensional gene expression data into noticeable clusters in a dimensional plot to select specific genes from those that caused inflammation.

Due to the tens of gene and transcriptome markers connected to inflammation, feature selection allows researchers to select specific features for further individual analysis. Additionally, the tSNE visualization tool allows for viewing clusters for batch correction and reducing the dimensionality of the n-dimension feature matrix into two dimensions for viewing.

### Finding Statistically Significant Genes

Differential gene expression (DGE) through [DeSeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) and differential transcript expression (DTE) through [Kallisto](https://pachterlab.github.io/kallisto/) (transcript quantification) and [Sleuth](https://pachterlab.github.io/sleuth/about) can find statistically significant gene features for targeting specific genes for neurological diseases.

After finding specific features, features must be further analyzed for statistical significance to determine whether a specific gene had a significant enough expression to cause inflammation. For genes, DeSeq2 can provide this feature, while for transcripts, Sleuth can be utilized.

### Running Comparative Analysis Through Visualization

To identify potential transcription-level pathways responsible for neurodegenerative diseases, such as Alzheimer's, key biological pathways between inflammation and said diseases had to be identified. By first mapping the inflammatory gene expression levels against the neurodegenerative disorder expression profile, a set of 4 common genes with the exact same expression levels for a given donor were identified by leveraging high and low expression overlaps between both profiles. A confidence matrix was produced to evaluate the effectiveness of said genes given the overlap, and these showed the highest confidence across the datasets. 

The specific brain region tissue transcriptome profiles were observed to generate a trendline that described expression patterns for each gene. These trendlines are then used for the component analysis for the feature selection and provide more insight into which genes relate to which surrounding clusters with respect to the baseline confidence. 

The pathway can be thus used to infer which cluster of genes with respect to the overlapping disease and symptom area best relate with the ground-truth, which is then fed into an unsupervised classification model for clustering said genes into groups based on their expression level (positive or negative correlation with the ground-truth).

This workflow was segmented for all regions of the brain, and so novel insights can be derived for each individual section and with respect to its function. 

# Results and Discussion

![Screen Shot 2021-10-16 at 11.04.05 PM.png](Memo%200e30296069224924a52d9e1360f35b62/Screen_Shot_2021-10-16_at_11.04.05_PM.png)

![Screen Shot 2021-10-16 at 11.19.21 PM.png](Memo%200e30296069224924a52d9e1360f35b62/Screen_Shot_2021-10-16_at_11.19.21_PM.png)

![Screen Shot 2021-10-16 at 11.22.34 PM.png](Memo%200e30296069224924a52d9e1360f35b62/Screen_Shot_2021-10-16_at_11.22.34_PM.png)

This is identified by the upregulation of several genes in the hippocampal pathway in comparison to the occipital lobe pathway when looking at the overlap across the neurodegenerative and inflammation correlation. 

This indicates that genes GRB2, MAPK1, and PRKCG regulate inflammation and are highly expressed in the presence of neurodegenerative diseases, along with several other potential genes who cluster near the pathway trendline. 

![Screen Shot 2021-10-16 at 11.36.04 PM.png](Memo%200e30296069224924a52d9e1360f35b62/Screen_Shot_2021-10-16_at_11.36.04_PM.png)

The same trend showed true for the average expression levels for each gene relative to the area, with the range of expression for the most upregulated genes in the neurodegenerative and inflammation datasets for the hippocampal pathway were between 1.384 to 2.619. 

![Screen Shot 2021-10-16 at 11.33.06 PM.png](Memo%200e30296069224924a52d9e1360f35b62/Screen_Shot_2021-10-16_at_11.33.06_PM.png)

The results were obtained for 26 different parts of the brain, each oriented for the specific sequence of transcription. Inflammation in the occipital lobe had a low correlation with most if not all degenerative diseases (which coincides with common logic as Alzheimers does not affect this area) found in the tSNE clustering. However, for the hippocampal formation data, there was a strong correlation with clustered genes and the ground-truth, indicating that there is an early onset of gene expression in this region that directly correlates to AD.

![Screen Shot 2021-10-16 at 8.53.42 PM.png](Memo%200e30296069224924a52d9e1360f35b62/Screen_Shot_2021-10-16_at_8.53.42_PM.png)

In genomic studies, tSNE captures neighboring points in the input space in terms of their distance, clustering them together and making them neighbors in a two dimensional framework. The tSNE plots to the left show little to no relationship between different gene expression profiles in terms of the mapped regions inside of the brain. 

This shows that there is little to no correlation between gene expression between brain regions, in terms of over neurodegenerative disease and inflammation as well. This aligns well with the results shown above as there was little to no similarity in terms of gene expression profiles in the brain regions that were listed above.

# Impact

This study can allow for better-targeted treatments tackling Alzheimer's as researchers can understand the efficacy of certain genes in different parts of the brain through differential gene and transcript expression. Through our workflow outlined above, the scientists can:

- Run additional testing with modifications of the expressed genes (gene editing) to see if the targets restored brain function inside subjects.
- Run clinical experiments with our open-source code and workflow, circumventing dry lab testing (improves accessibility and affordability)

![Untitled](Memo%200e30296069224924a52d9e1360f35b62/Untitled.png)

Alzheimer's and other neurodegenerative disorders have continued to cost healthcare institutions and the world millions of dollars in direct and indirect costs. Additionally, it continues to be a leading cause in human suffering for 6.2 million people in America alone. While traditional drug discovery pipelines have continued to focus and even stagnate on key proteins and other kinds of targets, but have shown minimal results, it has become clear that learning more about the biological processes involved in the brain at the neurobiological level will be critical for the discovery of new targets and therapies aimed at reducing the strain of neurodegenerative diseases like Alzheimers. 

The study acts as a way to validate an optimized pipeline, designed to test and validate gene profiles for the discovery of new targets, given any hypothesis. In this instance, a focus on the connection between the innate immune system and Alzheimers was tested and validated using this experimental pipeline, and was able to find several key candidates for new genome-level drug molecule targets. 

Ultimately, to better understand the brain and the role that disease has on it, studies must observe and connect all parts of the brain at different resolutions. This study aims to connect the lowest-level of the human brain and its connection to neurodegenerative diseases by observing changes at the tissue and whole-brain level. 

### Further Research

Through additional MRI scans and gene expression data focused on other neurodegenerative diseases, this analysis can further be extended to disorders, like Parkinson's, a condition that over [10 million](https://www.parkinson.org/Understanding-Parkinsons/Statistics) face but still has only been explored on how symptoms can be improved (e.g. looking on improving [motor control](https://www.mayoclinic.org/diseases-conditions/parkinsons-disease/symptoms-causes/syc-20376055) issues with the symptoms of Parkinson's through the release of dopamine as a transmitter).

Further calculations can be conducted to see the average expression level of a gene based on its frequency and range in a specific tissue instance, and that normalization procedure would ultimately yield a cleaner trendline that better describes the gene expression activity responsible for higher inflammation. Certainly, other datasets can be used to validate this hypothesis for clinical purposes (i.e. amyloid plaque and tau tangles alzheimers datasets). 

Key research and discovery bottlenecks need to be met with the ability to rapidly prototype new gene profiles and build models that accurately reflect neurodegenerative disease progression at different resolutions. Our study showcases the benefit of being able to realize this process in the case for connecting immune responses in the brain to the progression of Alzheimer's, which can play a key role in assessing, diagnosing, and even predicting new targets. The choice of the transcriptome to evaluate gene expression levels was chosen to increase the transferrability of information to a traditional drug discovery pipeline that can incoporate findings in the pipeline with higher-level imaging processes (ie. linkage of protein to connectome). Inherently, the majority of phenotype-genotype interactions are built on cellular profiles, so having the ability to analyze what specific processes are at play in a given cell (in this instance, the dendritic cells of each tissue sample), one can effectively build causal relationships across different resolutions of the brain. 

The majority of neurodegenerative disorders have no definitive testing mechanism that carefully evaluates the quantitative biological markers responsible for the disease. Ultimately, the holy grail of treatment is really any novel biomarkers that we can find. These reliable biomarkers, which are often needed to be abnormal, visible, and testible with high confidence accelerate the ability for the healthcare industry to provide care while the data collected can be used by biotech to produce meaningful therapies and interventions. The only biomarkers which match these constraints fall at the genome level, whereas the logistical requirements need to be satisfied by brain imaging. Connecting the incidence of both phenotypic and genotypic data satisfies both parts of the field, and can only be done with precision through the use of modern machine learning models in vision and the temporal nature of gene expression while allowing new models to build layers of understanding above for data on molecules, cells, and other pathways.
