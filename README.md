
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dnaRt

<!-- badges: start -->

<!-- badges: end -->

Artistieke visualisatie van DNA-sequenties uit FASTA/FNA files in
verschillende plots.

## Installation

You can install the development version of dnaRt from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("oumaimaanbari/dnaRt", dependencies = TRUE, build_vignettes = TRUE)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(dnaRt)

fasta_path <- tempfile(fileext = ".fasta")
cat(">test\nATGCGTACGTAGC\n", file = fasta_path)
dna_tile(fasta_path)
```

<img src="man/figures/README-example-1.png" width="100%" />

Bekijk de vignette voor andere opties en de adjustable parameters zoals
kleur en grootte met `vignette("dnaRt")` na het volgen van installatie
bovenaan in deze README.
