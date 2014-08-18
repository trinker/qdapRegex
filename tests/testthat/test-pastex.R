context("Checking pastex")

test_that("pastex gets strings and pastes together",{

	expect_identical(pastex("X", "Y", "Z"), "X|Y|Z")
    expect_identical(pastex("@rm_percent", "@rm_dollar"),
    	"\\(?[0-9.]+\\)?%|\\$\\(?[0-9.]+\\)?")
    expect_identical(pastex("@rm_percent", "@time_12_hours"),
    	 "\\(?[0-9.]+\\)?%|(1[012]|[1-9]):[0-5][0-9](\\s?)(am|pm)")
	expect_identical("X" %|% "Z", "X|Z")
})





