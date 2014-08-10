#' Remove/Replace/Extract Numbers
#' 
#' Remove/replace/extract number from a string (works on numbers with commas, decimals and negatives).
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
#' @param extract logical.  If \code{TRUE} the numbers are extracted into a 
#' list of vectors.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with number removed.
#' @keywords number
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @references The number regular expression was taken from: 
#' \url{http://stackoverflow.com/a/5917250/1000343} authored by Justin Morgan.
#' @examples
#' x <- c("-2 is an integer.  -4.3 and 3.33 are not.",
#'     "123,456 is alot mor than -.2", 
#'     "hello world -.q")
#' rm_number(x)
#' rm_number(x, extract=TRUE)
rm_number <- function(text.var, trim = TRUE, clean = TRUE,
    pattern = qdapRegex::RE[["rm_number"]], replacement = "", extract = FALSE, 
	...) {

    if (extract) {
        return(lapply(regmatches(text.var, gregexpr(pattern, text.var, 
            perl = TRUE)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}

