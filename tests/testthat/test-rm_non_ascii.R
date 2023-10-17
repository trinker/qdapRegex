context("Checking rm_non_ascii")

skip_if(Sys.info()['sysname'] == 'Darwin' && as.numeric_version(Sys.info()[["release"]]) >= "23.0.0", message = NULL)
test_that("rm_non_ascii is removing/replacing 'all abbreviation' strings",{

    x <- c("Hello World", "Ekstr\xf8m", "J\xf6reskog", "bi\xdfchen Z\xfcrcher")
    Encoding(x) <- "latin1"
    x
    
    x1 <- c("Hello World", "Ekstrm", "Jreskog", "bichen Zrcher")
    x2 <- c("Hello World", "Ekstr<<FLAG>>m", "J<<FLAG>>reskog", "bi<<FLAG>>chen Z<<FLAG>>rcher")

    
    expect_equivalent(rm_non_ascii(x), x1)
    expect_equivalent(rm_non_ascii(x, replacement="<<FLAG>>"), x2)
	
})

test_that("rm_non_ascii is extracting 'all non-ascii' strings",{
	
    x <- c("Hello World", "Ekstr\xf8m", "J\xf6reskog", "bi\xdfchen Z\xfcrcher")
    Encoding(x) <- "latin1"
    x
    
    x3 <- list(NA_character_, "<f8>", "<f6>", c("<df>", "<fc>"))
    
    expect_equivalent(rm_non_ascii(x, extract=TRUE), x3)

})



