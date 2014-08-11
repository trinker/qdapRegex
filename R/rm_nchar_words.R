#' Remove/Replace/Extract N Letter Words
#' 
#' Remove/replace/extract words that are n letters in length (apostrophes not counted).
#' 
#' @param text.var The text variable.
#' @param n The number of letters counted in the word.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the n letter words are extracted into a 
#' list of vectors.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with n letter words removed.
#' @keywords words
#' @export
#' @author \href{http://stackoverflow.com/}{stackoverflow's} hwnd and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The time regular expression was taken from: 
#' \url{http://stackoverflow.com/a/25234538/1000343}
#' @seealso \code{\link[base]{gsub}}
#' @examples
#' x <- "This Jon's dogs' 'bout there in word Mike's re'y."
#' rm_nchar_words(x, 4)
#' rm_nchar_words(x, 4, extract=TRUE)
#' \dontrun{
#' rm_nchar_words(hamlet$dialogue, 5, extract=TRUE)
#' }
rm_nchar_words <- function(text.var, n, trim = TRUE, clean = TRUE,
    pattern = sprintf("(?i)(?:'?[a-z]){%s}(*SKIP)(*F)|('?\\b[a-z](?:'?[a-z]){%s}\\b'?)", 
    	n + 1, n - 1), replacement = "", extract = FALSE, ...) {

    if (extract) {
        return(lapply(regmatches(text.var, gregexpr(pattern, text.var, 
            perl = TRUE)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}


