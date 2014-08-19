#' Escape Strings From Parsing
#' 
#' Escape literal beginning at (@@) strings from \pkg{qdapRegex} parsing.
#' 
#' @param pattern A character string that should not be parsed.  
#' @return Returns a character vector of the class "escape" and "character".
#' @keywords escape noparse
#' @details Many \pkg{qdapRegex} functions parse \code{pattern} strings 
#' beginning with an at character (@@) and comparing against the default and 
#' supplemental (\code{\link[qdapRegex]{regex_supplement}}) dictionaries.  This 
#' means that a string such as "@@before_" will be returned as 
#' "\\\\w+?(?= ((\%s|\%s)\\\\b))".  If the user wanted to use a regular 
#' expression that was literally "@@before_" the \code{escape} function classes 
#' the character string and tells the \pkg{qdapRegex} functions not to parse it 
#' (i.e., keep it as a literal string).
#' @export
#' @include rm_default.R utils.R
#' @examples
#' escape("@@rm_caps")
#' 
#' x <- "...character vector.  Default, \\code{@@rm_caps} uses..."
#' 
#' rm_default(x, pattern = "@@rm_caps")
#' rm_default(x, pattern = escape("@@rm_caps"))
escape <- function(pattern) {

    stopifnot(is.character(pattern))
    class(pattern) <- unique(c("escape", class(pattern)))

    pattern

}
