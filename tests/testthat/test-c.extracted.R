context("Checking c.extracted")

test_that("c.extracted unlists",{

    x <- structure(list(NA_character_, "45.6%", "14%"), class = c("extracted", 
        "list"))

    expect_equivalent(c(x), c(NA, "45.6%", "14%"))    

})

