#' Remove/Replace/Extract Emoticons 
#' 
#' Remove/replace/extract common emoticons from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_emoticon} uses the 
#' \code{rm_emoticon} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the emoticons are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with emoticons removed.
#' @keywords emoticon digispeak
#' @export
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c("are :-)) it 8-D he XD on =-D they :D of :-) is :> for :o) that :-/",
#'   "as :-D I xD with :^) a =D to =) the 8D and :3 in =3 you 8) his B^D was")
#' 
#' rm_emoticon(x)
#' rm_emoticon(x, extract=TRUE)
rm_emoticon <- function(text.var, trim = !extract, clean = TRUE, 
    pattern = "@rm_emoticon", replacement = "", extract = FALSE, 
	dictionary = getOption("regex.library"), ...) {

	pattern <- reg_check(pattern = pattern, dictionary = dictionary)

    if (extract) {
    	if (!trim) {
            return(stringi::stri_extract_all_regex(text.var, pattern))
    	}
    	return(lapply(return(stringi::stri_extract_all_regex(text.var, pattern)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}
