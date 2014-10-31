context("Checking grab")

test_that("grab gets strings",{

	expect_equivalent(grab("@split_keep_delim"), "(?<=[^%s])(?=[%s])")
    expect_equivalent(grab("@rm_percent"), "\\(?[0-9.]+\\)?%")
    expect_equivalent(grab("rm_percent"), "\\(?[0-9.]+\\)?%")	
    expect_error(grab("@foo"))
})




