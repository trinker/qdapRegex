context("Checking rm_postal_code")

test_that("rm_postal_code is removing postal_code strings",{

    x <- c("Anchorage, AK", "New York City, NY", "Some Place, Another Place, LA")
    rm_postal_code(x)
    expect_equivalent(
    	c("Anchorage,", "New York City,", "Some Place, Another Place,"), 
    	rm_postal_code(x)
    )
	
})


test_that("rm_postal_code is extracting postal_code strings",{

    x <- c("Anchorage, AK", "New York City, NY", "Some Place, Another Place, LA")
    expect_equivalent(
    	list("AK", "NY", "LA"), 
    	rm_postal_code(x, extract=TRUE)
    )

})


