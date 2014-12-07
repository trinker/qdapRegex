context("Checking rm_caps_phrase")

test_that("rm_caps_phrase is removing 'all caps' strings",{

    x <- "or trying to ake a LITTLE SEEM like IT ISN'T LITTLE"

    x2 <- "or trying to ake a like" 

    expect_equivalent(rm_caps_phrase(x), x2)
	
})


test_that("rm_caps_phrase is extracting 'all caps' strings",{

    x <- "or trying to ake a LITTLE SEEM like IT ISN'T LITTLE"
    
    x3 <- list(c("LITTLE SEEM ", "IT ISN'T LITTLE"))

    expect_equivalent(rm_caps_phrase(x, extract=TRUE), x3)
})


