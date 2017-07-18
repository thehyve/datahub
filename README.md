# Datahub: including GSVA results
This separate branch of the datahub repository contains the public cBioPortal studies which include for some studies Gene Set Data, in this case from GSVA ([GSVA, Hänzelmann, 2013](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-14-7)). The GSVA scores can be used to see if groups of genes (gene sets) are up- or down regulated for example. These groups of genes could for example be a pathway. A GSVA score is calculated per sample per gene set. 

The studies with GSVA scores are ready to be imported in a separate version of cBioPortal: <https://github.com/thehyve/cbioportal/tree/gsva_cbio>. 

Behind the scenes git-lfs is used to manage the large files: <https://github.com/git-lfs/git-lfs>. This needs to be installed to checkout the data. 

## Work in progress
* Current p-values for the GSVA scores are dummy p-values. A method is currently being developed to give a p-value to each GSVA score to represent the robustness of the score. For now, the data can be loaded with the dummy p-value file.

* Not all public datasets have processed GSVA results, will be continued. 

