#' Remove/Replace/Extract Postal Codes
#' 
#' Remove/replace/extract postal codes.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_postal_code} uses the 
#' \code{rm_postal_code} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the city & state are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with postal codes removed.
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_postal_code
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c("Anchorage, AK", "New York City, NY", "Some Place, Another Place, LA")
#' rm_postal_code(x)
#' ex_postal_code(x)
rm_postal_code <- hijack(rm_default, pattern = "@rm_postal_code") 

#' @export
#' @rdname rm_postal_code
ex_postal_code <- hijack(rm_postal_code, extract=TRUE)

