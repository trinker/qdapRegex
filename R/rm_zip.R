#' Remove/Replace/Extract Zip Codes
#' 
#' Remove/replace/extract zip codes from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_zip} uses the 
#' \code{rm_zip} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the zip codes are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with U.S. 5 and 5+4 zip codes removed.
#' @keywords zip
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @author \href{http://stackoverflow.com/}{stackoverflow's} hwnd and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The time regular expression was taken from: 
#' \url{http://stackoverflow.com/a/25223890/1000343}
#' @examples
#' x <- c("Mr. Bean bought 2 tickets 2-613-213-4567",
#'   "43 Butter Rd, Brossard QC K0A 3P0 - 613 213 4567", 
#'   "Rat Race, XX, 12345",
#'   "Ignore phone numbers(613)2134567",
#'   "Grab zips with dashes 12345-6789 or no space before12345-6789",  
#'   "Grab zips with spaces 12345 6789 or no space before12345 6789",
#'   "I like 1234567 dogs"
#' )
#'
#' rm_zip(x)
#' rm_zip(x, extract=TRUE)
rm_zip <- function(text.var, trim = !extract, clean = TRUE, pattern ="@rm_zip", 
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
