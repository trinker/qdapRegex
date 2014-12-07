context("Checking rm_phone")

test_that("rm_phone is removing/replacing phone strings",{

    x <- c(" Mr. Bean bought 2 tickets 2-613-213-4567 or 5555555555 call either one",
      "43 Butter Rd, Brossard QC K0A 3P0 - 613 213 4567",
      "Please contact Mr. Bean (613)2134567",
      "1.575.555.5555 is his #1 number",
      "7164347566",
      "I like 1234567 dogs"
    )
    
    x2 <- c("Mr. Bean bought 2 tickets 2- or call either one", "43 Butter Rd, Brossard QC K0A 3P0 -", 
        "Please contact Mr. Bean", "is his #1 number", "", "I like 1234567 dogs"
        )

    expect_equivalent(rm_phone(x), x2)	
	
})


test_that("rm_phone is extracting phone strings",{

    x <- c(" Mr. Bean bought 2 tickets 2-613-213-4567 or 5555555555 call either one",
      "43 Butter Rd, Brossard QC K0A 3P0 - 613 213 4567",
      "Please contact Mr. Bean (613)2134567",
      "1.575.555.5555 is his #1 number",
      "7164347566",
      "I like 1234567 dogs"
    )

    x3 <- list(c("613-213-4567", "5555555555"), "613 213 4567", "(613)2134567", 
        "1.575.555.5555", "7164347566", NA_character_)

    expect_equivalent(rm_phone(x, extract=TRUE), x3)
})


