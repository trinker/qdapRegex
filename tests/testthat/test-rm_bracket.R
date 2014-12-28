context("Checking rm_bracket")

test_that("rm_bracket is removing bracketed text",{

    examp <- structure(list(person = structure(c(1L, 2L, 1L, 3L),
        .Label = c("bob", "greg", "sue"), class = "factor"), text =
        c("I love chicken [unintelligible]!",
        "Me too! (laughter) It's so good.[interrupting]",
        "Yep it's awesome {reading}.", "Agreed. {is so much fun}")), .Names =
        c("person", "text"), row.names = c(NA, -4L), class = "data.frame")
    
    expect_equivalent(rm_bracket(examp$text, pattern = "square"), 
    	c("I love chicken !", "Me too! (laughter) It's so good.", 
    		"Yep it's awesome {reading}.", "Agreed. {is so much fun}"))
        
    expect_equivalent(rm_bracket(examp$text, pattern = "curly"), 
    	c("I love chicken [unintelligible]!", 
    		"Me too! (laughter) It's so good.[interrupting]", 
    		"Yep it's awesome .", "Agreed."))
        
    expect_equivalent(rm_bracket(examp$text, pattern = c("square", "round")), 
    	c("I love chicken !", "Me too! It's so good.", 
    		"Yep it's awesome {reading}.", "Agreed. {is so much fun}"))
        
    expect_equivalent(rm_bracket(examp$text), 
    	c("I love chicken !", "Me too! It's so good.", "Yep it's awesome .",
    		"Agreed."))
        
})


test_that("rm_bracket is extracting bracketed text",{
    
    examp <- structure(list(person = structure(c(1L, 2L, 1L, 3L),
        .Label = c("bob", "greg", "sue"), class = "factor"), text =
        c("I love chicken [unintelligible]!",
        "Me too! (laughter) It's so good.[interrupting]",
        "Yep it's awesome {reading}.", "Agreed. {is so much fun}")), .Names =
        c("person", "text"), row.names = c(NA, -4L), class = "data.frame")    
   
    expect_equivalent(rm_bracket(examp$text, extract=TRUE, pattern = "square"), 
    	list("unintelligible", "interrupting", NA_character_, NA_character_))
        
    expect_equivalent(rm_bracket(examp$text, extract=TRUE, pattern = "curly"), 
    	list(NA_character_, NA_character_, "reading", "is so much fun"))
        
    expect_equivalent(rm_bracket(examp$text, extract=TRUE, pattern = c("square", "round")), 
    	list("unintelligible", c("laughter", "interrupting"), NA_character_, 
    NA_character_))
        
    expect_equivalent(rm_bracket(examp$text, extract=TRUE, pattern = c("square", "round")), 
    	list("unintelligible", c("laughter", "interrupting"), NA_character_, 
        NA_character_))
    
    expect_equivalent(rm_bracket(examp$text, extract=TRUE), 
    	list("unintelligible", c("laughter", "interrupting"), "reading", 
    "is so much fun"))
        
    expect_equivalent(rm_bracket(examp$text, include.markers = TRUE, extract=TRUE), 
    	list("[unintelligible]", c("(laughter)", "[interrupting]"), "{reading}", 
    "{is so much fun}"))       
    
})


test_that("rm_round is removeing/extracting bracketed text",{

    x <- "I like [bots] (not). And <likely> many do not {he he}"
    
    expect_equivalent(rm_round(x), "I like [bots] . And <likely> many do not {he he}")
    expect_equivalent(rm_round(x, extract = TRUE), list("not"))
    
    expect_equivalent(rm_round(x, include.marker = FALSE), 
        "I like [bots] (). And <likely> many do not {he he}")
    
    expect_equivalent(rm_round(x, extract = TRUE, include.marker = TRUE), list("(not)"))
    
})


test_that("rm_square is removeing/extracting bracketed text",{

    x <- "I like [bots] (not). And <likely> many do not {he he}"
    
    expect_equivalent(rm_square(x),  "I like (not). And <likely> many do not {he he}")
    expect_equivalent(rm_square(x, extract = TRUE), list("bots"))

})

test_that("rm_curly is removeing/extracting bracketed text",{

    x <- "I like [bots] (not). And <likely> many do not {he he}"
    
    expect_equivalent(rm_curly(x), "I like [bots] (not). And <likely> many do not")
    expect_equivalent(rm_curly(x, extract = TRUE), list("he he"))
    
})

test_that("rm_angle is removeing/extracting bracketed text",{

    x <- "I like [bots] (not). And <likely> many do not {he he}"
    
    expect_equivalent(rm_angle(x), "I like [bots] (not). And many do not {he he}")
    expect_equivalent(rm_angle(x, extract = TRUE), list("likely"))
    
})
