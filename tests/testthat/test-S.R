context("Checking S")

test_that("S is replacing %s",{

    expect_equivalent(S("@after_", "the", "the"), "(?<=\\b(the|the)\\s)(\\w+)")
    expect_equivalent(S("@rm_between", "LEFT", "RIGHT"), "(LEFT)(.*?)(RIGHT)")
	
})


test_that("S is replacing %s and recycling",{

    expect_equivalent(S("@after_", "the"), "(?<=\\b(the|the)\\s)(\\w+)")
    expect_equivalent(S("@after_", "the"), S("@after_", "the", "the"))

    
})

test_that("S gives error",{

    expect_error(S("@after_", "the", "the", "the"))

})