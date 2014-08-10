context("Checking rm_time")

test_that("rm_time is removing/replacing time strings",{

    x <-  c("R uses 1:5 for 1, 2, 3, 4, 5.",
        "At 3:00 we'll meet up and leave by 4:30:20",
        "We'll meet at 6:33.", "He ran it in :22.34")

    x2 <- c("R uses 1:5 for 1, 2, 3, 4, 5.", "At we'll meet up and leave by", 
        "We'll meet at .", "He ran it in")


    expect_true(identical(rm_time(x), x2))	
	
})


test_that("rm_time is extracting time strings",{

    x <-  c("R uses 1:5 for 1, 2, 3, 4, 5.",
        "At 3:00 we'll meet up and leave by 4:30:20",
        "We'll meet at 6:33.", "He ran it in :22.34")

    x3 <- list(character(0), c("3:00", "4:30:20"), "6:33", ":22.34")

    expect_true(identical(rm_time(x, extract=TRUE), x3))
})



