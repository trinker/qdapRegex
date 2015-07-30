context("Checking as_time")

test_that("as_time converts extracted time stamp strings to time",{

    x <- list("3:04", c("10:47", "0:47"), NA_character_, "12:04", c("12:04", 
        "1:22"), c("08:15", "00:08:15.0"), c("3:15", "1:03:15.0"), c("01:22:30", 
        "01:22:30.0"), c("#00:09:33-5", "00:09:33.5"), c("00:09.33,75", 
        "00:09:33.75"))

    expect_equal(as_time(x), list("00:03:04.0", c("00:10:47.0", "00:00:47.0"), NA_character_, 
        "00:12:04.0", c("00:12:04.0", "00:01:22.0"), c("00:08:15.0", 
        "00:08:15.0"), c("00:03:15.0", "01:03:15.0"), c("01:22:30.0", 
        "01:22:30.0"), c("00:09:33.5", "00:09:33.5"), c("00:09:33.75", 
        "00:09:33.75"))
    )
    
    expect_equal(as_time(x, as.POSIXlt = TRUE), list(structure(list(sec = 4, min = 3L, hour = 0L, mday = 29L, 
            mon = 6L, year = 115L, wday = 3L, yday = 209L, isdst = 1L, 
            zone = "EDT", gmtoff = NA_integer_), .Names = c("sec", "min", 
        "hour", "mday", "mon", "year", "wday", "yday", "isdst", "zone", 
        "gmtoff"), class = c("POSIXlt", "POSIXt")), structure(list(sec = c(47, 
        47), min = c(10L, 0L), hour = c(0L, 0L), mday = c(29L, 29L), 
            mon = c(6L, 6L), year = c(115L, 115L), wday = c(3L, 3L), 
            yday = c(209L, 209L), isdst = c(1L, 1L), zone = c("EDT", 
            "EDT"), gmtoff = c(NA_integer_, NA_integer_)), .Names = c("sec", 
        "min", "hour", "mday", "mon", "year", "wday", "yday", "isdst", 
        "zone", "gmtoff"), class = c("POSIXlt", "POSIXt")), structure(list(
            sec = NA_real_, min = NA_integer_, hour = NA_integer_, mday = NA_integer_, 
            mon = NA_integer_, year = NA_integer_, wday = NA_integer_, 
            yday = NA_integer_, isdst = -1L, zone = "", gmtoff = NA_integer_), .Names = c("sec", 
        "min", "hour", "mday", "mon", "year", "wday", "yday", "isdst", 
        "zone", "gmtoff"), class = c("POSIXlt", "POSIXt")), structure(list(
            sec = 4, min = 12L, hour = 0L, mday = 29L, mon = 6L, year = 115L, 
            wday = 3L, yday = 209L, isdst = 1L, zone = "EDT", gmtoff = NA_integer_), .Names = c("sec", 
        "min", "hour", "mday", "mon", "year", "wday", "yday", "isdst", 
        "zone", "gmtoff"), class = c("POSIXlt", "POSIXt")), structure(list(
            sec = c(4, 22), min = c(12L, 1L), hour = c(0L, 0L), mday = c(29L, 
            29L), mon = c(6L, 6L), year = c(115L, 115L), wday = c(3L, 
            3L), yday = c(209L, 209L), isdst = c(1L, 1L), zone = c("EDT", 
            "EDT"), gmtoff = c(NA_integer_, NA_integer_)), .Names = c("sec", 
        "min", "hour", "mday", "mon", "year", "wday", "yday", "isdst", 
        "zone", "gmtoff"), class = c("POSIXlt", "POSIXt")), structure(list(
            sec = c(15, 15), min = c(8L, 8L), hour = c(0L, 0L), mday = c(29L, 
            29L), mon = c(6L, 6L), year = c(115L, 115L), wday = c(3L, 
            3L), yday = c(209L, 209L), isdst = c(1L, 1L), zone = c("EDT", 
            "EDT"), gmtoff = c(NA_integer_, NA_integer_)), .Names = c("sec", 
        "min", "hour", "mday", "mon", "year", "wday", "yday", "isdst", 
        "zone", "gmtoff"), class = c("POSIXlt", "POSIXt")), structure(list(
            sec = c(15, 15), min = c(3L, 3L), hour = 0:1, mday = c(29L, 
            29L), mon = c(6L, 6L), year = c(115L, 115L), wday = c(3L, 
            3L), yday = c(209L, 209L), isdst = c(1L, 1L), zone = c("EDT", 
            "EDT"), gmtoff = c(NA_integer_, NA_integer_)), .Names = c("sec", 
        "min", "hour", "mday", "mon", "year", "wday", "yday", "isdst", 
        "zone", "gmtoff"), class = c("POSIXlt", "POSIXt")), structure(list(
            sec = c(30, 30), min = c(22L, 22L), hour = c(1L, 1L), mday = c(29L, 
            29L), mon = c(6L, 6L), year = c(115L, 115L), wday = c(3L, 
            3L), yday = c(209L, 209L), isdst = c(1L, 1L), zone = c("EDT", 
            "EDT"), gmtoff = c(NA_integer_, NA_integer_)), .Names = c("sec", 
        "min", "hour", "mday", "mon", "year", "wday", "yday", "isdst", 
        "zone", "gmtoff"), class = c("POSIXlt", "POSIXt")), structure(list(
            sec = c(33.5, 33.5), min = c(9L, 9L), hour = c(0L, 0L), mday = c(29L, 
            29L), mon = c(6L, 6L), year = c(115L, 115L), wday = c(3L, 
            3L), yday = c(209L, 209L), isdst = c(1L, 1L), zone = c("EDT", 
            "EDT"), gmtoff = c(NA_integer_, NA_integer_)), .Names = c("sec", 
        "min", "hour", "mday", "mon", "year", "wday", "yday", "isdst", 
        "zone", "gmtoff"), class = c("POSIXlt", "POSIXt")), structure(list(
            sec = c(33.75, 33.75), min = c(9L, 9L), hour = c(0L, 0L), 
            mday = c(29L, 29L), mon = c(6L, 6L), year = c(115L, 115L), 
            wday = c(3L, 3L), yday = c(209L, 209L), isdst = c(1L, 1L), 
            zone = c("EDT", "EDT"), gmtoff = c(NA_integer_, NA_integer_
            )), .Names = c("sec", "min", "hour", "mday", "mon", "year", 
        "wday", "yday", "isdst", "zone", "gmtoff"), class = c("POSIXlt", 
        "POSIXt")))
    )

    expect_equal(as_time(x, millisecond = FALSE), 
        list("00:03:4", c("00:10:47", "00:00:47"), NA_character_, "00:12:4", 
            c("00:12:4", "00:01:22"), c("00:08:15", "00:08:15"), c("00:03:15", 
            "01:03:15"), c("01:22:30", "01:22:30"), c("00:09:33", "00:09:33"),
            c("00:09:34", "00:09:34"))
    )
    
    expect_equal(as_time2(x), c("00:03:04.0", "00:10:47.0", "00:00:47.0", NA, "00:12:04.0", 
        "00:12:04.0", "00:01:22.0", "00:08:15.0", "00:08:15.0", "00:03:15.0", 
        "01:03:15.0", "01:22:30.0", "01:22:30.0", "00:09:33.5", "00:09:33.5", 
        "00:09:33.75", "00:09:33.75")
    )
    
})

