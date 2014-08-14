#' Remove/Replace/Extract URLs
#' 
#' Remove/replace/extract URLs from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_url} uses the 
#' \code{rm_url} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the URLs are extracted into a list 
#' of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with URLs removed.
#' @keywords url www http
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @examples
#' x <- " I like www.talkstats.com and http://stackoverflow.com"
#' rm_url(x)
#' rm_url(x, replacement = '<a href="\\1" target="_blank">\\1</a>')
#' rm_url(x, extract=TRUE)
rm_url <- function(text.var, trim = TRUE, clean = TRUE, pattern = "@rm_url", 
	replacement = "", extract = FALSE, dictionary = getOption("regex.library"), 
	...) {

	pattern <- reg_check(pattern = pattern, dictionary = dictionary)

    if (extract) {
        return(regmatches(text.var, gregexpr(pattern, text.var, perl = TRUE)))
    }
    
    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}
