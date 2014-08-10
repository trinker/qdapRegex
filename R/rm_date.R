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
#' character vector.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the dates are extracted into a 
#' list of vectors.
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
    pattern = qdapRegex::RE[["rm_date"]], replacement = "", extract = FALSE, ...) {

    if (extract) {
        return(lapply(regmatches(text.var, gregexpr(pattern, text.var, 
            perl = TRUE)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}

