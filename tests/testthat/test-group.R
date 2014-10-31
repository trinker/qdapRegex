context("Checking group")

test_that("group adds boundaries on either end",{

    expected <- c("(A)", "(B)", "(C)", "(D)", "(E)", "(F)", "(G)", "(H)", "(I)", 
        "(J)")
    
    expect_equivalent(group(LETTERS[1:10]), expected)

})




