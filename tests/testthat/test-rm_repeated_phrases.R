context("Checking rm_repeated_phrases")

test_that("rm_repeated_phrases is removing/replacing repeated phrases strings",{

    x <- c(
        "this is a big is a Big deal",
        "I want want to see",
        "I want, want to see",
        "I want...want to see see see how",
        "I like it. It is cool",
        "this is a big is a Big deal for those of, those of you who are."
    )
    
    expect_equal(
        rm_repeated_phrases(x),
        c("this deal", "I to see", "I to see", "I to how", 
            "I like it. It is cool", "this deal for you who are.")
    )
        
})

test_that("rm_repeated_phrases is extracting repeated phrases strings",{

    x <- c(
        "this is a big is a Big deal",
        "I want want to see",
        "I want, want to see",
        "I want...want to see see see how",
        "I like it. It is cool",
        "this is a big is a Big deal for those of, those of you who are."
    )
    
    expect_equal(
        rm_repeated_phrases(x, extract=TRUE),
        structure(list("is a big is a Big", "want want", "want, want", 
            c("want...want", "see see see"), NA_character_, c("is a big is a Big", 
            "those of, those of")), class = c("extracted", "list"))
    )
    
})
