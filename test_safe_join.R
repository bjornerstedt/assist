library(assist)

context("Test safe_join")


test_that("Test errors", {
    df1 = data_frame(key = 1:5, val1 = 1:5)
    df2 = data_frame(key = c(1,2,6), val2 = c(11, 12, 61))
    df2a = data_frame(key = c(1,1,6), val2 = c(11, 12, 61))
    df2b = data_frame(key = c(1,1,6), val2 = c(11, 12, 61))
    jdf = left_join(df1, df2, by = "key")
    jdfs = safe_join(df1, df2, by = "key")
    
    
    expect_error( safe_join(df1, df2b, by = "key") )
    
})