context("Checking grab")

test_that("grab gets strings",{

	expect_identical(grab("@split_keep_delim"), "(?<=[^%s])(?=[%s])")
    expect_identical(grab("@rm_percent"), "\\(?[0-9.]+\\)?%")
    expect_identical(grab("rm_percent"), "\\(?[0-9.]+\\)?%")	
    expect_error(grab("@foo"))
})





