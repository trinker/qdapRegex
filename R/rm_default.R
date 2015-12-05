#' Remove/Replace/Extract Template
#' 
#' Remove/replace/extract substring from a string.  This is the template used by
#' other \pkg{qdapRegex} \code{rm_XXX} functions.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the strings are extracted into a list 
#' of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with substring removed.
#' @keywords extract sub 
#' @seealso \code{\link[qdapRegex]{rm_}},
#' \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_default
#' @examples
#' ## Built in regex dictionary
#' rm_default("I live in Buffalo, NY 14217", pattern="@@rm_city_state_zip")
#' 
#' ## User defined regular expression
#' pat <- "(\\s*([A-Z][\\w-]*)+),\\s([A-Z]{2})\\s(?<!\\d)\\d{5}(?:[ -]\\d{4})?\\b"
#' rm_default("I live in Buffalo, NY 14217", pattern=pat)
rm_default <- function(text.var, trim = !extract, clean = TRUE, pattern, 
	replacement = "", extract = FALSE, 
	dictionary = getOption("regex.library"), ...) {

	pattern <- reg_check(pattern = pattern, dictionary = dictionary)
	
    if (extract) {
    	if (!trim) {
            return(ext(stringi::stri_extract_all_regex(text.var, pattern)))
    	}
    	return(ext(lapply(stringi::stri_extract_all_regex(text.var, pattern), Trim)))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}



 

#' @export
#' @rdname rm_default
ex_default <- hijack(rm_default, extract=TRUE)

