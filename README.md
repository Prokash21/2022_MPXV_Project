# Identification of Potential Biomarkers for 2022 Mpox Virus Infection: A Transcriptomic Network Analysis and Machine Learning Approach

## Overview
This project focuses on analyzing microarray and RNA-Seq data to identify differentially expressed genes (DEGs) and validate them using machine learning techniques. The workflow includes data extraction, normalization, DEG identification, and machine learning validation, supported by various visualizations like volcano plots, PCA, t-SNE, and ROC curves.

## Workflow

### 1. Data Extraction
- Data was retrieved from the NCBI GEO repository.
- Relevant samples and conditions were selected based on predefined criteria.

### 2. Data Preprocessing
- **Normalization**: Performed to ensure comparability across samples.
- **Outlier Removal**: Removed to improve data quality.

### 3. Differential Expression Analysis
- **Microarray Data**: 
  - Used the `limma` package for DEG analysis.
- **RNA-Seq Data**: 
  - Performed using the `DESeq2` package.
- **Log Fold Change (LFC)**: 
  - Calculated for DEGs and visualized using volcano plots.

### 4. Machine Learning Validation
- **Feature Selection**:
  - DEGs were further filtered using `PyCaret`, selecting the top 10 features (genes).
  - Visualized using PCA and t-SNE plots.
- **Model Evaluation**:
  - Evaluated using ROC curve analysis to validate predictive performance.
- **Biomarker Discovery**:
  - Identified six key biomarkers associated with the 2022 MPXV infection, validated through machine learning models.

## ⚙️ Running the Analysis

### 🔍 **ML_model Folder**

1. **Run Python and R Scripts for Machine Learning**:
   - **Jupyter Notebook** (`1_Pycrate.ipynb`):
     - Open and run the cells in a Jupyter environment.
   - **R Scripts** for **PCA**, **t-SNE**, and **ROC**:
     ```
     Rscript 2_tSNE.R
     Rscript 3_PCA.R
     Rscript 4_pROC.R
     ```

---

### 🧪 **Microarray Folder**

1. **Run R Scripts for Microarray Data Analysis**:
   - Required Packages: `affy`, `limma`, `GEOquery`, `ggplot2`
   - **Run**:
     ```
     Rscript 1_Expression_MicroArray.R
     Rscript 2_UmapPlot_MicroArray.R
     Rscript 3_TopTable_MicroArray.R
     Rscript 5_DEGs_Identification_MicroArray.R
     ```

---

### 🧬 **RNA_Seq Folder**

1. **Run R Scripts for RNA-Seq Data Analysis**:
   - Required Packages: `DESeq2`, `ggplot2`, `data.table`, `tidyverse`
   - **Run**:
     ```
     Rscript 1_install_packages.R
     Rscript 2_load_data.R
     Rscript 3_PCA.R
     Rscript 4_DGE_Normalization.R
     Rscript 5_DGE_LFC.R
     Rscript 6_volcano.R
     ```

---

## 📦 Dependencies

### R Packages:
- `limma` v3.54.2
- `DESeq2` v1.38.3
- `VennDiagram` v1.7.3
- `GOplot` v1.0.2
- `corrplot` v0.92
- `TBtools-II` v2.097
- `Rtsne` v0.17
- `pROC` v1.18.5
- `randomForest` v4.7.1.1
- `ggplot2` v3.5.1

### Python Libraries:
- `PyCaret` v3.3.2
- `Pandas` v2.1.4
- `SciPy` v1.11.4
- `Joblib` v1.3.2
- `Scikit-Learn` v1.4.2
- `Sktime` v0.26.0
- `Pmdarima` v2.0.4
- `XGBoost`
- `LightGBM`

---

## 📞 Contact
For any questions or issues, please contact:
1. [joyprokash77@student.sust.edu](mailto:joyprokash77@student.sust.edu)
2. [Kabir56@student.sust.edu](mailto:Kabir56@student.sust.edu)
3. [preonath@chrfbd.org](mailto:preonath@chrfbd.org)
