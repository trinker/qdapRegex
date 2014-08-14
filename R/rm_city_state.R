#' Remove/Replace/Extract City & State
#' 
#' Remove/replace/extract city (single lower case word or multiple consecutive 
#' capitalized words before a comma and state) & state (2 consecutive capital 
#' letters) from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_city_state} uses the 
#' \code{rm_city_state} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the city & state are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with city & state removed.
#' @keywords date
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @examples
#' x <- paste0("I went to Washington Heights, NY for food! ", 
#'    "It's in West ven,PA, near Bolly Bolly Bolly, CA!", 
#'    "I like Movies, PG13")
#' rm_city_state(x)
#' rm_city_state(x, extract=TRUE)
rm_city_state <- function(text.var, trim = !extract, clean = TRUE,
    pattern = "@rm_city_state", replacement = "", extract = FALSE, 
	dictionary = getOption("regex.library"), ...) {

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
