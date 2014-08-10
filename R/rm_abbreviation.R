#' Remove/Replace/Extract Abbreviations
#' 
#' Remove/replace/extract abbreviations from a string containing lower case or 
#' captial letters followed by a period and then an optional space (this must be 
#' repeated 2 or more times).
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
#' @param extract logical.  If \code{TRUE} the abbreviations are extracted into a 
#' list of vectors.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with abbreviations removed.
#' @keywords abbreviation
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @examples
#' x <- c("I want $2.33 at 2:30 p.m. to go to A.n.p.",
#'     "She will send it A.S.A.P. (e.g. as soon as you can) said I.",
#'     "Hello world.", "In the U. S. A.")
#' rm_abbreviation(x)
#' rm_abbreviation(x, extract=TRUE)
rm_abbreviation <- function(text.var, trim = TRUE, clean = TRUE,
    pattern = qdapRegex::RE[["rm_abbreviation"]], replacement = "", 
	extract = FALSE, ...) {

    if (extract) {
        return(lapply(regmatches(text.var, gregexpr(pattern, text.var, 
            perl = TRUE)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}
