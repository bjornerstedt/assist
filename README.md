# assist
Quick code assist for basic R. Testing user documentation in R packages with help files and vignettes.

The package provides basic code fragments and links to relevant sites.

## Installation

Use devtools to download and install the assist package:

```
install.packages("devtools")
devtools::install_github("bjornerstedt/assist", build_vignettes = TRUE)
```
## Using
```
library(assist)
assist()
```
Opens browser with code snippets.

## Developing

Pages were developed with markdown. To modify code, edit the /vignettes/*.Rmd files.  Build with commands:

```
devtools::build()
devtools::build_vignettes()
devtools::install()
```
