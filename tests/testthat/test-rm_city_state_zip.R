context("Checking rm_city_state_zip")

test_that("rm_city_state_zip is removing city_state_zip strings",{

    x <- paste0("I went to Washington Heights, NY 54321 for food! ", 
       "It's in West ven,PA 12345, near Bolly Bolly Bolly, CA12345-1234!", 
       "hello world")

    x2 <- "I went to for food! It's in West , near !hello world"
	
    expect_equivalent(rm_city_state_zip(x), x2)
	
})


test_that("rm_city_state_zip is extracting city_state_zip strings",{

    x <- paste0("I went to Washington Heights, NY 54321 for food! ", 
       "It's in West ven,PA 12345, near Bolly Bolly Bolly, CA12345-1234!", 
       "hello world")

    x3 <- list(c("Washington Heights, NY 54321", "ven,PA 12345", "Bolly Bolly Bolly, CA12345-1234"
        ))

    expect_equivalent(rm_city_state_zip(x, extract=TRUE), x3)
})


