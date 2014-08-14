#' Remove/Replace/Extract Phone Numbers
#' 
#' Remove/replace/extract phone numbers from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_phone} uses the 
#' \code{rm_phone} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the phone numbers are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with phone numbers removed.
#' @keywords phone telephone
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @author \href{http://stackoverflow.com/}{stackoverflow's} Marius and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The phone regular expression was taken from: 
#' \url{http://stackoverflow.com/a/21008254/1000343}
#' @examples
#' x <- c(" Mr. Bean bought 2 tickets 2-613-213-4567 or 5555555555 call either one",
#'   "43 Butter Rd, Brossard QC K0A 3P0 - 613 213 4567", 
#'   "Please contact Mr. Bean (613)2134567",
#'   "1.575.555.5555 is his #1 number",  
#'   "7164347566",
#'   "I like 1234567 dogs"
#' )
#'
#' rm_phone(x)
#' rm_phone(x, extract=TRUE)
rm_phone <- function(text.var, trim = !extract, clean = TRUE, 
	pattern = "@rm_phone", replacement = "", extract = FALSE, 
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


