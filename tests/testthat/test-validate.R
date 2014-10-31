context("Checking validate")

test_that("validate is validating true/false or multiple if `single = TRUE`",{

    ## Single element email
    valid_email <- validate("@rm_email")
    expect_false(valid_email(c("tyler.rinker@gmail.com", "@trinker")))
    
    ## Multiple elements
    valid_email_1 <- validate("@rm_email", single=FALSE)
    expect_equivalent(valid_email_1(c("tyler.rinker@gmail.com", "@trinker")), 
        c(TRUE, FALSE))
    
    ## single element address
    valid_address <- validate("@rm_city_state_zip")
    expect_true(valid_address("Buffalo, NY 14217"))
    expect_true(valid_address("buffalo,NY14217"))
    expect_false(valid_address("buffalo NY 14217"))
    
    valid_address2 <- validate(paste0("(\\s*([A-Z][\\w-]*)+),",
        "\\s([A-Z]{2})\\s(?<!\\d)\\d{5}(?:[ -]\\d{4})?\\b"))
    expect_true(valid_address2("Buffalo, NY 14217"))
    expect_false(valid_address2("buffalo, NY 14217"))
    expect_false(valid_address2("buffalo,NY14217"))
    expect_false(valid_address2("buffalo NY 14217"))

	
})





