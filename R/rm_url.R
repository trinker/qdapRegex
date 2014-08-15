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
#' @details The default regex pattern \code{"(http[^ ]*)|(www\\.[^ ]*)"} is more 
#' liberal.  More constained versions can be accessed
#' via \code{pattern = "@@rm_url2"} & \code{pattern = "@@rm_url3"} see 
#' \bold{Examples}).
#' @keywords url www http
#' @references The more constrained url regular expressions (\code{"@@rm_url2"}
#' and \code{"@@rm_url3"} was adapted from imme_emosol's response: 
#' \url{https://mathiasbynens.be/demo/url-regex}
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @examples
#' x <- " I like www.talkstats.com and http://stackoverflow.com"
#' rm_url(x)
#' rm_url(x, replacement = '<a href="\\1" target="_blank">\\1</a>')
#' rm_url(x, extract=TRUE)
#' 
#' rm_url(x, pattern = "@@rm_url2", extract=TRUE)
#' rm_url(x, pattern = "@@rm_url3", extract=TRUE)
rm_url <- function(text.var, trim = !extract, clean = TRUE, pattern = "@rm_url", 
	replacement = "", extract = FALSE, dictionary = getOption("regex.library"), 
	...) {

	pattern <- reg_check(pattern = pattern, dictionary = dictionary)

    if (extract) {
    	if (!trim) {
            return(stringi::stri_extract_all_regex(text.var, pattern))
    	}
    	return(lapply(return(stringi::stri_extract_all_regex(text.var, pattern)), Trim))
    }
    
    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}
