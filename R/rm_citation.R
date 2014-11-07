#' Remove/Replace/Extract Citations
#' 
#' Remove/replace/extract APA6 style citations from a string.
#'  
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector (see \bold{Details} for additional information).  Default,
#' \code{@@rm_citation} uses the \code{rm_citation} regex from the regular 
#' expression dictionary from the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the dates are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Ignored.
#' @return Returns a character string with citations removed.
#' @keywords citation
#' @details The default regular expression used by \code{rm_citation} finds 
#' in-text and parenthetical citations.  This behavior can be altered by using a 
#' secondary regular expression from the \code{\link[qdapRegex]{regex_usa}} 
#' data (or other dictionary) via (\code{pattern = "@@rm_citation2"} or 
#' \code{pattern = "@@rm_citation3"}). See \bold{Examples} for example usage. 
#' @export
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' ## All Citations
#' x <- c("Hello World (V. Raptor, 1986) bye",
#'     "Narcissism is not dead (Rinker, 2014)",
#'     "The R Core Team (2014) has many members.",
#'     paste("Bunn (2005) said, \"As for elegance, R is refined, tasteful, and",
#'         "beautiful. When I grow up, I want to marry R.\""),
#'     "It is wrong to blame ANY tool for our own shortcomings (Baer, 2005).",
#'     "Wickham's (in press) Tidy Data should be out soon.",
#'     "Rinker's (n.d.) dissertation not so much.",
#'     "I always consult xkcd comics for guidance (Foo, 2012; Bar, 2014).",
#'     "Uwe Ligges (2007) says, \"RAM is cheap and thinking hurts\""
#' )
#' 
#' rm_citation(x)
#' rm_citation(x, extract=TRUE)
#' rm_citation(x, replacement="[CITATION HERE]")
#' \dontrun{
#' qdapTools::vect2df(sort(table(unlist(rm_citation(x, extract=TRUE)))), 
#'     "citation", "count")
#' }
#' 
#' ## In-Text
#' rm_citation(x, extract=TRUE, pattern="@@rm_citation2")
#' 
#' ## Parenthetical
#' rm_citation(x, extract=TRUE, pattern="@@rm_citation3")
rm_citation <- 
function (text.var, trim = !extract, clean = TRUE, pattern = "@rm_citation", 
    replacement = "", extract = FALSE, dictionary = getOption("regex.library"), 
    ...) {
    pattern <- reg_check(pattern = pattern, dictionary = dictionary)
    if (extract) {
        if (!trim) {
            return(stringi::stri_extract_all_regex(text.var, 
                pattern))
        }
        return(lapply(stringi::stri_extract_all_regex(text.var, 
            pattern), Trim))
    }
    out <- stringi::stri_replace_all_regex(text.var, pattern, replacement)
    if (trim) 
        out <- Trim(out)
    if (clean) 
        out <- clean(out)
    out
}
