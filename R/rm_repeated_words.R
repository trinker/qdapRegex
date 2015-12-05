#' Remove/Replace/Extract Repeating Words
#' 
#' Remove/replace/extract repeating words from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_repeated_words} uses the 
#' \code{rm_repeated_words} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the repeated words are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with percentages removed.
#' @keywords words repeat
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_repeated_words
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c(
#'     "this is a big is a Big deal",
#'     "I want want to see",
#'     "I want, want to see",
#'     "I want...want to see see see how",
#'     "I like it. It is cool",
#'     "this is a big is a Big deal for those of, those of you who are."
#' )
#' 
#' rm_repeated_words(x)
#' ex_repeated_words(x)
rm_repeated_words <- hijack(rm_default, pattern = "@rm_repeated_words") 

#' @export
#' @rdname rm_repeated_words
ex_repeated_words <- hijack(rm_repeated_words, extract=TRUE)

