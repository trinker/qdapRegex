context("Checking rm_repeated_words")

test_that("rm_repeated_words is removing/replacing repeated word strings",{

    x <- c(
        "this is a big is a Big deal",
        "I want want to see",
        "I want, want to see",
        "I want...want to see see see how",
        "I like it. It is cool",
        "this is a big is a Big deal for those of, those of you who are."
    )
    
    expect_equal(
        rm_repeated_words(x),
        c("this is a big is a Big deal", "I to see", "I want, want to see", 
            "I want...want to see how", "I like it. It is cool", 
            "this is a big is a Big deal for those of, those of you who are."
        )
    )
    
})

test_that("rm_repeated_words is extracting repeated word strings",{

    x <- c(
        "this is a big is a Big deal",
        "I want want to see",
        "I want, want to see",
        "I want...want to see see see how",
        "I like it. It is cool",
        "this is a big is a Big deal for those of, those of you who are."
    )
    
    expect_equal(
        rm_repeated_words(x, extract=TRUE),
        structure(list(NA_character_, "want want", NA_character_, "see see", 
            NA_character_, NA_character_), class = c("extracted", "list"
        ))
    )
    
})

