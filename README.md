# MEP_r scripts
R package(s) for reproducibility and efficiency of microbiome analyses.

## Motivation
To simplify analysis of REDCap exports for metadata analyses and summaries, statistical analysis, and vizualization, our most commonly used R functions from the MEP are stored in this repo.

## Description by function
- **get_prefix:** provided a list of sample names, a delimiter, and option to include human microbiome project (HMP) standard prefix of SRS, a list of unique prefixes is produced that can be used for analysis by prefix.

- **bracken_clean:** provided the output tables from the combine output script from bracken, clean based on minimum abundance, sample names, and taxonomic names.

## Installation
1. Install devtools:

```R
install.packages("devtools")
```

2. Load devtools:

```R
library(devtools)
```

3. Install MEP_r package:

```R
install_github("michaelwoodworth/MEP_r")
```