context("Checking rm_time")

test_that("rm_time is removing/replacing time strings",{

    x <-  c("R uses 1:5 for 1, 2, 3, 4, 5.",
        "At 3:00 we'll meet up and leave by 4:30:20",
        "We'll meet at 6:33.", "He ran it in :22.34")

    x2 <- c("R uses 1:5 for 1, 2, 3, 4, 5.", "At we'll meet up and leave by", 
        "We'll meet at .", "He ran it in")


    expect_equivalent(rm_time(x), x2)	
	
})


test_that("rm_time is extracting time strings",{

    x <-  c("R uses 1:5 for 1, 2, 3, 4, 5.",
        "At 3:00 we'll meet up and leave by 4:30:20",
        "We'll meet at 6:33.", "He ran it in :22.34")

    x3 <- list(NA_character_, c("3:00", "4:30:20"), "6:33", ":22.34")

    expect_equivalent(rm_time(x, extract=TRUE), x3)
})


test_that("rm_transcript_time is removing/replacing time strings",{

    x <-c(
        '08:15 8 minutes and 15 seconds	00:08:15.0',
        '3:15 3 minutes and 15 seconds	not 1:03:15.0',
        '01:22:30 1 hour 22 minutes and 30 seconds	01:22:30.0',
        '#00:09:33-5# 9 minutes and 33.5 seconds	00:09:33.5',
        '00:09.33,75 9 minutes and 33.5 seconds	00:09:33.75'
    )


    x4 <- c("8 minutes and 15 seconds", "3 minutes and 15 seconds not", 
        "1 hour 22 minutes and 30 seconds", "# 9 minutes and 33.5 seconds", 
        "9 minutes and 33.5 seconds")


    expect_equivalent(rm_transcript_time(x), x4)	
	
})


test_that("rm_transcript_time is extracting time strings",{

    x <-c(
        '08:15 8 minutes and 15 seconds	00:08:15.0',
        '3:15 3 minutes and 15 seconds	not 1:03:15.0',
        '01:22:30 1 hour 22 minutes and 30 seconds	01:22:30.0',
        '#00:09:33-5# 9 minutes and 33.5 seconds	00:09:33.5',
        '00:09.33,75 9 minutes and 33.5 seconds	00:09:33.75'
    )

    x5 <- structure(list(c("08:15", "00:08:15.0"), c("3:15", "1:03:15.0"), 
        c("01:22:30", "01:22:30.0"), c("#00:09:33-5", "00:09:33.5"), 
        c("00:09.33,75", "00:09:33.75")), class = c("extracted", "list")
    )

    expect_equivalent(rm_transcript_time(x, extract=TRUE), x5)
})