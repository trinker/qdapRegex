context("Checking rm_url")

test_that("rm_url is removing/replacing url strings",{

    x <- " I like www.talkstats.com and http://stackoverflow.com"

    x2 <- "I like and"
    x3 <- "I like <a href=\"\" target=\"_blank\"></a> and <a href=\"http://stackoverflow.com\" target=\"_blank\">http://stackoverflow.com</a>"

    expect_equivalent(rm_url(x), x2)
    expect_equivalent(rm_url(x, replacement = '<a href="\\1" target="_blank">\\1</a>'), x3)    
	
})


test_that("rm_url is extracting url strings",{

    x <- " I like www.talkstats.com and http://stackoverflow.com"

    x4 <- list(c("www.talkstats.com", "http://stackoverflow.com"))

    expect_equivalent(rm_url(x, extract=TRUE), x4)
})


