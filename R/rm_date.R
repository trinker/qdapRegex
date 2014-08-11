#' Remove/Replace/Extract Dates
#' 
#' Remove/replace/extract dates from a string in the form of XX/XX/XXXX, 
#' XX/XX/XX, XX-XX-XXXX, XX-XX-XX, XX.XX.XXXX, or XX.XX.XX.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_date} uses the 
#' \code{rm_date} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the dates are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with dates removed.
#' @keywords date
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @examples
#' x <- paste0("Format dates as 04/12/2014, 04-12-2014, 04.12.2014. or",
#'     " 04/12/14 but leaves mismatched: 12.12/2014")
#' rm_date(x)
#' rm_date(x, extract=TRUE)
rm_date <- function(text.var, trim = TRUE, clean = TRUE,
    pattern = "@rm_date", replacement = "", extract = FALSE, 
    dictionary = getOption("regex.library"), ...) {

	pattern <- reg_check(pattern = pattern, dictionary = dictionary)

    if (extract) {
        return(lapply(regmatches(text.var, gregexpr(pattern, text.var, 
            perl = TRUE)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}

