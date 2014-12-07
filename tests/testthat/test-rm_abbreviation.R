context("Checking rm_abbreviation")

test_that("rm_abbreviation is removing 'all abbreviation' strings",{

    x <- c("I want $2.33 at 2:30 p.m. to go to A.n.p.",
        "She will send it A.S.A.P. (e.g. as soon as you can) said I.",
        "Hello world.", "In the U. S. A.")

    x2 <- c("I want $2.33 at 2:30 to go to", "She will send it ( as soon as you can) said I.", 
        "Hello world.", "In the")

    expect_equivalent(rm_abbreviation(x), x2)
	
})


test_that("rm_abbreviation is extracting 'all abbreviation' strings",{
	
    x <- c("I want $2.33 at 2:30 p.m. to go to A.n.p.",
        "She will send it A.S.A.P. (e.g. as soon as you can) said I.",
        "Hello world.", "In the U. S. A.")
    
    x3 <- list(c("p.m.", "A.n.p."), c("A.S.A.P.", "e.g."), NA_character_, 
        "U. S. A.")

    expect_equivalent(rm_abbreviation(x, extract=TRUE), x3)
})


