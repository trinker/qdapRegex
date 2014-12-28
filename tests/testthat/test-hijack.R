context("Checking hijack")

test_that("hijack is replacing hijacks",{

    mean2 <- function(x, na.rm = FALSE, ...){
        mean(x, ..., na.rm = na.rm)
    }
    expect_true(is.na((mean2(c(NA, 1:10)))))
    mean3 <- qdapRegex:::hijack(mean2, na.rm=TRUE)
    expect_false(is.na((mean3(c(NA, 1:10)))))
    
})


