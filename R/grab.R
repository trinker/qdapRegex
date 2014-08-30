#' Grab Regular Expressions from Dictionaries
#' 
#' A conveinence function to 
#' 
#' @param pattern A character string starting with \code{"@@"} and a regular 
#' expression from a pkg{qdapRegex} dictionary.
#' @param dictionary A dictionary of canned regular expressions to search within.
#' @return Returns a single string regular expressionfrom one of the pkg{qdapRegex} 
#' dictionaries.
#' @keywords get grab
#' @export
#' @examples
#' grab("@@rm_white")
#' \dontrun{
#' ## Throws an error
#' grab("@@foo")
#' }
grab <- function (pattern, dictionary = getOption("regex.library")) {

    if (substring(pattern, 1, 1) != "@") pattern <- paste0("@", pattern)

    out <- reg_check(pattern, dictionary = dictionary)

    if (out == pattern) stop("pattern not found in dictionaries")
    out
}
