context("Checking rm_endmark")

test_that("rm_endmark is removing/replacing emoticon strings",{

    x <- c("I like the dog.", "I want it *|", "I;", 
        "Who is| that?", "Hello world", "You...")

	x2 <- c("I like the dog", "I want it", "I;", "Who is| that", "Hello world", 
		"You")

    expect_equivalent(rm_endmark(x), x2)

})


test_that("rm_endmark is extracting emoticon strings",{

    x <- c("I like the dog.", "I want it *|", "I;", 
        "Who is| that?", "Hello world", "You...")

    x3 <- list(".", "*|", NA_character_, "?", NA_character_, "...")

    expect_equivalent(rm_endmark(x, extract=TRUE), x3)
})


