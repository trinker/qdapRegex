#' Grab Regular Expressions from Dictionaries
#' 
#' convenience function to 
#' 
#' @param pattern A character string starting with \code{"@@"} that is a regular 
#' expression from a \pkg{qdapRegex} dictionary.
#' @param dictionary A dictionary of canned regular expressions to search within.
#' @return Returns a single string regular expression from one of the 
#' \pkg{qdapRegex} dictionaries.
#' @keywords get grab
#' @details Many R regular expressions contain doubled backslashes that are not 
#' used in other regex interpreters.  Using \code{\link[base]{cat}} can remove 
#' backslash escapes (see \bold{Examples}) or \code{\link[utils]{URLencode}}
#' if using in a url.
#' @export
#' @examples
#' grab("@@rm_white")
#' \dontrun{
#' ## Throws an error
#' grab("@@foo")
#' }
#' cat(grab("@@pages2"))
#' \dontrun{
#' cat(grab("@@pages2"), file="clipboard")
#' }
grab <- function (pattern, dictionary = getOption("regex.library")) {

    pattern <- gsub("^@?ex_", "rm_", pattern)
    if (substring(pattern, 1, 1) != "@") pattern <- paste0("@", pattern)

    out <- reg_check(pattern, dictionary = dictionary)

    if (out == pattern) stop("pattern not found in dictionaries")
    out
}
