context("Checking rm_between")

test_that("rm_between is removing and extracting betweened text single markers",{

    x <- c("Where is the /big dog#?",
        "I think he's @arunning@b with /little cat#.")
    
    x2 <- c("Where is the /big dog#?", "I think he's with /little cat#."
        )
    
    x3 <- list(NA_character_, "running")
	
    expect_true(identical(rm_between(x, "@a", "@b"), x2))
    expect_true(identical(rm_between(x, "@a", "@b", extract=TRUE), x3))

})

test_that("rm_between is removing betweened text multiple markers",{

    x <- c("Where is the /big dog#?",
        "I think he's @arunning@b with /little cat#.")
    
    y <- c("Where is the L1big dogL2?",
        "I think he's 98running99 with L1little catL2.")
	
    z2 <- c("Where is the ?", "I think he's with .")

	expect_true(identical(rm_between(x, c("/", "@a"), c("#", "@b")), z2))
    expect_true(identical(rm_between(y, c("L1", 98), c("L2", 99)), z2))
	
})


test_that("rm_between is extracting betweened text multiple markers",{
    
    x <- c("Where is the /big dog#?",
        "I think he's @arunning@b with /little cat#.")
    
    y <- c("Where is the L1big dogL2?",
        "I think he's 98running99 with L1little catL2.")

	z3 <- list("big dog", c("running", "little cat"))

	expect_true(identical(rm_between(x, c("/", "@a"), c("#", "@b"), extract=TRUE), z3))
    expect_true(identical(rm_between(y, c("L1", 98), c("L2", 99), extract=TRUE), z3))
		
})
