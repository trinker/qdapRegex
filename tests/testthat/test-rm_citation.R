context("Checking rm_citation")

test_that("rm_citation is removing citation strings",{

    x <- c("Hello World (V. Raptor, 1986) bye",
        "Narcissism is not dead (Rinker, 2014)",
        "The R Core Team (2014) has many members.",
        paste("Bunn (2005) said, \"As for elegance, R is refined, tasteful, and",
            "beautiful. When I grow up, I want to marry R.\""),
        "It is wrong to blame ANY tool for our own shortcomings (Baer, 2005).",
        "Wickham's (in press) Tidy Data should be out soon.",
        "Rinker's (n.d.) dissertation not so much.",
        "I always consult xkcd comics for guidance (Foo, 2012; Bar, 2014).",
        "Uwe Ligges (2007) says, \"RAM is cheap and thinking hurts\""
    )


    
    x2 <- c("Hello World () bye", "Narcissism is not dead ()", "has many members.", 
        "said, \"As for elegance, R is refined, tasteful, and beautiful. When I grow up, I want to marry R.\"", 
        "It is wrong to blame ANY tool for our own shortcomings ().", 
        "Tidy Data should be out soon.", "dissertation not so much.", 
        "I always consult xkcd comics for guidance (; ).", "says, \"RAM is cheap and thinking hurts\""
        )

    expect_equal(rm_citation(x), x2)
	
})


test_that("rm_citation is extracting citation strings",{

    x <- c("Hello World (V. Raptor, 1986) bye",
        "Narcissism is not dead (Rinker, 2014)",
        "The R Core Team (2014) has many members.",
        paste("Bunn (2005) said, \"As for elegance, R is refined, tasteful, and",
            "beautiful. When I grow up, I want to marry R.\""),
        "It is wrong to blame ANY tool for our own shortcomings (Baer, 2005).",
        "Wickham's (in press) Tidy Data should be out soon.",
        "Rinker's (n.d.) dissertation not so much.",
        "I always consult xkcd comics for guidance (Foo, 2012; Bar, 2014).",
        "Uwe Ligges (2007) says, \"RAM is cheap and thinking hurts\""
    )


	x3 <- list("V. Raptor, 1986", "Rinker, 2014", "The R Core Team (2014)", 
        "Bunn (2005)", "Baer, 2005", "Wickham's (in press)", "Rinker's (n.d.)", 
        c("Foo, 2012", "Bar, 2014"), "Uwe Ligges (2007)")


    expect_equal(rm_citation(x, extract=TRUE), x3)
})


