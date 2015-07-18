context("Checking bind_or")

test_that("bind_or binds and `or` concatenate elements",{

    expect_equal(bind_or("them", "those", "that", "these"), 
        "(\\bthem\\b|\\bthose\\b|\\bthat\\b|\\bthese\\b)")
    
    expect_equal(bind_or("them", "those", "that", "these", group.all = FALSE),
        "\\bthem\\b|\\bthose\\b|\\bthat\\b|\\bthese\\b")
})

