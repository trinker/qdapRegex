#' Remove/Replace/Extract Time
#' 
#' Remove/replace/extract time from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_time} uses the 
#' \code{rm_time} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the times are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with time removed.
#' @keywords time
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @author \href{http://stackoverflow.com/}{stackoverflow's} hwnd and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The time regular expression was taken from: 
#' \url{http://stackoverflow.com/a/25111133/1000343}
#' @examples
#' x <-  c("R uses 1:5 for 1, 2, 3, 4, 5.", 
#'     "At 3:00 we'll meet up and leave by 4:30:20",
#'     "We'll meet at 6:33.", "He ran it in :22.34")
#'
#' rm_time(x)
#' rm_time(x, extract=TRUE)
rm_time <- function(text.var, trim = !extract, clean = TRUE, pattern = "@rm_time", 
	replacement = "", extract = FALSE, dictionary = getOption("regex.library"), 
	...) {

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
