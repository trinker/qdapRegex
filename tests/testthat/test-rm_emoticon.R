context("Checking rm_emoticon")

test_that("rm_emoticon is removing/replacing emoticon strings",{

    x <- c("are :-)) it 8-D he XD on =-D they :D of :-) is :> for :o) that :-/",
      "as :-D I xD with :^) a =D to =) the 8D and :3 in =3 you 8) his B^D was")


	x2 <- c("are it he on they of is for that", 
        "as I with a to the and in you his was"
    )

    expect_equivalent(rm_emoticon(x), x2)

})


test_that("rm_emoticon is extracting emoticon strings",{

    x <- c("are :-)) it 8-D he XD on =-D they :D of :-) is :> for :o) that :-/",
      "as :-D I xD with :^) a =D to =) the 8D and :3 in =3 you 8) his B^D was")


    x3 <- list(c(":-))", "8-D", "XD", "=-D", ":D", ":-)", ":>", ":o)", 
        ":-/"), c(":-D", "xD", ":^)", "=D", "=)", "8D", ":3", "=3", "8)", 
        "B^D"))

    expect_equivalent(rm_emoticon(x, extract=TRUE), x3)
})


