context("Checking group_or")

test_that("group_or groups and `or` concatenate elements",{

    expect_equal(group_or("them", "those", "that", "these"), 
        "((them)|(those)|(that)|(these))")
    
    expect_equal(group_or("them", "those", "that", "these", group.all = FALSE),
        "(them)|(those)|(that)|(these)")
})

