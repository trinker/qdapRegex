context("Checking rm_number")

test_that("rm_number is removing 'all number' strings",{

    x <- c("-2 is an integer.  -4.3 and 3.33 are not.",
        "123,456 is 0 alot -123456 more than -.2", "and 3456789123 fg for 345.",
        "fg 12,345 23 .44 or 18.", "don't remove this 444,44", "hello world -.q")

    x2 <- c("is an integer. and are not.", "is alot more than", "and fg for .", 
        "fg or .", "don't remove this 444,44", "hello world -.q")


    expect_equivalent(rm_number(x), x2)
	
})


test_that("rm_number is extracting 'all number' strings",{
	
    x <- c("-2 is an integer.  -4.3 and 3.33 are not.", "another 1,456,123.5 one",
        "and still 1,456,123",
        "123,456 is 0 alot -123456 more than -.2", "and 3456789123 fg for 345.",
        "fg 12,345 23 .44 or 18.", "don't remove this 444,44", "hello world -.q")
    
    x3 <- structure(list(c("-2", "-4.3", "3.33"), "1,456,123.5", "1,456,123", 
        c("123,456", "0", "-123456", "-.2"), c("3456789123", "345"), 
        c("12,345", "23", ".44", "18"), NA_character_, NA_character_), 
        class = c("extracted", "list"))

    expect_equivalent(rm_number(x, extract=TRUE), x3)
})


