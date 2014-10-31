context("Checking rmz_")

test_that("rm_ is making a function, and operating as expected",{
	
	x <- "I like icecream."
	
    rm_digit <- rm_(pattern="[0-9]")
    expect_equivalent(rm_digit("  I 12 li34ke ice56cream78.  "), x)
    
    rm_lead <- rm_(pattern="^\\s+", trim = FALSE, clean = FALSE)
    expect_equivalent(rm_lead("  I 12 li34ke ice56cream78.    "), "I 12 li34ke ice56cream78.    ")
    
    rm_all_except_letters <- rm_(pattern="[^ a-zA-Z]")
    expect_equivalent(rm_all_except_letters("  I 12 li34ke ice56cream78.    "), "I like icecream")
    
    extract_consec_num <- rm_(pattern="[0-9]+", extract = TRUE)
    expect_equivalent(extract_consec_num("  I 12 li34ke ice56cream78.  "),
    	list(c("12", "34", "56", "78")))

})
