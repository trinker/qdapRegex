context("Checking rm_email")

test_that("rm_email is removing/replacing email strings",{

	x <- paste("fred is fred@foo.com and joe is joe@example.com - but @this is a 
        twitter handle for twit@here.com or foo+bar@google.com/fred@foo.fnord")

	x2 <- "fred is and joe is - but @this is a twitter handle for or /"
	x3 <- "fred is <a href=\"mailto:fred@foo.com\" target=\"_blank\">fred@foo.com</a> and joe is <a href=\"mailto:joe@example.com\" target=\"_blank\">joe@example.com</a> - but @this is a twitter handle for <a href=\"mailto:twit@here.com\" target=\"_blank\">twit@here.com</a> or <a href=\"mailto:foo+bar@google.com\" target=\"_blank\">foo+bar@google.com</a>/<a href=\"mailto:fred@foo.fnord\" target=\"_blank\">fred@foo.fnord</a>"

    expect_equivalent(rm_email(x), x2)
    expect_equivalent(rm_email(x, replacement = '<a href="mailto:\\1" target="_blank">\\1</a>'), x3)
	
})


test_that("rm_email is extracting email strings",{

	x <- paste("fred is fred@foo.com and joe is joe@example.com - but @this is a 
        twitter handle for twit@here.com or foo+bar@google.com/fred@foo.fnord")

    x4 <- list(c("fred@foo.com", "joe@example.com", "twit@here.com", "foo+bar@google.com", 
        "fred@foo.fnord"))

    expect_equivalent(rm_email(x, extract=TRUE), x4)
})


