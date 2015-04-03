context("Checking rm_caps_phrase")

test_that("rm_caps_phrase is removing 'all caps' strings",{

    x <- "or trying to make a LITTLE SEEM like IT ISN'T LITTLE"

    x2 <- "or trying to make a like" 

    expect_equivalent(rm_caps_phrase(x), x2)
	
})


test_that("rm_caps_phrase is extracting 'all caps' strings",{

    x <- c("UGGG! When I use caps I am YELLING!",
       "Or it may mean this is VERY IMPORTANT!",
       "or trying to make a LITTLE SEEM like IT ISN'T LITTLE",
       "I AM doing it.", ".-T A",
       "U I done"
    )

    
    x3 <- list(c("UGGG", "YELLING"), "VERY IMPORTANT", c("LITTLE SEEM", 
        "IT ISN'T LITTLE"), "I AM", "-T A", "U I")


    expect_equivalent(rm_caps_phrase(x, extract=TRUE), x3)
})


