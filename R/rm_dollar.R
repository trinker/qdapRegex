#' Remove/Replace/Extract Dollars
#' 
#' Remove/replace/extract dollars amounts from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_dollar} uses the 
#' \code{rm_dollar} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the dollar strings are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with dollars removed.
#' @keywords percent
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_dollar
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <-  c("There is $5.50 for me.", "that's 45.6% of the pizza", 
#'     "14% is $26 or $25.99", "Really?...$123,234.99 is not cheap.")
#'
#' rm_dollar(x)
#' ex_dollar(x)
rm_dollar <- hijack(rm_default, pattern = "@rm_dollar") 

#' @export
#' @rdname rm_dollar
ex_dollar <- hijack(rm_dollar, extract=TRUE)

