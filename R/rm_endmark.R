#' Remove/Replace/Extract Endmarks
#' 
#' Remove/replace/extract endmarks from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_endmark} uses the 
#' \code{rm_dollar} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the endmark strings are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with endmarks removed.
#' @keywords percent
#' @details The default regular expression used by \code{rm_endmark} finds 
#' endmark punctuation used in the \pkg{qdap} package; this includes ! . ? * AND
#' |.  This behavior can be altered (to ; AND : or to use just ! . AND ?) by 
#' using a secondary regular expression from the 
#' \code{\link[qdapRegex]{regex_usa}} data (or other dictionary) via 
#' (\code{pattern = "@@rm_endmark2"} or \code{pattern = "@@rm_endmark3"}). See 
#' \bold{Examples} for example usage.
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_endmark
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c("I like the dog.", "I want it *|", "I;", 
#'     "Who is| that?", "Hello world", "You...")
#' 
#' rm_endmark(x)
#' ex_endmark(x)
#' 
#' rm_endmark(x, pattern="@@rm_endmark2")
#' ex_endmark(x, pattern="@@rm_endmark2")
#' 
#' rm_endmark(x, pattern="@@rm_endmark3")
#' ex_endmark(x, pattern="@@rm_endmark3")
rm_endmark <- hijack(rm_default, pattern = "@rm_endmark") 

#' @export
#' @rdname rm_endmark
ex_endmark <- hijack(rm_endmark, extract=TRUE)

