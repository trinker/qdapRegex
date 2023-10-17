context("Checking as_count")

test_that("as_count converts citations to counts",{
    
    w <- unlist(structure(list(c("V. Raptor, 1986", "Foo, 2012"), "Rinker, 2014", 
        "The R Core Team (2014)", "Bunn (2005)", "Baer, 2005", "Wickham's (in press)", 
        "Rinker's (n.d.)", c("Foo, 2012", "Bar, 2014"), "Uwe Ligges (2007)", 
        c("Bar, 2014", "Bar (2014, 2012)")), class = c("extracted", 
        "list")
    ))
    
    exp <- structure(list(Author = c("Bar", "Bar", "Bunn", "Rinker", "The R Core Team", 
        "Uwe Ligges", "Wickham"), Year = c("2012", "2014", "2005", "n.d.", 
        "2014", "2007", "in press"), n = c(1, 1, 1, 1, 1, 1, 1)), .Names = c("Author", 
        "Year", "n"), row.names = c(3L, 4L, 1L, 7L, 5L, 2L, 6L), class = "data.frame"
    )
 
    expect_equal(as_count(ex_citation(w)), exp)
})

test_that("distribute, distributes authors to years",{
    
    w <- c("James (2012, 2013)", "Nells, 2011a, 2011b")
    exp <- c("James, 2012", "James, 2013", "Nells, 2011a", "Nells, 2011b")

    distribute(w)
 
    expect_equal(distribute(w), exp)
})


