#' Remove/Replace/Extract All Caps
#' 
#' Remove/replace/extract 'all caps' words containing 2 or more characters from 
#' a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the times are extracted into a 
#' list of vectors.
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
rm_caps <- function(text.var, trim = TRUE, clean = TRUE,
    pattern = "(\\b[A-Z]{2,}\\b)", replacement = "", extract = FALSE, ...) {

    if (extract) {
        return(lapply(regmatches(text.var, gregexpr(pattern, text.var, 
            perl = TRUE)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}
