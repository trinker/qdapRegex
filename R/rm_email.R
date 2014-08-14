#' Remove/Replace/Extract Email Addresses
#' 
#' Remove/replace/extract email addresses from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_email} uses the 
#' \code{rm_email} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the emails are extracted into a list 
#' of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with email addresses removed.
#' @keywords email
#' @export
#' @author Barry Rowlingson and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The email regular expression was taken from: 
#' \url{http://stackoverflow.com/a/25077704/1000343}
#' @seealso \code{\link[base]{gsub}}
#' @examples
#' x <- paste("fred is fred@@foo.com and joe is joe@@example.com - but @@this is a 
#'     twitter handle for twit@@here.com or foo+bar@@google.com/fred@@foo.fnord")
#' 
#' x2 <- c("fred is fred@@foo.com and joe is joe@@example.com - but @@this is a", 
#'     "twitter handle for twit@@here.com or foo+bar@@google.com/fred@@foo.fnord", 
#'     "hello world")
#' 
#' rm_email(x)
#' rm_email(x, replacement = '<a href="mailto:\\1" target="_blank">\\1</a>')
#' rm_email(x, extract=TRUE)
#' rm_email(x2, extract=TRUE)
rm_email <- function(text.var, trim = TRUE, clean = TRUE, 
    pattern = "@rm_email", replacement = "", extract = FALSE, 
	dictionary = getOption("regex.library"), ...) {

	pattern <- reg_check(pattern = pattern, dictionary = dictionary)

    if (extract) {
        return(regmatches(text.var, gregexpr(pattern, text.var, perl = TRUE)))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}
