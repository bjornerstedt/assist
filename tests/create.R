# Used to create vignettes directory.
# devtools::use_vignette("index")

# Edit vignettes/dplyr-help.Rmd

devtools::build()
devtools::build_vignettes()
devtools::install()
#vignette(, package = "assist")
library(assist)
assist()
