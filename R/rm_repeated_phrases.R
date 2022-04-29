#' Remove/Replace/Extract Repeating Phrases
#' 
#' Remove/replace/extract repeating phrases from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_repeated_phrases} uses the 
#' \code{rm_repeated_phrases} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the repeated phrases are extracted 
#' into a list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with percentages removed.
#' @author \href{https://stackoverflow.com/}{stackoverflow's} BrodieG and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @keywords phrases repeat
#' @family rm_ functions
#' @include utils.R
#' @references \url{https://stackoverflow.com/a/28786617/1000343}
#' @export
#' @rdname rm_repeated_phrases
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
#' rm_repeated_phrases(x)
#' ex_repeated_phrases(x)
rm_repeated_phrases <- hijack(rm_default, pattern = "@rm_repeated_phrases") 

#' @export
#' @rdname rm_repeated_phrases
ex_repeated_phrases <- hijack(rm_repeated_phrases, extract=TRUE)

