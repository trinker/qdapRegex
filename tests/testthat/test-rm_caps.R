context("Checking rm_caps")

test_that("rm_caps is removing 'all caps' strings",{

    x <- c("UGGG! When I use caps I am YELLING!")
    
    x2 <- "! When I use caps I am !" 
	x3 <- "uggg! When I use caps I am yelling!"


    expect_equivalent(rm_caps(x), x2)
	expect_equivalent(rm_caps(x, replacement="\\L\\1"), x3)
	
})


test_that("rm_caps is extracting 'all caps' strings",{

    x <- c("UGGG! When I use caps I am YELLING!")
    
    x4 <- list(c("UGGG", "YELLING"))

    expect_equivalent(rm_caps(x, extract=TRUE), x4)
})


