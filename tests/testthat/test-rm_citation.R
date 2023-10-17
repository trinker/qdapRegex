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
        "Uwe Ligges (2007) says, \"RAM is cheap and thinking hurts\" Liges (in press) yep (Uwe, in press)",
        "I like van Feet (2003, 2002) as well as toes (de Foot, 2013, 1012, 2000)",
        "I want Feet (n.d., 1999) and his esteemeded colleagues (Foo, in press, 1999; Bar, 2012)",
        "I saw it (viz. Smith, 2009, 2008), and then (cf., Jones, 1992a)",
        "Some (e.g. Con, 1888; Peirce, 1998) but then (e.g., Smith, in press, n.d.) see)",
        "It's intrinsically wrong (Walker, 2008, p. 34).",
        "Here too |Yeps, 1212 and Jones (19959)"
    )

    x2 <- c("Hello World () bye", "Narcissism is not dead ()", "has many members.", 
        "said, \"As for elegance, R is refined, tasteful, and beautiful. When I grow up, I want to marry R.\"", 
        "It is wrong to blame ANY tool for our own shortcomings ().", 
        "Tidy Data should be out soon.", "dissertation not so much.", 
        "I always consult xkcd comics for guidance (; ).", "says, \"RAM is cheap and thinking hurts\" yep ()", 
        "I like as well as toes ()", "I want and his esteemeded colleagues (; )", 
        "I saw it (viz. ), and then (cf., )", "Some (e.g. ; ) but then (e.g., ) see)", 
        "It's intrinsically wrong (, p. 34).", "Here too |Yeps, 1212 and Jones (19959)"
      )

    expect_equivalent(rm_citation(x), x2)
	
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
        "Uwe Ligges (2007) says, \"RAM is cheap and thinking hurts\" Liges (in press) yep (Uwe, in press)",
        "I like van Feet (2003, 2002) as well as toes (de Foot, 2013, 1012, 2000)",
        "I want Feet (n.d., 1999) and his esteemeded colleagues (Foo, in press, 1999; Bar, 2012)",
        "I saw it (viz. Smith, 2009, 2008), and then (cf., Jones, 1992a)",
        "Some (e.g. Con, 1888; Peirce, 1998) but then (e.g., Smith, in press, n.d.) see)",
        "It's intrinsically wrong (Walker, 2008, p. 34).",
        "Here too |Yeps, 1212 and Jones (19959)"
    )

    x3 <- list(
        "V. Raptor, 1986", "Rinker, 2014", "The R Core Team (2014)", 
        "Bunn (2005)", "Baer, 2005", "Wickham's (in press)", "Rinker's (n.d.)", 
        c("Foo, 2012", "Bar, 2014"), c("Uwe Ligges (2007)", "Liges (in press)", 
        "Uwe, in press"), c("van Feet (2003, 2002)", "de Foot, 2013, 1012, 2000"
        ), c("Feet (n.d., 1999)", "Foo, in press, 1999", "Bar, 2012"
        ), c("Smith, 2009, 2008", "Jones, 1992a"), c("Con, 1888", 
        "Peirce, 1998", "Smith, in press, n.d."), "Walker, 2008", 
        NA_character_
    )



    expect_equivalent(rm_citation(x, extract=TRUE), x3)
})


