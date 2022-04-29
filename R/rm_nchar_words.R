#' Remove/Replace/Extract N Letter Words
#' 
#' Remove/replace/extract words that are n letters in length (apostrophes not 
#' counted).
#' 
#' @param text.var The text variable.
#' @param n The number of letters counted in the word.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector (see \bold{Details} for additional information).  Default, 
#' \code{@@rm_nchar_words} uses the \code{rm_nchar_words} regex from the regular 
#' expression dictionary from the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the n letter words are extracted into a 
#' list of vectors.  
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with n letter words removed.
#' @keywords words
#' @details The default regular expression used by \code{rm_nchar_words} counts 
#' letter length, not characters.  This means that apostrophes are not include 
#' in the character count.  This behavior can be altered (to include apostrophes
#' in the character count) by using a secondary regular expression from the 
#' \code{\link[qdapRegex]{regex_usa}} data (or other dictionary) via 
#' (\code{pattern = "@@rm_nchar_words2"}). See \bold{Examples} for example
#' usage. 
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_nchar_words
#' @author \href{https://stackoverflow.com/}{stackoverflow's} CharlieB and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The n letter/character word regular expression was taken from: 
#' \url{https://stackoverflow.com/a/25243885/1000343}
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- "This is Jon's dogs' 'bout there in a word Mike's re'y."
#' rm_nchar_words(x, 4)
#' ex_nchar_words(x, 4)
#' 
#' ## Count characters (apostrophes and letters)
#' ex_nchar_words(x, 5, pattern = "@@rm_nchar_words2")
#' 
#' ## nchar range
#' rm_nchar_words(x, "1,2")
#' 
#' \dontrun{
#' ## Larger example
#' library(qdap)
#' ex_nchar_words(hamlet[["dialogue"]], 5)
#' }
rm_nchar_words <- function(text.var, n, trim = !extract, clean = TRUE,
    pattern = "@rm_nchar_words", replacement = "", extract = FALSE, 
	dictionary = getOption("regex.library"), ...) {

	pattern <- reg_check_sprintf(pattern = pattern, dictionary = dictionary, n=n)

    if (extract) {
    	if (!trim) {
            return(ext(stringi::stri_extract_all_regex(text.var, pattern)))
    	}
    	return(ext(lapply(return(stringi::stri_extract_all_regex(text.var, pattern)), 
            Trim)))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
} 

#' @export
#' @rdname rm_nchar_words
ex_nchar_words <- hijack(rm_nchar_words, extract=TRUE)

