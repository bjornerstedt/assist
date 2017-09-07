library(assist)

context("Test describe")

test_that("describe cars", {
  df = assist::describe(ggplot2::diamonds)
  expect_equal(df$N[1], 53940)
  expect_equal(df$mean[6], 3932.800)
})
