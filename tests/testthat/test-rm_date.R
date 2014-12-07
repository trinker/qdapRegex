context("Checking rm_date")

test_that("rm_date is removing date strings",{

    x <- c("Format dates as 04/12/2014, 04-12-2014, 04.12.2014. or 04/12/14", 
        "But leaves mismatched: 12.12/2014")
    
    x2 <- c("Format dates as , , . or", "But leaves mismatched: 12.12/2014"
        )

    expect_equivalent(rm_date(x), x2)
	
})


test_that("rm_date is extracting date strings",{

    x <- c("Format dates as 04/12/2014, 04-12-2014, 04.12.2014. or 04/12/14", 
        "But leaves mismatched: 12.12/2014")
    
    x3 <- list(c("04/12/2014", "04-12-2014", "04.12.2014", "04/12/14"), 
        NA_character_)

    expect_equivalent(rm_date(x, extract=TRUE), x3)
})


