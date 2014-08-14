#' Remove/Replace/Extract All Caps
#' 
#' Remove/replace/extract 'all caps' words containing 2 or more consecutive 
#' upper case letters from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_caps} uses the 
#' \code{rm_caps} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the all caps strings are extracted 
#' into a list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with "all caps" removed.
#' @keywords caps capital
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @examples
#' x <- c("UGGG! When I use caps I am YELLING!")
#' rm_caps(x)
#' rm_caps(x, replacement="\\L\\1")
#' rm_caps(x, extract=TRUE)
rm_caps <- function(text.var, trim = !extract, clean = TRUE,
    pattern = "@rm_caps", replacement = "", extract = FALSE, 
    dictionary = getOption("regex.library"), ...) {

	pattern <- reg_check(pattern = pattern, dictionary = dictionary)

    if (extract) {
    	if (!trim) {
            return(regmatches(text.var, gregexpr(pattern, text.var, perl = TRUE)))
    	}
    	return(lapply(regmatches(text.var, gregexpr(pattern, text.var, 
            perl = TRUE)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}
