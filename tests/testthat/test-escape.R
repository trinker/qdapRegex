context("Checking escape")

test_that("escape produces a class of `escape`",{
	
    expect_identical(escape("X"), structure("X", class = c("escape", "character")))

})


test_that("escape does not parse these strings",{
	
    x <- "...character vector.  Default, \\code{@rm_caps} uses..."

    expect_identical(rm_default(x, pattern = "@rm_caps"),
    	"...character vector. Default, \\code{@rm_caps} uses...")
    expect_identical(rm_default(x, pattern = escape("@rm_caps")),
    	"...character vector. Default, \\code{} uses...")
	
	expect_identical(pastex(escape("@rm_caps")), "@rm_caps")

})




