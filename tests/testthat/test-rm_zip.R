context("Checking rm_zip")

test_that("rm_zip is removing/replacing zip strings",{

    x <- c("Mr. Bean bought 2 tickets 2-613-213-4567",
      "43 Butter Rd, Brossard QC K0A 3P0 - 613 213 4567",
      "Rat Race, XX, 12345",
      "Ignore phone numbers(613)2134567",
      "Grab zips with dashes 12345-6789 or no space before12345-6789",
      "Grab zips with spaces 12345 6789 or no space before12345 6789",
      "I like 1234567 dogs"
    )

    x2 <- c("Mr. Bean bought 2 tickets 2-613-213-4567", "43 Butter Rd, Brossard QC K0A 3P0 - 613 213 4567", 
        "Rat Race, XX,", "Ignore phone numbers(613)2134567", "Grab zips with dashes or no space before", 
        "Grab zips with spaces or no space before", "I like 1234567 dogs"
        )

    expect_true(identical(rm_zip(x), x2))	
	
})


test_that("rm_zip is extracting zip strings",{

    x <- c("Mr. Bean bought 2 tickets 2-613-213-4567",
      "43 Butter Rd, Brossard QC K0A 3P0 - 613 213 4567",
      "Rat Race, XX, 12345",
      "Ignore phone numbers(613)2134567",
      "Grab zips with dashes 12345-6789 or no space before12345-6789",
      "Grab zips with spaces 12345 6789 or no space before12345 6789",
      "I like 1234567 dogs"
    )

    x3 <- list(character(0), character(0), "12345", character(0), c("12345-6789", 
        "12345-6789"), c("12345 6789", "12345 6789"), character(0))    

    expect_true(identical(rm_zip(x, extract=TRUE), x3))
})



