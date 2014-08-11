#' Remove/Replace/Extract Function Generator
#' 
#' Remove/replace/extract substrings from a string.  A function generator used 
#' to make regex functions that operates typical of other \pkg{qdapRegex} \code{rm_XXX} functions.
#' 
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} strings are extracted into a list of 
#' vectors.
#' @param \dots A default \code{text.var} or other arguments passed to 
#' \code{\link[base]{gsub}}.
#' @return Returns a function that operates typical of other \pkg{qdapRegex} 
#' \code{rm_XXX} functions but with user defined defaults.
#' @export
#' @seealso \code{\link[pryr]{partial}}
#' @examples
#' rm_digit <- rm_(pattern="[0-9]")
#' rm_digit("  I 12 li34ke ice56cream78.  ")
#' 
#' rm_lead <- rm_(pattern="^\\s+", trim = FALSE, clean = FALSE)
#' rm_lead("  I 12 li34ke ice56cream78.    ")
#' 
#' rm_all_except_letters <- rm_(pattern="[^ a-zA-Z]")
#' rm_all_except_letters("  I 12 li34ke ice56cream78.    ")
#' 
#' extract_consec_num <- rm_(pattern="[0-9]+", extract = TRUE)
#' extract_consec_num("  I 12 li34ke ice56cream78.  ")
rm_ <- function(trim = TRUE, clean = TRUE, pattern, replacement = "", 
	extract = FALSE, ...){

    if(missing(pattern)) warning("Did not supply a default to `pattern`")

    pryr::partial(rm_default, trim = trim, clean = clean, pattern = pattern, 
        replacement = replacement, extract = extract, ...)

}

