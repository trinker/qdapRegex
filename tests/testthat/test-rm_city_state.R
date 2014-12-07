context("Checking rm_city_state")

test_that("rm_city_state is removing city_state strings",{

    x <- paste0("I went to Washington Heights, NY for food! ", 
       "It's in West ven,PA, near Bolly Bolly Bolly, CA!", 
       "I like Movies, PG13")

    x2 <- "I went to for food! It's in West , near !I like Movies, PG13"
	
    expect_equivalent(rm_city_state(x), x2)
	
})


test_that("rm_city_state is extracting city_state strings",{

    x <- paste0("I went to Washington Heights, NY for food! ", 
       "It's in West ven,PA, near Bolly Bolly Bolly, CA!", 
       "I like Movies, PG13")

    x3 <- list(c("Washington Heights, NY", "ven,PA", "Bolly Bolly Bolly, CA"
        ))

    expect_equivalent(rm_city_state(x, extract=TRUE), x3)
})


