context("Checking rm_number")

test_that("rm_number is removing 'all number' strings",{

    x <- c("-2 is an integer.  -4.3 and 3.33 are not.",
        "123,456 is alot mor than -.2", 
        "hello world -.q")

    x2 <- c("is an integer. and are not.", "is alot mor than", "hello world -.q"
        )

    expect_true(identical(rm_number(x), x2))
	
})


test_that("rm_number is extracting 'all number' strings",{
	
    x <- c("-2 is an integer.  -4.3 and 3.33 are not.",
        "123,456 is alot mor than -.2", 
        "hello world -.q")
    
    x3 <- list(c("-2", "-4.3", "3.33"), c("123,456", "-.2"), NA_character_)

    expect_true(identical(rm_number(x, extract=TRUE), x3))
})


