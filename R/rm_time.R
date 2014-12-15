#' Remove/Replace/Extract Time
#' 
#' Remove/replace/extract time from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector (see \bold{Details} for additional information).  Default, 
#' \code{@@rm_time} uses the \code{rm_time} regex from the regular expression 
#' dictionary from the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the times are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with time removed.
#' @keywords time
#' @details The default regular expression used by \code{rm_time} finds 
#' time with no AM/PM.  This behavior can be altered by using a 
#' secondary regular expression from the \code{\link[qdapRegex]{regex_usa}} 
#' data (or other dictionary) via (\code{pattern = "@@rm_time2"}. See 
#' \bold{Examples} for example usage. 
#' @export
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @author \href{http://stackoverflow.com/}{stackoverflow's} hwnd and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The time regular expression was taken from: 
#' \url{http://stackoverflow.com/a/25111133/1000343}
#' @examples
#' x <-  c("R uses 1:5 for 1, 2, 3, 4, 5.", 
#'     "At 3:00 we'll meet up and leave by 4:30:20",
#'     "We'll meet at 6:33.", "He ran it in :22.34")
#'
#' rm_time(x)
#' rm_time(x, extract=TRUE)
#' 
#' ## With AM/PM
#' x <- c(
#'     "I'm getting 3:04 AM just fine, but...",
#'     "for 10:47 AM I'm getting 0:47 AM instead.",
#'     "no time here",
#'     "Some time has 12:04 with no AM/PM after it",
#'     "Some time has 12:04 a.m. or the form 1:22 pm"
#' )
#' 
#' rm_time(x, extract=TRUE)
#' rm_time(x, pat="@@rm_time2", extract=TRUE)
#' rm_time(x, pat="@@rm_time2")
#' rm_time(x, pat=pastex("@@rm_time2", "@@rm_time"), extract=TRUE)
rm_time <- hijack(rm_default, pattern = "@rm_time")
