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
#' character vector (see \bold{Details} for additional information).
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the n letter words are extracted into a 
#' list of vectors.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with n letter words removed.
#' @keywords words
#' @details The default regular expression used by \code{rm_nchar_words} counts 
#' letter length, not characters.  This means that apostrophes are not include 
#' in the character count.  This behavior can be altered (to include apostrophes
#' in the character count) by using a secondary regular expression from the 
#' \code{\link[qdapRegex]{RE}} data set 
#' (\code{qdapRegex::RE[["rm_nchar_words2"]]}). See \bold{Examples} for example
#' usage.  Note that \code{n} must be set manually.
#' @export
#' @author \href{http://stackoverflow.com/}{stackoverflow's} CharlieB and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The n letter/character word regular expression was taken from: 
#' \url{http://stackoverflow.com/a/25243885/1000343}
#' @seealso \code{\link[base]{gsub}}
#' @examples
#' x <- "This Jon's dogs' 'bout there in word Mike's re'y."
#' rm_nchar_words(x, 4)
#' rm_nchar_words(x, 4, extract=TRUE)
#' 
#' ## Count characters (apostrophes and letters)
#' n <- 5
#' rm_nchar_words(x, extract=TRUE, pattern = sprintf(qdapRegex::RE[["rm_nchar_words2"]], n))
#' 
#' \dontrun{
#' ## Larger example
#' library(qdap)
#' rm_nchar_words(hamlet$dialogue, 5, extract=TRUE)
#' }
rm_nchar_words <- function(text.var, n, trim = TRUE, clean = TRUE,
    pattern = sprintf(qdapRegex::RE[["rm_nchar_words"]], n), 
	replacement = "", extract = FALSE, ...) {

    if (extract) {
        return(lapply(regmatches(text.var, gregexpr(pattern, text.var, 
            perl = TRUE)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}


