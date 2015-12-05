#' Remove/Replace/Extract All Caps Phrases
#' 
#' Remove/replace/extract 'all caps' phrases containing 1 or more consecutive 
#' upper case letters from a string.  If one word phrase the word must be 3+ 
#' letters long.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_caps_phrae} uses the 
#' \code{rm_caps_phrase} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the all caps strings are extracted 
#' into a list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with "all caps phrases" removed.
#' @keywords caps capital
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_caps_phrase
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c("UGGG! When I use caps I am YELLING!",
#'    "Or it may mean this is VERY IMPORTANT!",
#'    "or trying to make a LITTLE SEEM like IT ISN'T LITTLE"
#' )
#' rm_caps_phrase(x)
#' ex_caps_phrase(x)
rm_caps_phrase <- hijack(rm_default, pattern = "@rm_caps_phrase") 

#' @export
#' @rdname rm_caps_phrase
ex_caps_phrase <- hijack(rm_caps_phrase, extract=TRUE)

