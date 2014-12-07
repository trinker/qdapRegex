context("Checking rm_tag")

test_that("rm_tag is removing/replacing tag strings",{

    x <- c("@hadley I like #rstats for #ggplot2 work.",
        "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats:
            http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @timelyportfolio",
        "Slides from great talk: @ramnath_vaidya: Interactive slides from Interactive Visualization
            presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1"
    )

    
    x2 <- c("I like #rstats for #ggplot2 work.", "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats: http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html", 
        "Slides from great talk: : Interactive slides from Interactive Visualization presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1"
        )

    expect_equivalent(rm_tag(x), x2)	
	
})


test_that("rm_tag is extracting tag strings",{

    x <- c("@hadley I like #rstats for #ggplot2 work.",
        "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats:
            http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @timelyportfolio",
        "Slides from great talk: @ramnath_vaidya: Interactive slides from Interactive Visualization
            presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1"
    )

    x3 <- list("@hadley", "@timelyportfolio", "@ramnath_vaidya")

    expect_equivalent(rm_tag(x, extract=TRUE), x3)
})


