#' Remove/Replace/Extract City & State
#' 
#' Remove/replace/extract city (single lower case word or multiple consecutive capitalized words before a comma and state) & state (2 consecutive capital letters) from a string in the form of XX/XX/XXXX, 
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
#' @param extract logical.  If \code{TRUE} the city & state are extracted into a 
#' list of vectors.
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
rm_city_state <- function(text.var, trim = TRUE, clean = TRUE,
    pattern = qdapRegex::RE[["rm_city_state"]], replacement = "", extract = FALSE, ...) {

    if (extract) {
        return(lapply(regmatches(text.var, gregexpr(pattern, text.var, 
            perl = TRUE)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}
