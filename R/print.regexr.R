#' Prints a regexr Object
#' 
#' Prints a \code{regexr} object
#' 
#' @param x The \code{regexr} object.
#' @param \ldots Ignored.
#' @export
#' @method print regexr
print.regexr <- function(x, ...){
    print(as.character(x))
}