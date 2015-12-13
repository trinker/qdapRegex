#' Remove/Replace/Extract Function Generator
#' 
#' Remove/replace/extract substrings from a string.  A function generator used 
#' to make regex functions that operate typical of other \pkg{qdapRegex} 
#' \code{rm_XXX} functions.  Use \code{rm_} for removal and \code{ex_} for 
#' extraction.
#' 
#' @param \ldots Arguments passed to \code{\link[qdapRegex]{rm_default}}.  
#' Generally, \code{pattern} and \code{extract} are the most useful parameters 
#' to change.  Arguments that can be set include:
#' \describe{
#' \item{text.var}{The text variable.}
#' \item{trim}{logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.}
#' \item{clean}{logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.}
#' \item{pattern}{A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.}  
#' \item{replacement}{Replacement for matched \code{pattern}.}
#' \item{extract}{logical.  If \code{TRUE} strings are extracted into a list of 
#' vectors.}
#' \item{dictionary}{A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.}
#' \item{\dots}{Other arguments passed to \code{\link[base]{gsub}}.}
#' }
#' @return Returns a function that operates typical of other \pkg{qdapRegex} 
#' \code{rm_XXX} functions but with user defined defaults.
#' @export
#' @rdname rm_
#' @seealso \code{\link[qdapRegex]{rm_default}}
#' @examples
#' rm_digit <- rm_(pattern="[0-9]")
#' rm_digit("  I 12 li34ke ice56cream78.  ")
#' 
#' rm_lead <- rm_(pattern="^\\s+", trim = FALSE, clean = FALSE)
#' rm_lead("  I 12 li34ke ice56cream78.    ")
#' 
#' rm_all_except_letters <- rm_(pattern="[^ a-zA-Z]")
#' rm_all_except_letters("  I 12 li34ke ice56cream78.    ")
#' 
#' extract_consec_num <- rm_(pattern="[0-9]+", extract = TRUE)
#' extract_consec_num("  I 12 li34ke ice56cream78.  ")
#' 
#' ## Using the supplemental dictionary dataset:
#' x <- "A man lives there!  The dog likes it. I want the map. I want an apple."
#' 
#' extract_word_after_the <- rm_(extract=TRUE, pattern="@@after_the")
#' extract_word_after_a <- rm_(extract=TRUE, pattern="@@after_a")
#' extract_word_after_the(x)
#' extract_word_after_a(x)
#' 
#' f <- rm_(pattern="@@time_12_hours")
#' f("I will go at 12:35 pm")
#' 
#' x <- c(
#'     "test@@aol.fg.com",
#'     "test@@hotmail.com",
#'     "test@@xyzrr.lk.edu",
#'     "test@@abc.xx.zz.vv.net"
#' )
#' 
#' file_ext2 <- rm_(pattern="(?<=\\.)[a-z]*$", extract=TRUE)
#' tools::file_ext(x)
#' file_ext2(x)
rm_ <- function(...){

    rm_raw <- rm_default

    args <- list(...)
    invisible(lapply(seq_along(args), function(i) {
        formals(rm_raw)[[names(args)[i]]] <<- args[[i]]
    }))
    rm_raw
}

#' @export
#' @rdname rm_
ex_ <- function(...){

    ex_raw <- ex_default

    args <- list(...)
    invisible(lapply(seq_along(args), function(i) {
        formals(ex_raw)[[names(args)[i]]] <<- args[[i]]
    }))
    ex_raw
}

