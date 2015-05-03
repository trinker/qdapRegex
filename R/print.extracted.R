#' Prints a extracted Object
#' 
#' Prints a \code{extracted} object
#' 
#' @param x The \code{extracted} object.
#' @param \ldots Ignored.
#' @export
#' @method print extracted
print.extracted <- function(x, ...){
    class(x) <- "list"
    print(x)
}