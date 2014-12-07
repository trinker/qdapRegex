context("Checking rm_citation_tex")

test_that("rm_citation_tex is removing citation strings",{

    x <- c(
        "I say \\parencite*{Ted2005, Moe1999} go there in \\textcite{Few2010} said to.",
        "But then \\authorcite{Ware2013} siad it was so \\pcite[see][p. 22]{Get9999c}.",
        "then I \\citep[p. 22]{Foo1882c} him")
    
    expect_equivalent(rm_citation_tex(x), 
       c("I say go there in said to.", "But then siad it was so .", "then I him")
    )
	
})


test_that("rm_citation_tex is extracting citation strings",{

    x <- c(
        "I say \\parencite*{Ted2005, Moe1999} go there in \\textcite{Few2010} said to.",
        "But then \\authorcite{Ware2013} siad it was so \\pcite[see][p. 22]{Get9999c}.",
        "then I \\citep[p. 22]{Foo1882c} him")
    
    expect_equivalent(rm_citation_tex(x, extract=TRUE), 
        list(c("Ted2005", "Moe1999", "Few2010"), c("Ware2013", "Get9999c"
        ), "Foo1882c")
    )
    
})


