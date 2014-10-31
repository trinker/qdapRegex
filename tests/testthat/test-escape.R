context("Checking escape")

test_that("escape produces a class of `escape`",{
	
    expect_equivalent(escape("X"), structure("X", class = c("escape", "character")))

})


test_that("escape does not parse these strings",{
	
    x <- "...character vector.  Default, \\code{@rm_caps} uses..."

    expect_equivalent(rm_default(x, pattern = "@rm_caps"),
    	"...character vector. Default, \\code{@rm_caps} uses...")
    expect_equivalent(rm_default(x, pattern = escape("@rm_caps")),
    	"...character vector. Default, \\code{} uses...")
	
	expect_equivalent(pastex(escape("@rm_caps")), "@rm_caps")

})



