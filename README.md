<<<<<<< HEAD
#Decoding the Unique Gene Signatures Upon 2022 MPXV Infection: Predictive Biomarkers and Drug Targets #via Transcriptomic Network Analysis and Machine Learning Models

##Overview
This project involves the comprehensive analysis of both microarray and RNA-Seq data to identify differentially expressed genes (DEGs) and validate these genes using machine learning techniques. The analysis includes data extraction, normalization, DEG identification, and machine learning validation, with visualizations like volcano plots, PCA, t-SNE, and ROC curves.

##Workflow
=======
Decoding the Unique Gene Signatures Upon 2022 MPXV Infection: Predictive Biomarkers and Drug Targets via Transcriptomic Network Analysis and Machine Learning Models

Overview
This project involves the comprehensive analysis of both microarray and RNA-Seq data to identify differentially expressed genes (DEGs) and validate these genes using machine learning techniques. The analysis includes data extraction, normalization, DEG identification, and machine learning validation, with visualizations like volcano plots, PCA, t-SNE, and ROC curves.

Workflow
>>>>>>> origin/main

1. Data Extraction
We obtained the microarray and RNA-Seq datasets from the NCBI Gene Expression Omnibus (GEO) repository.
Based on predefined criteria, we selected relevant samples and conditions for analysis.

2. Data Preprocessing
Normalization: The data was normalized to ensure comparability across samples.
Outlier Removal: Outliers were identified and removed to enhance data quality.

3. Differential Expression Analysis
Microarray Data:
We used the limma package to identify differentially expressed genes (DEGs).
RNA-Seq Data:
The DESeq2 package was employed to perform DEG analysis.
Log Fold Change (LFC):
LFC values were calculated for the DEGs, and results were visualized using volcano plots.

4. Machine Learning Validation
Feature Selection:
DEGs identified through functional analysis were further screened using PyCaret to select the best-fitting model.
The top 10 features (genes) were visualized using PCA and t-SNE plots.

<<<<<<< HEAD
###Model Evaluation:
The selected features were evaluated and cross-validated using ROC curve analysis to assess their predictive performance.

###Biomarker Discovery:
=======
Model Evaluation:
The selected features were evaluated and cross-validated using ROC curve analysis to assess their predictive performance.

Biomarker Discovery:
>>>>>>> origin/main
Finally, we identified 6 key biomarkers associated with the 2022 MPXV (Monkeypox Virus) infection. These biomarkers were validated through rigorous machine learning models and ROC analysis, confirming their potential role in MPXV infection.

Contact
For any questions or issues, please contact 
1. [Link text](joyprokash77@student.sust.edu)
2. [Link text](Kabir56@student.sust.edu)


