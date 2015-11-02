# assist
Quick code assist for basic R. assist opens a Viewer pane with a menu to execute code. Currently it can run the "shiny-dialog" app or the "shiny-menu" app.

## shiny-dialog

A basic dialog box that detects data frames and variables in these and helps to select. 

## shiny-menu

Displays a non-functional menubar.

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

old_assist() opens assist pages in the RStudio viewer pane. To use, copy and paste code into the editor.

## Developing

Pages were developed with markdown. To modify code, edit the /vignettes/*.Rmd files.  Build with commands:

```
devtools::build()
devtools::build_vignettes()
devtools::install()
```
