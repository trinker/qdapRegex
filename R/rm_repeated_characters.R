#' Remove/Replace/Extract Words With Repeating Characters
#' 
#' Remove/replace/extract words with repeating characters.  The word must 
#' contain characters, each repeating at east 2 times
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_repeated_characters} uses the 
#' \code{rm_repeated_characters} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the words with repeating characters 
#' are extracted into a list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with percentages removed.
#' @author \href{https://stackoverflow.com/}{stackoverflow's} vks and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @keywords characters repeat
#' @family rm_ functions
#' @include utils.R
#' @references \url{https://stackoverflow.com/a/29438461/1000343}
#' @export
#' @rdname rm_repeated_characters
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- "aaaahahahahaha that was a good joke peep and pepper and pepe"
#' rm_repeated_characters(x)
#' ex_repeated_characters(x)
rm_repeated_characters <- hijack(rm_default, pattern = "@rm_repeated_characters") 

#' @export
#' @rdname rm_repeated_characters
ex_repeated_characters <- hijack(rm_repeated_characters, extract=TRUE)

