context("Checking rm_hash")

test_that("rm_hash is removing/replacing hash strings",{

    x <- c("@hadley I like #rstats for #ggplot2 work.",
        "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats:
            http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @timelyportfolio",
        "Slides from great talk: @ramnath_vaidya: Interactive slides from Interactive Visualization
            presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1"
    )
    
    x2 <- c("@hadley I like for work.", "Difference between and , both implement pipeline operators for : http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @timelyportfolio", 
        "Slides from great talk: @ramnath_vaidya: Interactive slides from Interactive Visualization presentation . http://ramnathv.github.io/user2014-rcharts/#1"
        )

    expect_equivalent(rm_hash(x), x2)	
	
})


test_that("rm_hash is extracting hash strings",{

    x <- c("@hadley I like #rstats for #ggplot2 work.",
        "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats:
            http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @timelyportfolio",
        "Slides from great talk: @ramnath_vaidya: Interactive slides from Interactive Visualization
            presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1"
    )
	
    x3 <- list(c("#rstats", "#ggplot2"), c("#magrittr", "#pipeR", "#rstats"
        ), "#user2014")

    expect_equivalent(rm_hash(x, extract=TRUE), x3)
})


