#' Combines a extracted Object
#' 
#' Combines a extracted object
#' 
#' @param x The extracted object
#' @param \ldots ignored
#' @export
#' @method c extracted
c.extracted <- function(x, ...){
    unlist(x)
}