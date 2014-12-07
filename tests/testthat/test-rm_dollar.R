context("Checking rm_dollar")

test_that("rm_dollar is removing dollar strings",{


    x <- c("There is $5.50 for me.", "that's 45.6% of the pizza",
        "14% is $26 or $25.99")
    
    x2 <- c("There is for me.", "that's 45.6% of the pizza", "14% is or")

    expect_equivalent(rm_dollar(x), x2)
	
})


test_that("rm_dollar is extracting dollar strings",{

    x <- c("There is $5.50 for me.", "that's 45.6% of the pizza",
        "14% is $26 or $25.99")
    
    x3 <- list("$5.50", NA_character_, c("$26", "$25.99"))

    expect_equivalent(rm_dollar(x, extract=TRUE), x3)
})


