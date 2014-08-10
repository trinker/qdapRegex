#' Remove/Replace/Extract Strings Between 2 Markers
#' 
#' Remove/replace/extract strings bounded between a left and right marker.
#' 
#' @param text.var The text variable.
#' @param left A vector of character or numeric symbols as the left edge to 
#' extract.
#' @param right A vector of character or numeric symbols as the right edge to 
#' extract.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the strings are extracted into a 
#' list of vectors.
#' @param include.markers logical.  If \code{TRUE} and \code{extract = TRUE} returns 
#' the markers (left/right) and the text between.
#' @param merge logical.  If \code{TRUE} the results of each bracket type will 
#' be merged by string.  \code{FALSE} returns a named list of lists of vectors 
#' of markered text per marker type.  
#' @return Returns a character string with markers removed.
#' @export
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[qdapRegex]{rm_bracket}}
#' @examples
#' x <- c("Where is the /big dog#?",
#'     "I think he's @@arunning@@b with /little cat#.")
#' 
#' rm_between(x, "@@a", "@@b")
#' rm_between(x, "@@a", "@@b", extract=TRUE)
#' rm_between(x, c("/", "@@a"), c("#", "@@b"))
#' rm_between(x, c("/", "@@a"), c("#", "@@b"), extract=TRUE)
#' 
#' x2 <- c("Where is the L1big dogL2?",
#'     "I think he's 98running99 with L1little catL2.")
#' rm_between(x2, c("L1", 98), c("L2", 99))
#' rm_between(x2, c("L1", 98), c("L2", 99), extract=TRUE)
#' 
#' state <- c("Computer is fun. Not too fun.", "No it's not, it's dumb.", 
#'     "What should we do?", "You liar, it stinks!", "I am telling the truth!", 
#'     "How can we be certain?", "There is no way.", "I distrust you.", 
#'     "What are you talking about?", "Shall we move on?  Good then.", 
#'     "I'm hungry.  Let's eat.  You already?")
#' 
#' rm_between(x2, c("is", "we"), c("too", "on"))
rm_between <- function(text.var, left, right, trim = TRUE, clean = TRUE, 
    replacement = "", extract = FALSE, include.markers = FALSE, merge =TRUE) {

    if (extract) {
        return(.genXtract(text.var, left = left, right = right, 
            with=include.markers, merge = merge))
    }

    out <- .genX(text.var, left = left, right = right, replacement=replacement)

    if (trim) out <- Trim(out)
    if (clean) {
        out <- gsub("\\s+([.!?])", "\\1", clean(out), perl=TRUE)
    }
    out
}



.genX <- 
function (text.var, left, right, missing = NULL, names = FALSE, replacement="") {
    if (length(left) != length(right)) {
        stop("left and right must be equal length") 
    }

    lside <- rside <- "[ ]*"

    specchar <- c(".", "|", "(", ")", "[", "{", "^", "$", "*", "+", "?")
    left <- .mgsub(specchar, paste0("\\", specchar), left, fixed = TRUE)
    right <- .mgsub(specchar, paste0("\\", specchar), right, fixed = TRUE)
    FUN <- function(left, right, text.var, missing, names, replace) {
        X <- sapply(text.var, function(x) gsub(paste0(lside, left, ".+?", right, rside), replace, x))
        names(X) <- NULL
        X
    }
    invisible(lapply(seq_along(left), function(i) {
        text.var <<- FUN(left[i], right[i], text.var = text.var, 
            names = names, replace=replacement)
    }))
    text.var
}


.genXtract <-
function(text.var, left, right, with = FALSE, merge = TRUE){
    if (length(left) != length(right)) {
        stop("left and right must be equal length") 
    }
    LN <- left
    RN <- right
    specchar <- c(".", "|", "(", ")", "[", "{", "^", "$", "*", "+", "?")
    left <- .mgsub(specchar, paste0("\\", specchar), left, fixed = TRUE)
    right <- .mgsub(specchar, paste0("\\", specchar), right, fixed = TRUE)
    FUN <- function(left, right, text.var, with){   
        fmt <- if (with) {
            "(%s).*?(%s)"
        } else {
            "(?<=%s).*?(?=%s)"
        }
        re <- sprintf(fmt, as.character(left), as.character(right))
        if(length(text.var)==1){
            unlist(regmatches(text.var, gregexpr(re, text.var, perl=TRUE)))
        }else{  
            regmatches(text.var, gregexpr(re, text.var, perl=TRUE)) 
        }
    }
    out <- invisible(lapply(seq_along(left), function(i) {
        FUN(left[i], right[i], text.var = text.var, with = with)
    }))
    names(out) <- paste(LN, " : ", RN)
    if (length(left) == 1) {
        return(unlist(out, recursive = FALSE))
    } else {
        if (merge) {
            out <- invisible(lapply(seq_along(text.var), function(i) {
                unlist(invisible(lapply(seq_along(out), function(j) {
                    out[[j]][[i]]
                })))
            }))            
        }
    }
    out
}

