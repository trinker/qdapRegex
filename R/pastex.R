#' Paste Regular Expressions
#' 
#' A wrapper for \code{paste(collapse="|")} that also searches the default and 
#' supplemental (\code{\link[qdapRegex]{regex_supplement}}) dictionaries for 
#' regular expressions before pasting them together with a pipe \code{|} separator.
#' 
#' @param \ldots Ray regular expressions to paste together or a named expression 
#' from the default regular expression dictionary prefixed with single at 
#' (\code{@@}) (e.g., \code{"@@rm_hash"}) or a regular expression from 
#' \code{\link[qdapRegex]{regex_supplement}} dictionary prefixed with double at 
#' (\code{@@@@}) (e.g., \code{"@@@@time_12_hours"}).
#' @param dictionary A dictionary of canned regular expressions to search within.
#' @return Returns a single string of regular expressions pasted together with 
#' pipe(s) (\code{|}).
#' @keywords paste regex 
#' @note Note that while \code{pastex} is designed for pasting purposes it can 
#' also be used to call a single regex from the default regional dictionary or 
#' the supplemental dictionary (\code{\link[qdapRegex]{regex_supplement}}) (see 
#' \bold{Examples}).
#' @export
#' @seealso \code{\link[base]{paste}}
#' @examples
#' x <- c("There is $5.50 for me.", "that's 45.6% of the pizza",
#'     "14% is $26 or $25.99", "It's 12:30 pm to 4:00 am")
#' 
#' pastex("@@rm_percent", "@@rm_dollar")
#' pastex("@@rm_percent", "@@@@time_12_hours")
#' 
#' rm_dollar(x, extract=TRUE, pattern=pastex("@@rm_percent", "@@rm_dollar"))
#' rm_dollar(x, extract=TRUE, pattern=pastex("@@rm_dollar", "@@rm_percent", "@@@@time_12_hours"))
#' 
#' ## retrieve regexes from dictionary
#' pastex("@@rm_email")
#' pastex("@@rm_url3")
#' pastex("@@@@version")
pastex <- function(..., dictionary = getOption("regex.library")){

    out <- lapply(list(...), reg_check, dictionary=dictionary)
    paste(unlist(out), collapse="|")

}
