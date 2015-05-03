context("Checking rm_non_words")

test_that("rm_non_words is removing non-words",{

    x <- c(
        "I like 56 dogs!",
        "It's seventy-two feet from the px290.",
        NA,
        "What",
        "that1is2a3way4to5go6.",
        "What do you*% want?  For real%; I think you'll see.",
        "Oh some <html>code</html> to remove"
    )

    expect_equal(rm_non_words(x),
        c("I like dogs", "It's seventy two feet from the px", NA, "What", 
            "that is a way to go", "What do you want For real I think you'll see", 
            "Oh some html code html to remove")
    )
})

test_that("rm_non_words is extracting tag strings",{

    x <- c(
        "I like 56 dogs!",
        "It's seventy-two feet from the px290.",
        NA,
        "What",
        "that1is2a3way4to5go6.",
        "What do you*% want?  For real%; I think you'll see.",
        "Oh some <html>code</html> to remove"
    )
    
    expect_equal(rm_non_words(x, extract=TRUE),
        structure(list(c(" ", " 56 ", "!"), c(" ", "-", " ", " ", " ", 
              " ", "290."), NA_character_, NA_character_, c("1", "2", "3", 
              "4", "5", "6."), c(" ", " ", "*% ", "?  ", " ", "%; ", " ", " ", 
              " ", "."), c(" ", " <", ">", "</", "> ", " ")), class = c("extracted", 
              "list"))
    )

})

