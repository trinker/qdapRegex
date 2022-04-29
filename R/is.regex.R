#' Test Regular Expression Validity
#' 
#' Acts as a logical test of a regular expression's validity.  \code{is.regex} 
#' uses \code{\link[base]{gsub}} and tests for errors to determine a regular 
#' expression's validity.  The regular expression must conform to R's regular 
#' expression rules (see \code{?regex} for details about how R handles regular 
#' expressions).
#' 
#' @param pattern A regular expression to be tested.
#' @return Returns a logical (\code{TRUE} is a valid regular expression).
#' @export
#' @seealso \code{\link[base]{gsub}}
#' @examples
#' is.regex("I|***")
#' is.regex("I|i")
#' 
#' sapply(regex_usa, is.regex)
#' sapply(regex_supplement, is.regex) ## `version` is not a valid regex
is.regex <- function(pattern) {

    out <- suppressWarnings(try(gsub(pattern, "", "hello", perl=TRUE), silent = TRUE))
    ifelse(inherits(out, "try-error"), FALSE, TRUE)

}
