# assist

Quick code assist for basic R. assist opens a Viewer pane with a menu to execute code. Currently it only has one command implemented: Data > Describe.

## describe command

The describe command creates a data frame with the most basic summary statistics. The syntax is describe(df, ...) where the additional arguments are as described in the dplyr select command.

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
assist() opens a viewer pane dialog box. Selecting fields and completing currently only posts a message with a command.

// old_assist() opens assist pages in the RStudio viewer pane. To use, copy and paste code into the editor.

## Developing

Pages were developed with markdown. To modify code, edit the /vignettes/*.Rmd files.  Build with commands:

```
devtools::build()
devtools::build_vignettes()
devtools::install()
```
