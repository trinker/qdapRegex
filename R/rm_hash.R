#' Remove/Replace/Extract Hash Tags
#' 
#' Remove/replace/extract hash tags from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_hash} uses the 
#' \code{rm_hash} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the hash tags are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with hash tags removed.
#' @keywords hash twitter
#' @author \href{https://stackoverflow.com/}{stackoverflow's} hwnd and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The hash tag regular expression was taken from: 
#' \url{https://stackoverflow.com/a/25096474/1000343}
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_hash
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c("@@hadley I like #rstats for #ggplot2 work.",
#'     "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats: 
#'         http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @@timelyportfolio",
#'     "Slides from great talk: @@ramnath_vaidya: Interactive slides from Interactive Visualization 
#'         presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1"
#' )
#' 
#' rm_hash(x)
#' rm_hash(rm_tag(x))
#' ex_hash(x)
#' 
#' ## remove just the hash symbol
#' rm_hash(x, replace="\\3")
rm_hash <- hijack(rm_default, pattern = "@rm_hash") 

#' @export
#' @rdname rm_hash
ex_hash <- hijack(rm_hash, extract=TRUE)

