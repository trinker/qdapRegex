#' A Cheat Sheet of Common Regex Task Chunks
#' 
#' Print a cheat sheet of common regex task chunks.  \code{cheat} prints a left 
#' justified version of \code{\link[qdapRegex]{regex_cheat}}.
#' 
#' @param dictionary A dictionary of cheat terms.  Default is 
#' \code{\link[qdapRegex]{regex_cheat}}.
#' @param print logical.  If \code{TRUE} the left justified output is printed 
#' to the console.
#' @return Prints a cheat sheet of common regex tasks such as lookaheads.  
#' Invisibly returns \code{\link[qdapRegex]{regex_cheat}}.
#' @export
#' @seealso \code{\link[qdapRegex]{regex_cheat}}
#' @examples
#' cheat()
cheat <-
function(dictionary = qdapRegex::regex_cheat, print = TRUE){

    WD <- options()[["width"]]
    options(width = 3000)
    on.exit(options(width = WD))
    chars <- sapply(1:ncol(dictionary), function(i){
        max(nchar(unlist(dictionary[[i]], colnames(dictionary)[i])))
    })

    m <- format(dictionary, justify = "left")
    colchars <- nchar(colnames(m))
    colnames(m) <- toupper(paste0(
        colnames(dictionary),
        sapply(chars - colchars, function(x) paste(rep(" ", x), collapse=""))
    ))
    if (print) print(m)
    invisible(dictionary)
}
