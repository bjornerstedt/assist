library(assist)
context("Test describe")

test_that("describe cars", {
  df = describe(cars)
  expect_equal(df$min[1], 4)
})
