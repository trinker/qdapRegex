#' Remove/Replace/Extract Title + Person Name
#' 
#' Remove/replace/extract title (honorific) + person name(s) from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_title_name} uses the 
#' \code{rm_title_name} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the person tags are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with person tags removed.
#' @keywords person tag twitter
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @examples
#' x <- c("Dr. Brend is mizz hart's in mrs. Holtz's.", 
#'     "Where is mr. Bob Jr. and Ms. John Kennedy?")
#' 
#' rm_title_name(x)
#' rm_title_name(x, extract=TRUE)
rm_title_name <- function(text.var, trim = !extract, clean = TRUE, 
	pattern = "@rm_title_name", replacement = "", extract = FALSE, 
	dictionary = getOption("regex.library"), ...) {

	pattern <- reg_check(pattern = pattern, dictionary = dictionary)

    if (extract) {
    	if (!trim) {
            return(regmatches(text.var, gregexpr(pattern, text.var, perl = TRUE)))
    	}
    	return(lapply(regmatches(text.var, gregexpr(pattern, text.var, 
            perl = TRUE)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}