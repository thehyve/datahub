This study contains geneset data calculated with gene set analysis described on the [cbioportal-gsva-analysis GitHub page](https://github.com/thehyve/cbioportal-gsva-analysis).

Gene set scores are calculated for the Hallmark and Oncogenic gene sets (C6) collections from [MSigDB](http://software.broadinstitute.org/gsea/msigdb) (version 6.1).

To load this study with geneset data the genesets should be imported into your cBioPortal instance:
- If your cBioPortal instance has a [seed database](https://github.com/cBioPortal/datahub/tree/master/seedDB) version 2.6.0 or higher the genesets are present
- Otherwise genesets can be loaded by using the provided gmt and yaml file in this folder, see documentation about loading in the [cBioPortal docs](https://github.com/cBioPortal/cbioportal/blob/master/docs/Import-Gene-Sets.md)