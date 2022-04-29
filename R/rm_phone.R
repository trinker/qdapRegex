#' Remove/Replace/Extract Phone Numbers
#' 
#' Remove/replace/extract phone numbers from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_phone} uses the 
#' \code{rm_phone} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the phone numbers are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with phone numbers removed.
#' @keywords phone telephone
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_phone
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @author \href{https://stackoverflow.com/}{stackoverflow's} Marius and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The phone regular expression was taken from: 
#' \url{https://stackoverflow.com/a/21008254/1000343}
#' @examples
#' x <- c(" Mr. Bean bought 2 tickets 2-613-213-4567 or 5555555555 call either one",
#'   "43 Butter Rd, Brossard QC K0A 3P0 - 613 213 4567", 
#'   "Please contact Mr. Bean (613)2134567",
#'   "1.575.555.5555 is his #1 number",  
#'   "7164347566",
#'   "I like 1234567 dogs"
#' )
#'
#' rm_phone(x)
#' ex_phone(x)
rm_phone <- hijack(rm_default, pattern = "@rm_phone") 

#' @export
#' @rdname rm_phone
ex_phone <- hijack(rm_phone, extract=TRUE)

