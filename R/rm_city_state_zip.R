#' Remove/Replace/Extract City, State, & Zip
#' 
#' Remove/replace/extract city (single lower case word or multiple consecutive 
#' capitalized words before a comma and state) + state (2 consecutive capital 
#' letters) + zip code (5 digits or 5 + 4 digits) from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_city_state_zip} uses the 
#' \code{rm_city_state_zip} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the city, state, & zip are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with city, state, & zip removed.
#' @keywords date
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_city_state_zip
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- paste0("I went to Washington Heights, NY 54321 for food! ", 
#'    "It's in West ven,PA 12345, near Bolly Bolly Bolly, CA12345-1234!", 
#'    "hello world")
#' rm_city_state_zip(x)
#' ex_city_state_zip(x)
rm_city_state_zip <- hijack(rm_default, pattern = "@rm_city_state_zip") 

#' @export
#' @rdname rm_city_state_zip
ex_city_state_zip <- hijack(rm_city_state_zip, extract=TRUE)

