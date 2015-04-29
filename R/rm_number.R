#' Remove/Replace/Extract Numbers
#' 
#' \code{rm_number} - Remove/replace/extract number from a string (works on 
#' numbers with commas, decimals and negatives).
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_number} uses the 
#' \code{rm_number} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the numbers are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return \code{rm_number} - Returns a character string with number removed.
#' @keywords number
#' @family rm_ functions
#' @include utils.R
#' @rdname rm_number
#' @export
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @references The number regular expression was taken from: 
#' \url{http://stackoverflow.com/a/5917250/1000343} authored by Justin Morgan.
#' @examples
#' x <- c("-2 is an integer.  -4.3 and 3.33 are not.",
#'     "123,456 is a lot more than -.2", 
#'     "hello world -.q")
#' rm_number(x)
#' rm_number(x, extract=TRUE)
#' 
#' ##Convert to numeric
#' lapply(rm_number(x, extract=TRUE), as_numeric)
#' lapply(rm_number(x, extract=TRUE), as_numeric2)
rm_number <- hijack(rm_default, pattern = "@rm_number")


#' Remove/Replace/Extract Numbers
#' 
#' \code{as_numeric} - A wrapper for \code{as.numeric(gsub(",", "", x))}, which
#' removes commas and converts a list of vectors of strings to numeric.  If the 
#' string cannot be converted to numeric \code{NA} is returned.
#' 
#' @param x a character vector to convert to a numeric vector.
#' @rdname rm_number
#' @return \code{as_numeric2} - Returns a list of vectors of numbers.
#' @export
as_numeric <- function(x) {
    lapply(x, function(y){
        as.numeric(gsub(",", "", y))
    })
}

#' Remove/Replace/Extract Numbers
#' 
#' \code{as_numeric2} - A convenience function for \code{as_numeric} that 
#' unlists and returns a vector rather than a list.
#' 
#' @rdname rm_number
#' @export
#' @return \code{as_numeric2} - Returns a vector of numbers.
as_numeric2 <- function(x) {
    unlist(as_numeric(x))
}


