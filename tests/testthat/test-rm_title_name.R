context("Checking rm_title_name")

test_that("rm_title_name is removing date strings",{

    x <- c("Dr. Brend is mizz hart's in mrs. Holtz's.", 
        "Where is mr. Bob Jr. and Ms. John Kennedy?")
    
    x2 <- c("is 's in 's.", "Where is . and ?")

    expect_equivalent(rm_title_name(x), x2)
	
})


test_that("rm_title_name is extracting date strings",{

    x <- c("Dr. Brend is mizz hart's in mrs. Holtz's.", 
        "Where is mr. Bob Jr. and Ms. John Kennedy?")
    
    x3 <- list(c("Dr. Brend", "mizz hart", "mrs. Holtz"), c("mr. Bob Jr", 
        "Ms. John Kennedy"))

    expect_equivalent(rm_title_name(x, extract=TRUE), x3)
})


