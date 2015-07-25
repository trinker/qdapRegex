context("Checking rm_between_multiple")

test_that("rm_between_multiple is removing and extracting betweened text single markers",{

    x <- c("Where is the /big dog#?",
        "I think he's @arunning@b with /little cat#.")
    
    x2 <- c("Where is the /big dog#?", "I think he's with /little cat#."
        )
    
    x3 <- structure(list(`@a  :  @b1` = character(0), `@a  :  @b2` = "running"), 
    	.Names = c("@a  :  @b1", "@a  :  @b2"))
	
    expect_equivalent(rm_between_multiple(x, "@a", "@b"), x2)
    expect_equivalent(rm_between_multiple(x, "@a", "@b", extract=TRUE), x3)

})

test_that("rm_between_multiple is removing betweened text multiple markers",{

    x <- c("Where is the /big dog#?",
        "I think he's @arunning@b with /little cat#.")
    
    y <- c("Where is the L1big dogL2?",
        "I think he's 98running99 with L1little catL2.")
	
    z2 <- c("Where is the?", "I think he's with.")

	expect_equivalent(rm_between_multiple(x, c("/", "@a"), c("#", "@b")), z2)
    expect_equivalent(rm_between_multiple(y, c("L1", 98), c("L2", 99)), z2)
	
})


test_that("rm_between_multiple is extracting betweened text multiple markers",{
    
    x <- c("Where is the /big dog#?",
        "I think he's @arunning@b with /little cat#.")
    
    y <- c("Where is the L1big dogL2?",
        "I think he's 98running99 with L1little catL2.")

	z3 <- list("big dog", c("little cat", "running"))

	expect_equivalent(rm_between_multiple(x, c("/", "@a"), c("#", "@b"), extract=TRUE), z3)
    expect_equivalent(rm_between_multiple(y, c("L1", 98), c("L2", 99), extract=TRUE), z3)
		
})

test_that("rm_between_multiple can use regexes when fixed = FALSE",{
    
    x <-  c(
        "There are 2.3 million species in the world",
        "There are 2.3 billion species in the world"
    )
    
    expect_equal(
        rm_between_multiple(x, left='There', right = '[mb]illion', fixed = FALSE,
            include=TRUE),
        c("species in the world", "species in the world")
    )
    
    expect_equal(    
        rm_between_multiple(x, left='There', right = '[mb]illion', fixed = FALSE,
            extract=TRUE, include=TRUE),
        structure(list(`There  :  [mb]illion1` = "There are 2.3 million", 
            `There  :  [mb]illion2` = "There are 2.3 billion"), 
            .Names = c("There  :  [mb]illion1", "There  :  [mb]illion2"))
    )

})

