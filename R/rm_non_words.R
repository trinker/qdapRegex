#' Remove/Replace/Extract Non-Words
#' 
#' \code{rm_non_words} - Remove/replace/extract non-words (Anything that's not a 
#' letter or apostrophe; also removes multiple white spaces) from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_non_words} uses the 
#' \code{rm_non_words} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern} (\bold{\emph{Note:}} default is 
#' " ", whereas most \pkg{qdapRegex} functions replace with "").
#' @param extract logical.  If \code{TRUE} the non-words are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with non-words removed.
#' @keywords non-words
#' @note Setting the argument \code{extract = TRUE} is not very useful.  Use the
#' following setup instead (see \bold{Examples} for a demonstration).\cr
#' 
#' \code{rm_default(x, pattern = "[^A-Za-z' ]", extract=TRUE)}
#' @family rm_ functions
#' @include utils.R rm_default.R
#' @export
#' @rdname rm_non_words
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c(
#'     "I like 56 dogs!",
#'     "It's seventy-two feet from the px290.",
#'     NA,
#'     "What",
#'     "that1is2a3way4to5go6.",
#'     "What do you*% want?  For real%; I think you'll see.",
#'     "Oh some <html>code</html> to remove"
#' )
#' 
#' rm_non_words(x)
#' ex_non_words(x)
rm_non_words <- hijack(rm_default, pattern = "@rm_non_words", replacement = " ")

 

#' @export
#' @rdname rm_non_words
ex_non_words <- hijack(rm_non_words, extract=TRUE, pattern = "[^A-Za-z' ]+")

