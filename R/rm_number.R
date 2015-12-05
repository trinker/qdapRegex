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
#' @export
#' @rdname rm_number
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @references The number regular expression was created by Jason Gray.
#' @examples
#' x <- c("-2 is an integer.  -4.3 and 3.33 are not.",
#'     "123,456 is 0 alot -123456 more than -.2", "and 3456789123 fg for 345.",
#'     "fg 12,345 23 .44 or 18.", "don't remove this 444,44", "hello world -.q")
#' 
#' rm_number(x)
#' ex_number(x)
#' 
#' ##Convert to numeric
#' as_numeric(ex_number(x))   # retain list
#' as_numeric2(ex_number(x))  # unlist
rm_number <- hijack(rm_default, pattern = "@rm_number")


#' Remove/Replace/Extract Numbers
#' 
#' \code{as_numeric} - A wrapper for \code{as.numeric(gsub(",", "", x))}, which
#' removes commas and converts a list of vectors of strings to numeric.  If the 
#' string cannot be converted to numeric \code{NA} is returned.
#' 
#' @param x a character vector to convert to a numeric vector.
#' @return \code{as_numeric} - Returns a list of vectors of numbers.
#' @export
#' @rdname rm_number
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
#' @return \code{as_numeric2} - Returns an unlisted vector of numbers.
as_numeric2 <- function(x) {
    unlist(as_numeric(x))
}

 

#' @export
#' @rdname rm_number
ex_number <- hijack(rm_number, extract=TRUE)

