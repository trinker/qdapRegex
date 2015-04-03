#' Group Wrap and `or` Concatenate Elements
#' 
#' A wrapper for \code{group} and \code{pastex} that wraps each sub-expression 
#' element with grouping parenthesis and then concatenate/joins grouped strings 
#' with a regex `or` ("|").  Equivalent to \code{pastex(group(...), sep = "|")}.
#' 
#' @param \ldots Regular expressions to paste together or a named expression 
#' from the default regular expression dictionary prefixed with single at 
#' (\code{@@}) (e.g., \code{"@@rm_hash"}) or a regular expression from 
#' \code{\link[qdapRegex]{regex_supplement}} dictionary prefixed with an at 
#' (\code{@@}) (e.g., \code{"@@time_12_hours"}).
#' @param group.all logical.  If \code{TRUE} the resulting `or` concatenated 
#' elements will be wrapped with grouping parenthesis.
#' @export 
#' @examples
#' group_or("@@rm_hash", "@@rm_tag")
#' group_or("them", "those", "that", "these")
#' group_or("them", "those", "that", "these", group.all = FALSE)
group_or <- function(..., group.all = TRUE) {

    if (isTRUE(group.all)) {
        group(pastex(group(...)))
    } else {
        pastex(group(...))
    }

}
