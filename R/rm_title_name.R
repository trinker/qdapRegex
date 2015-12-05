#' Remove/Replace/Extract Title + Person Name
#' 
#' Remove/replace/extract title (honorific) + person name(s) from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_title_name} uses the 
#' \code{rm_title_name} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the person tags are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with person tags removed.
#' @keywords person tag twitter
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_title_name
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c("Dr. Brend is mizz hart's in mrs. Holtz's.", 
#'     "Where is mr. Bob Jr. and Ms. John Kennedy?")
#' 
#' rm_title_name(x)
#' ex_title_name(x)
rm_title_name <- hijack(rm_default, pattern = "@rm_title_name") 

#' @export
#' @rdname rm_title_name
ex_title_name <- hijack(rm_title_name, extract=TRUE)

