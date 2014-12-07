context("Checking case")

test_that("TC makes title case",{

    y <- c(
       "I'm liking it but not too much.",
       "How much are you into it?",
       "I'd say it's yet awesome yet."
    )
	
    expected <- list(list("i'm liking it but not too much.", "how much are you into it?", 
        "i'd say it's yet awesome yet."), list("I'M LIKING IT BUT NOT TOO MUCH.", 
        "HOW MUCH ARE YOU INTO IT?", "I'D SAY IT'S YET AWESOME YET."), 
        list("I'm Liking It but Not Too Much.", "How Much Are You into It?", 
            "I'd Say It's yet Awesome Yet."))
	
    expect_equivalent(L(y), expected[[1]])
    expect_equivalent(U(y), expected[[2]])
    expect_equivalent(TC(y), expected[[3]])
	
})




