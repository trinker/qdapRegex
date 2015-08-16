context("Checking explain")

test_that("explain produces a character vector",{

    m <- explain("(?<=foo)\\s+\\(\\d{4}\\)")
    expect_true(is.character(m))
    #expect_true(length(as.character(m)) > 8)
    
})


