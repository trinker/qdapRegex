#' Remove/Replace/Extract All Caps
#' 
#' Remove/replace/extract 'all caps' words containing 2 or more consecutive 
#' upper case letters from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_caps} uses the 
#' \code{rm_caps} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the all caps strings are extracted 
#' into a list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with "all caps" removed.
#' @keywords caps capital
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_caps
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c("UGGG! When I use caps I am YELLING!")
#' rm_caps(x)
#' rm_caps(x, replacement="\\L\\1")
#' ex_caps(x)
rm_caps <- hijack(rm_default, pattern = "@rm_caps") 

#' @export
#' @rdname rm_caps
ex_caps <- hijack(rm_caps, extract=TRUE)

