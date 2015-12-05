#' Remove/Replace/Extract Dates
#' 
#' Remove/replace/extract dates from a string in the form of (1) XX/XX/XXXX, 
#' XX/XX/XX, XX-XX-XXXX, XX-XX-XX, XX.XX.XXXX, or XX.XX.XX OR 
#' (2) March XX, XXXX or Mar XX, XXXX OR (3) both forms. 
#'  
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector (see \bold{Details} for additional information).  Default,
#' \code{@@rm_date} uses the \code{rm_date} regex from the regular expression 
#' dictionary from the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the dates are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with dates removed.
#' @keywords date
#' @details The default regular expression used by \code{rm_date} finds numeric 
#' representations not word/abbreviations.  This means that 
#' \code{"June 13, 2002"} is not matched.  This behavior can be altered (to 
#' include month names/abbreviations) by using a secondary regular expression 
#' from the \code{\link[qdapRegex]{regex_usa}} data (or other dictionary) via 
#' (\code{pattern = "@@rm_date2"}, \code{pattern = "@@rm_date3"}, or 
#' \code{pattern = "@@rm_date4"}). See 
#' \bold{Examples} for example usage. 
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_date
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' ## Numeric Date Representation
#' x <- paste0("Format dates as 04/12/2014, 04-12-2014, 04.12.2014. or",
#'     " 04/12/14 but leaves mismatched: 12.12/2014")
#' rm_date(x)
#' ex_date(x)
#' 
#' ## Word/Abbreviation Date Representation
#' x2 <- paste0("Format dates as Sept 09, 2002 or October 22, 1887",
#'   "but not 04-12-2014 and may match good 00, 9999")
#' rm_date(x2, pattern="@@rm_date2")
#' ex_date(x2, pattern="@@rm_date2")
#' 
#' 
#' ## Year-Month-Day Representation
#' x3 <- sprintf("R uses time in this format %s.", Sys.time())
#' rm_date(x3, pattern="@@rm_date3")
#' 
#' ## Grab all types
#' ex_date(c(x, x2, x3), pattern="@@rm_date4")
rm_date <- hijack(rm_default, pattern = "@rm_date") 

#' @export
#' @rdname rm_date
ex_date <- hijack(rm_date, extract=TRUE)

