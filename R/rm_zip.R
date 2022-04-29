#' Remove/Replace/Extract Zip Codes
#' 
#' Remove/replace/extract zip codes from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_zip} uses the 
#' \code{rm_zip} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the zip codes are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with U.S. 5 and 5+4 zip codes removed.
#' @keywords zip
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_zip
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @author \href{https://stackoverflow.com/}{stackoverflow's} hwnd and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The time regular expression was taken from: 
#' \url{https://stackoverflow.com/a/25223890/1000343}
#' @examples
#' x <- c("Mr. Bean bought 2 tickets 2-613-213-4567",
#'   "43 Butter Rd, Brossard QC K0A 3P0 - 613 213 4567", 
#'   "Rat Race, XX, 12345",
#'   "Ignore phone numbers(613)2134567",
#'   "Grab zips with dashes 12345-6789 or no space before12345-6789",  
#'   "Grab zips with spaces 12345 6789 or no space before12345 6789",
#'   "I like 1234567 dogs"
#' )
#'
#' rm_zip(x)
#' ex_zip(x)
#' 
#' ## ======================= ##
#' ## BUILD YOUR OWN FUNCTION ##
#' ## ======================= ##
#' 
#' ## example from: https://stackoverflow.com/a/26092576/1000343
#' zips <- data.frame(id = seq(1, 6), 
#'     address = c("Company, 18540 Main Ave., City, ST 12345", 
#'     "Company 18540 Main Ave. City ST 12345-0000", 
#'     "Company 18540 Main Ave. City State 12345", 
#'     "Company, 18540 Main Ave., City, ST 12345 USA", 
#'     "Company, One Main Ave Suite 18540m, City, ST 12345",
#'     "company 12345678")
#' )
#' 
#' ## Function to grab even if a character follows the zip
#' 
#' # paste together a more flexible regular expression    
#' pat <- pastex(
#'     "@@rm_zip", 
#'     "(?<!\\d)\\d{5}(?!\\d)",
#'     "(?<!\\d)\\d{5}-\\d{4}(?!\\d)"
#' )
#' # Create your own function that extract is set to TRUE
#' ex_zip2 <- rm_(pattern=pat, extract=TRUE)
#' ex_zip2(zips$address)
#' 
#' ## Function to extract just 5 digit zips
#' 
#' ex_zip3 <- rm_(pattern="(?<!\\d)\\d{5}(?!\\d)", extract=TRUE)
#' ex_zip3(zips$address)
rm_zip <- hijack(rm_default, pattern = "@rm_zip") 

#' @export
#' @rdname rm_zip
ex_zip <- hijack(rm_zip, extract=TRUE)

