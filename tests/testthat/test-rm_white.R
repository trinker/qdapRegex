context("Checking rm_white")

test_that("rm_white is removing/replacing time strings",{

    x <-  c(" There is ( $5.50 ) for , me . ", " that's [ 45.6% ] of ! the pizza !",
        "     14% is { $26  } or $25.99 ?", "Oh ;  here's colon : Yippee !")
    
    y <- list(c("There is ($5.50) for, me.", "that's [45.6%] of! the pizza!", 
        "14% is {$26} or $25.99?", "Oh; here's colon: Yippee!"), c("There is ($5.50) for , me .", 
        "that's [45.6%] of ! the pizza !", "14% is {$26} or $25.99 ?", 
        "Oh ; here's colon : Yippee !"), c("There is ( $5.50 ) for , me .", 
        "that's [ 45.6% ] of ! the pizza !", "14% is { $26 } or $25.99 ?", 
        "Oh; here's colon: Yippee !"), c("There is ( $5.50 ) for, me .", 
        "that's [ 45.6% ] of ! the pizza !", "14% is { $26 } or $25.99 ?", 
        "Oh ; here's colon : Yippee !"), c("There is ( $5.50 ) for , me.", 
        "that's [ 45.6% ] of! the pizza!", "14% is { $26 } or $25.99?", 
        "Oh ; here's colon : Yippee!"), c("There is ( $5.50 ) for , me . ", 
        "that's [ 45.6% ] of ! the pizza !", "14% is { $26  } or $25.99 ?", 
        "Oh ;  here's colon : Yippee !"), c(" There is ( $5.50 ) for , me .", 
        " that's [ 45.6% ] of ! the pizza !", "     14% is { $26  } or $25.99 ?", 
        "Oh ;  here's colon : Yippee !"), c("There is ( $5.50 ) for , me .", 
        "that's [ 45.6% ] of ! the pizza !", "14% is { $26  } or $25.99 ?", 
        "Oh ;  here's colon : Yippee !"), c("There is ( $5.50 ) for , me .", 
        "that's [ 45.6% ] of ! the pizza !", "14% is { $26 } or $25.99 ?", 
        "Oh ; here's colon : Yippee !"), c("There is ( $5.50 ) for, me.", 
        "that's [ 45.6% ] of! the pizza!", "14% is { $26 } or $25.99?", 
        "Oh; here's colon: Yippee!"))
    
    
    expect_equivalent(rm_white(x), y[[1]])
    expect_equivalent(rm_white_bracket(x), y[[2]])
    expect_equivalent(rm_white_colon(x), y[[3]])
    expect_equivalent(rm_white_comma(x), y[[4]])
    expect_equivalent(rm_white_endmark(x), y[[5]])
    expect_equivalent(rm_white_lead(x), y[[6]])
    expect_equivalent(rm_white_trail(x), y[[7]])
    expect_equivalent(rm_white_lead_trail(x), y[[8]])
    expect_equivalent(rm_white_multiple(x), y[[9]])
    expect_equivalent(rm_white_punctuation(x), y[[10]])

	
})





