context("Checking is.regex")

test_that("is.regex correctly tests regular expression strings.",{

    expect_false(is.regex("I|***"))
    expect_true(is.regex("I|i"))
})




