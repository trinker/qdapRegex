#' Paste Regular Expressions
#' 
#' \code{pastex} - A wrapper for \code{paste(collapse="|")} that also searches 
#' the default and supplemental (\code{\link[qdapRegex]{regex_supplement}}) 
#' dictionaries for regular expressions before pasting them together with a pipe 
#' (\code{|}) separator.
#' 
#' @param \ldots Regular expressions to paste together or a named expression 
#' from the default regular expression dictionary prefixed with single at 
#' (\code{@@}) (e.g., \code{"@@rm_hash"}) or a regular expression from 
#' \code{\link[qdapRegex]{regex_supplement}} dictionary prefixed with an at 
#' (\code{@@}) (e.g., \code{"@@time_12_hours"}).
#' @param sep The separator to use between the expressions when they are 
#' collapsed.
#' @param dictionary A dictionary of canned regular expressions to search within.
#' @return Returns a single string of regular expressions pasted together with 
#' pipe(s) (\code{|}).
#' @keywords paste regex 
#' @note Note that while \code{pastex} is designed for pasting purposes it can 
#' also be used to call a single regex from the default regional dictionary or 
#' the supplemental dictionary (\code{\link[qdapRegex]{regex_supplement}}) (see 
#' \bold{Examples}).
#' @rdname pastex
#' @include rm_default.R utils.R
#' @export
#' @seealso \code{\link[base]{paste}}
#' @examples
#' x <- c("There is $5.50 for me.", "that's 45.6% of the pizza",
#'     "14% is $26 or $25.99", "It's 12:30 pm to 4:00 am")
#' 
#' pastex("@@rm_percent", "@@rm_dollar")
#' pastex("@@rm_percent", "@@time_12_hours")
#' 
#' rm_dollar(x, extract=TRUE, pattern=pastex("@@rm_percent", "@@rm_dollar"))
#' rm_dollar(x, extract=TRUE, pattern=pastex("@@rm_dollar", "@@rm_percent", "@@time_12_hours"))
#' 
#' ## retrieve regexes from dictionary
#' pastex("@@rm_email")
#' pastex("@@rm_url3")
#' pastex("@@version")
#' 
#' ## pipe operator (%|%)
#' "x" %|% "y"
#' "@@rm_url" %|% "@@rm_twitter_url"
#' 
#' ## pipe operator (%p%)
#' "x" %+% "y"
#' "@@rm_time" %+% "\\s[AP]M"
#' 
#' ## Remove Twitter Short URL
#' x <- c("download file from http://example.com", 
#'          "this is the link to my website http://example.com", 
#'          "go to http://example.com from more info.",
#'          "Another url ftp://www.example.com",
#'          "And https://www.example.net",
#'          "twitter type: t.co/N1kq0F26tG",
#'          "still another one https://t.co/N1kq0F26tG :-)")
#' 
#' rm_twitter_url(x)
#' rm_twitter_url(x, extract=TRUE)
#' 
#' ## Combine removing Twitter URLs and standard URLs
#' rm_twitter_n_url <- rm_(pattern="@@rm_twitter_url" %|% "@@rm_url")  
#' rm_twitter_n_url(x)
#' rm_twitter_n_url(x, extract=TRUE)
pastex <-
function (..., sep = "|", dictionary = getOption("regex.library")) {
    out <- lapply(list(...), function(x) {
        if (length(x) > 1) return(x)
        reg_check(x, dictionary = dictionary)
    })

    paste(unlist(out), collapse = sep)
}




#' Paste Regular Expressions
#' 
#' \code{\%|\%} - A binary operator version of \code{pastex} that joins two 
#' character strings with a regex or ("|").  Equivalent to 
#' \code{pastex(x, y, sep="|")}.
#' 
#' @param x,y Two regular expressions to paste together.
#' @rdname pastex
#' @export 
`%|%` <- function(x, y) pastex(x, y)


#' Paste Regular Expressions
#' 
#' \code{\%+\%} - A binary operator version of \code{pastex} that joins two 
#' character strings with no space. Equivalent to \code{pastex(x, y, sep="")}.
#' 
#' @rdname pastex
#' @export 
`%+%` <- function(x, y) pastex(x, y, sep="")

