#' Remove/Replace/Extract Person Tags
#' 
#' Remove/replace/extract person tags from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_tag} uses the 
#' \code{rm_tag} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the person tags are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with person tags removed.
#' @keywords person tag twitter
#' @details The default regex pattern \code{"(?<![@@\\w])@@([a-z0-9_]+)\\b"} is more liberal and 
#' searches for the at (@@) symbol followed by any word.  This can be accessed
#' via \code{pattern = "@@rm_tag"}.  
#' \href{https://support.twitter.com/articles/101299-why-can-t-i-register-certain-usernames}{Twitter} 
#' user names are more constrained.  A second regex 
#' (\code{"(?<![@@\\w])@@([a-z0-9_]{1,15})\\b"}) is provide that contains the 
#' latter word to substring that begins with an at (@@) followed by a word 
#' composed of alpha-numeric characters and underscores, no longer than 15 
#' characters.  This can be accessed via \code{pattern = "@@rm_tag2"} (see 
#' \bold{Examples}).
#' @export
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c("@@hadley I like #rstats for #ggplot2 work.",
#'     "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats:
#'         http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @@timelyportfolio",
#'     "Slides from great talk: @@ramnath_vaidya: Interactive slides from Interactive Visualization
#'         presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1",
#'     "tyler.rinker@@gamil.com is my email", 
#'     "A non valid Twitter is @@abcdefghijklmnopqrstuvwxyz"
#' )
#' 
#' rm_tag(x)
#' rm_tag(rm_hash(x))
#' rm_tag(x, extract=TRUE)
#' 
#' ## more restrictive Twitter regex
#' rm_tag(x, extract=TRUE, pattern="@@rm_tag2") 
rm_tag <- function(text.var, trim = !extract, clean = TRUE, pattern = "@rm_tag", 
	replacement = "", extract = FALSE, dictionary = getOption("regex.library"), 
	...) {

	pattern <- reg_check(pattern = pattern, dictionary = dictionary)

    if (extract) {
    	if (!trim) {
            return(stringi::stri_extract_all_regex(text.var, pattern))
    	}
    	return(lapply(return(stringi::stri_extract_all_regex(text.var, pattern)), Trim))
    }

    out <- gsub(pattern, replacement, text.var, perl=TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}

