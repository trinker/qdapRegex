#' Remove/Replace/Extract Abbreviations
#' 
#' Remove/replace/extract abbreviations from a string containing lower case or 
#' capital letters followed by a period and then an optional space (this must be 
#' repeated 2 or more times).
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_abbreviation} uses the 
#' \code{rm_abbreviation} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the abbreviations are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with abbreviations removed.
#' @family rm_ functions
#' @keywords abbreviation
#' @include utils.R
#' @export
#' @rdname rm_abbreviation
#' @include rm_default.R utils.R
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c("I want $2.33 at 2:30 p.m. to go to A.n.p.",
#'     "She will send it A.S.A.P. (e.g. as soon as you can) said I.",
#'     "Hello world.", "In the U. S. A.")
#' rm_abbreviation(x)
#' ex_abbreviation(x)
rm_abbreviation <- hijack(rm_default, pattern = "@rm_abbreviation")
 
  

#' @export
#' @rdname rm_abbreviation
ex_abbreviation <- hijack(rm_abbreviation, extract=TRUE)

