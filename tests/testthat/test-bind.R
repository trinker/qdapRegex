context("Checking bind")

test_that("bind adds boundaries on either end",{

    expected <- c("[A]", "[B]", "[C]", "[D]", "[E]", "[F]", "[G]", "[H]", "[I]", 
        "[J]")
    
    expect_identical(bind(LETTERS[1:10], "[", "]"), expected)

})





