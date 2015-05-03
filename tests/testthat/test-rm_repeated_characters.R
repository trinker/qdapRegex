context("Checking rm_repeated_characters")

test_that("rm_repeated_characters is removing/replacing character strings",{

    x <- "aaaahahahahaha that was a good joke peep and pepper and pepe"
    expect_equal(
        rm_repeated_characters(x),
        "that was a good joke peep and pepper and"
    )
    
})

test_that("rm_repeated_characters is extracting repeated character strings",{

    x <- "aaaahahahahaha that was a good joke peep and pepper and pepe"
    expect_equal(
        rm_repeated_characters(x, extract=TRUE),
        structure(list(c("aaaahahahahaha", "pepe")), class = c("extracted", 
            "list"))
    )
    
})

