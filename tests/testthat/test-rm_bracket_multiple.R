context("Checking rm_bracket_multiple")

test_that("rm_bracket_multiple is removing bracketed text",{

    examp <- structure(list(person = structure(c(1L, 2L, 1L, 3L),
        .Label = c("bob", "greg", "sue"), class = "factor"), text =
        c("I love chicken [unintelligible]!",
        "Me too! (laughter) It's so good.[interrupting]",
        "Yep it's awesome {reading}.", "Agreed. {is so much fun}")), .Names =
        c("person", "text"), row.names = c(NA, -4L), class = "data.frame")
    
    expected1 <- list(c("I love chicken!", "Me too! (laughter) It's so good.", 
    "Yep it's awesome {reading}.", "Agreed. {is so much fun}"), 
        c("I love chicken [unintelligible]!", "Me too! (laughter) It's so good. [interrupting]", 
        "Yep it's awesome.", "Agreed."), c("I love chicken!", "Me too! It's so good.", 
        "Yep it's awesome {reading}.", "Agreed. {is so much fun}"
        ), c("I love chicken!", "Me too! It's so good.", "Yep it's awesome.", 
        "Agreed."))
    
    expect_equivalent(rm_bracket_multiple(examp$text, pattern = "square"), expected1[[1]])
    expect_equivalent(rm_bracket_multiple(examp$text, pattern = "curly"), expected1[[2]])
    expect_equivalent(rm_bracket_multiple(examp$text, pattern = c("square", "round")), expected1 [[3]])
    expect_equivalent(rm_bracket_multiple(examp$text), expected1 [[4]])
})


test_that("rm_bracket_multiple is extracting bracketed text",{
    
    examp <- structure(list(person = structure(c(1L, 2L, 1L, 3L),
        .Label = c("bob", "greg", "sue"), class = "factor"), text =
        c("I love chicken [unintelligible]!",
        "Me too! (laughter) It's so good.[interrupting]",
        "Yep it's awesome {reading}.", "Agreed. {is so much fun}")), .Names =
        c("person", "text"), row.names = c(NA, -4L), class = "data.frame")    

    expected2 <- list(structure(list(square1 = "unintelligible", square2 = "interrupting", 
            square3 = character(0), square4 = character(0)), .Names = c("square1", 
        "square2", "square3", "square4")), structure(list(curly1 = character(0), 
            curly2 = character(0), curly3 = "reading", curly4 = "is so much fun"), .Names = c("curly1", 
        "curly2", "curly3", "curly4")), list("unintelligible", c("interrupting", 
        "laughter"), character(0), character(0)), structure(list(square = list(
            "unintelligible", "interrupting", character(0), character(0)), 
            round = list(character(0), "laughter", character(0), character(0))), .Names = c("square", 
        "round")), structure(list(all1 = "unintelligible", all2 = c("laughter", 
        "interrupting"), all3 = "reading", all4 = "is so much fun"), .Names = c("all1", 
        "all2", "all3", "all4")), structure(list(all1 = "[unintelligible]", 
            all2 = c("(laughter)", "[interrupting]"), all3 = "{reading}", 
            all4 = "{is so much fun}"), .Names = c("all1", "all2", "all3", 
        "all4")), "reading is so much fun")
    
    expect_equivalent(rm_bracket_multiple(examp$text, extract=TRUE, pattern = "square"), expected2[[1]])
    expect_equivalent(rm_bracket_multiple(examp$text, extract=TRUE, pattern = "curly"), expected2[[2]])
    expect_equivalent(rm_bracket_multiple(examp$text, extract=TRUE, pattern = c("square", "round")), expected2 [[3]])
    expect_equivalent(rm_bracket_multiple(examp$text, extract=TRUE, pattern = c("square", "round"), merge = FALSE), expected2 [[4]])
    expect_equivalent(rm_bracket_multiple(examp$text, extract=TRUE), expected2[[5]])
    expect_equivalent(rm_bracket_multiple(examp$text, include.markers = TRUE, extract=TRUE), expected2[[6]])
    
})
