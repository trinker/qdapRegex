#' Group Regular Expressions
#' 
#' \code{group} - A wrapper for \code{paste(collapse="|")} that also searches 
#' the default and supplemental (\code{\link[qdapRegex]{regex_supplement}}) 
#' dictionaries for regular expressions before pasting them together with a pipe 
#' (\code{|}) separator.
#' 
#' @param \ldots Regular expressions to add grouping parenthesis to a named 
#' expression from the default regular expression dictionary prefixed with 
#' single at (\code{@@}) (e.g., \code{"@@rm_hash"}) or a regular expression from 
#' \code{\link[qdapRegex]{regex_supplement}} dictionary prefixed with an at 
#' (\code{@@}) (e.g., \code{"@@time_12_hours"}).
#' @param left A single length character vector to use as the left bound.
#' @param right A single length character vector to use as the right bound.
#' @param dictionary A dictionary of canned regular expressions to search within.
#' @return Returns a single string of regular expressions with grouping 
#' parenthesis added.
#' @keywords group regex 
#' @export
#' @examples
#' group(LETTERS)
#' group(1)
#' 
#' (grouped <- group("(the|them)\\b", "@@rm_zip"))
#' pastex(grouped)
group <- function(..., left="(", right = ")", 
    dictionary = getOption("regex.library")){
    out <- lapply(list(...), function(x) {
        if (length(x) > 1) return(x)
        reg_check(x, dictionary = dictionary)
    })
    paste0(left, unlist(out), right)
}








