#' Boundary Wrap (Bind) and `or` Concatenate Elements
#' 
#' A wrapper for \code{bind} and \code{pastex} that wraps each sub-expression 
#' element with left/right boundaries (\code{\\b} by default) and then 
#' concatenate/joins bound strings with a regex `or` ("|").  Equivalent to 
#' \code{pastex(bind(...), sep = "|")}.
#' 
#' @param \ldots Regular expressions to paste together or a named expression 
#' from the default regular expression dictionary prefixed with single at 
#' (\code{@@}) (e.g., \code{"@@rm_hash"}) or a regular expression from 
#' \code{\link[qdapRegex]{regex_supplement}} dictionary prefixed with an at 
#' (\code{@@}) (e.g., \code{"@@time_12_hours"}).
#' @param left A single length character vector to use as the left bound.
#' @param right A single length character vector to use as the right bound.
#' @param group.all logical.  If \code{TRUE} the resulting `or` concatenated 
#' elements will be wrapped with grouping parenthesis.
#' @export 
#' @examples
#' bind_or(LETTERS)
#' bind_or("them", "those", "that", "these")
#' bind_or("them", "those", "that", "these", group.all = FALSE)
bind_or <- function (..., group.all = TRUE, left = "\\b", right = left) {
    if (isTRUE(group.all)) {
        group(pastex(bind(..., left = left, right = right)))
    }
    else {
        pastex(bind(..., left = left, right = right))
    }
}
