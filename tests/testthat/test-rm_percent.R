context("Checking rm_percent")

test_that("rm_percent is removing/replacing percent strings",{

    x <-  c("There is $5.50 for me.", "that's 45.6% of the pizza",
        "14% is $26 or $25.99")
    
    x2 <- c("There is $5.50 for me.", "that's of the pizza", "is $26 or $25.99"
        )

    expect_equivalent(rm_percent(x), x2)	
	
})


test_that("rm_percent is extracting percent strings",{

    x <-  c("There is $5.50 for me.", "that's 45.6% of the pizza",
        "14% is $26 or $25.99")
	
    x3 <- list(NA_character_, "45.6%", "14%")

    expect_equivalent(rm_percent(x, extract=TRUE), x3)
})


