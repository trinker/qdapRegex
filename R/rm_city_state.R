#' Remove/Replace/Extract City & State
#' 
#' Remove/replace/extract city (single lower case word or multiple consecutive 
#' capitalized words before a comma and state) & state (2 consecutive capital 
#' letters) from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_city_state} uses the 
#' \code{rm_city_state} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the city & state are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with city & state removed.
#' @keywords date
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_city_state
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- paste0("I went to Washington Heights, NY for food! ", 
#'    "It's in West ven,PA, near Bolly Bolly Bolly, CA!", 
#'    "I like Movies, PG13")
#' rm_city_state(x)
#' ex_city_state(x)
rm_city_state <- hijack(rm_default, pattern = "@rm_city_state") 

#' @export
#' @rdname rm_city_state
ex_city_state <- hijack(rm_city_state, extract=TRUE)

