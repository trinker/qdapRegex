context("Checking rm_nchar_words")

test_that("rm_nchar_words is removing/replacing nchar_words strings",{

    x <- "This Jon's dogs' 'bout there in word Mike's re'y."
    
    x2 <- "there in Mike's re'y."

    expect_equivalent(rm_nchar_words(x, 4), x2)	
	
})


test_that("rm_nchar_words is extracting nchar_words strings",{

    x <- "This Jon's dogs' 'bout there in word Mike's re'y."

    x3 <- list(c("This", "Jon's", "dogs'", "'bout", "word")) 

    expect_equivalent(rm_nchar_words(x, 4, extract=TRUE), x3)
})


