context("Checking as_number")

test_that("as_number converts to a number list",{

    x <- list(c("-2", "-4.3", "3.33"), c("123,456", "0", "-123456", "-.2"), 
        c("3456789123", "345"), c("12,345", "23", ".44", "18"), c("444", "44"), 
        NA_character_)

    expected1 <- list(c(-2, -4.3, 3.33), c(123456, 0, -123456, -0.2), 
        c(3456789123, 345), c(12345, 23, 0.44, 18), c(444, 44), NA_real_)
    
    expect_equal(as_numeric(x), expected1)
})


test_that("as_number2 converts to a number vector",{

    x <- list(c("-2", "-4.3", "3.33"), c("123,456", "0", "-123456", "-.2"), 
        c("3456789123", "345"), c("12,345", "23", ".44", "18"), c("444", "44"), 
        NA_character_)

    expected2 <- c(-2, -4.3, 3.33, 123456, 0, -123456, -0.2, 3456789123, 345, 
        12345, 23, 0.44, 18, 444, 44, NA)

    
    expect_equal(as_numeric2(x), expected2)
})
