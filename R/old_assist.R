assist <- function(helpfile) {
  # Make class to avoid repeated creation of tempdir
  tempDir <- tempfile()
  dir.create(tempDir)

  helpfiles <- list.files("inst/doc/", ".html$", full.names = TRUE)
  file.copy(helpfiles, tempDir)
  htmlFile <- file.path(tempDir, "assist.html")

  # Only code required, if htmlFile is saved to class.
  rstudioapi::viewer(htmlFile)
}
