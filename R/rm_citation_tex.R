#' Remove/Replace/Extract LaTeX Citations
#' 
#' Remove/replace/extract LaTeX citations from a string.
#'  
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string).
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the dates are extracted into a 
#' list of vectors.
#' @param split logical.  If \code{TRUE} and \code{extract = TRUE} the bibkey 
#' will be removed from the LaTeX citation code curly braces and split on 
#' commas.
#' @param unlist.extract  logical.  If \code{TRUE} the splits from between LaTeX 
#' citation code curly braces will be unlisted. if \code{FALSE} the list 
#' structure (1 per citation code curly brace) will be retained.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Additional arguments passed to 
#' \code{\link[qdapRegex]{rm_default}}.
#' @return Returns a character string with citations (bibkeys) removed.
#' @keywords citation bibkey
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_citation_tex
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c(
#'     "I say \\parencite*{Ted2005, Moe1999} go there in \\textcite{Few2010} said to.",
#'     "But then \\authorcite{Ware2013} said it was so \\pcite[see][p. 22]{Get9999c}.", 
#'     "then I \\citep[p. 22]{Foo1882c} him")
#' 
#' rm_citation_tex(x)
#' rm_citation_tex(x, replacement="[[CITATION]]")
#' ex_citation_tex(x)
rm_citation_tex <- function(text.var, trim = !extract, clean = TRUE, 
    pattern = "@rm_citation_tex", replacement = "", 
    extract = FALSE, split = extract, unlist.extract = TRUE,
    dictionary = getOption("regex.library"), ...){

    out <- rm_default(text.var = text.var, pattern = pattern, trim = trim, 
        extract =extract, clean  = clean, replacement = replacement, 
        dictionary = dictionary, ...)

    if (!extract) return(out)

    if (split) {
        out <- lapply(out, function(x) {
            y <- rm_curly(x, extract =TRUE)
            z <- lapply(y, function(x) strsplit(x, "\\s*,\\s*")[[1]])
            if (unlist.extract) z <- unlist(z)
            z
        })
    }
    ext(out)
} 

#' @export
#' @rdname rm_citation_tex
ex_citation_tex <- hijack(rm_citation_tex, extract=TRUE)

